import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/index.dart';
import '../database/index.dart';
import '../models/index.dart';
import 'index.dart';

class TestCubit extends Cubit<TestState> {
  final TestService testService = TestService();
  late StreamSubscription<List<TestModel>> testModelSubscription;
  late StreamSubscription<List<QuestionModel>> questionModelSubscription;
  late StreamSubscription<List<OptionModel>> optionModelSubscription;

  TestCubit() : super(const TestState()) {
    streamTestModel();
    streamQuestionModel();
    streamOptionModel();
  }

  void streamTestModel() {
    testModelSubscription = testService.getTestModel().listen((testModel) {
      // Update state with the filtered testModel
      setTestModel(testModel);
      debugPrint(testModel.toString());
    }, onError: (error) {
      debugPrint('Error fetching testModel results: $error');
    });
  }

  void streamQuestionModel() {
    questionModelSubscription =
        testService.getQuestionModel().listen((questionModel) {
      // Update state with the filtered questionModel
      setQuestionModel(questionModel);
      debugPrint(testModel.toString());
    }, onError: (error) {
      debugPrint('Error fetching questionModel results: $error');
    });
  }

  void streamOptionModel() {
    optionModelSubscription =
        testService.getOptionModel().listen((optionModel) {
      // Update state with the filtered optionModel
      setOptionModel(optionModel);
      debugPrint(testModel.toString());
    }, onError: (error) {
      debugPrint('Error fetching optionModel results: $error');
    });
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the Cubit is closed
    testModelSubscription.cancel();
    questionModelSubscription.cancel();
    optionModelSubscription.cancel();
    return super.close();
  }

  Future<void> setTest() async {
    try {
      setStatus(Status.loading);
      String newTestId = await testService
          .setTest(
              testName,
              testDescription,
              timeStampHour * 3600000 +
                  timeStampMinute * 60000 +
                  timeStampSecond * 1000,
              FirebaseAuth.instance.currentUser!.uid,
              [],
              testCode,
              testDate,
              '',
              '',
              [],
              0,
              '')
          .whenComplete(() => setStatus(Status.success));
      debugPrint(newTestId);
      setTestId(newTestId);
    } catch (e) {
      setError(e.toString());
      setStatus(Status.failure);
    }
  }

  Future<void> setQuestion() async {
    try {
      setStatus(Status.loading);
      String newQuestionId = await testService
          .setQuestion(
            questionText,
            questionImage,
            rightOptionId,
            testId,
            questionMarks,
            negativeMarks,
            questionIndex,
          )
          .whenComplete(() => setStatus(Status.success));
      setQuestionId(newQuestionId);
    } catch (e) {
      setError(e.toString());
      setStatus(Status.failure);
    }
  }

  Future<void> addQuestionImage() async {
    String? image = await uploadPhoto();
    setQuestionImage(image!);
  }

  Future<void> addOptionImage() async {
    String? image = await uploadPhoto();
    setOptionImage(image!);
  }

  Future<void> setOption() async {
    try {
      setStatus(Status.loading);
      await testService
          .setOption(
            optionText,
            optionImage,
            questionId,
            optionIndex,
            isRight,
          )
          .whenComplete(() => setStatus(Status.success));
    } catch (e) {
      setError(e.toString());
      setStatus(Status.failure);
    }
  }

  // setter
  void setTestModel(List<TestModel> testModel) =>
      emit(state.copyWith(testModel: testModel));
  void setOptionModel(List<OptionModel> optionModel) =>
      emit(state.copyWith(optionModel: optionModel));
  void setQuestionModel(List<QuestionModel> questionModel) =>
      emit(state.copyWith(questionModel: questionModel));
  void setTestId(String testId) => emit(state.copyWith(testId: testId));
  void setQuestionId(String questionId) =>
      emit(state.copyWith(questionId: questionId));
  void setOptionId(String optionId) => emit(state.copyWith(optionId: optionId));
  void setTestName(String testName) => emit(state.copyWith(testName: testName));
  void setTestDescription(String testDescription) =>
      emit(state.copyWith(testDescription: testDescription));
  void setTestTimeStamp(int testTimeStamp) =>
      emit(state.copyWith(testTimeStamp: testTimeStamp));
  void setTimeStampHour(int timeStampHour) =>
      emit(state.copyWith(timeStampHour: timeStampHour));
  void setTimeStampMinute(int timeStampMinute) =>
      emit(state.copyWith(timeStampMinute: timeStampMinute));
  void setTimeStampSecond(int timeStampSecond) =>
      emit(state.copyWith(timeStampSecond: timeStampSecond));
  void setTestCode(String testCode) => emit(state.copyWith(testCode: testCode));
  void setTestDate(int testDate) => emit(state.copyWith(testDate: testDate));
  void setTestEligibility(String testEligibility) =>
      emit(state.copyWith(testEligibility: testEligibility));
  void setTestSyllabus(String testSyllabus) =>
      emit(state.copyWith(testSyllabus: testSyllabus));
  void setTestAnswerSheet(String testAnswerSheet) =>
      emit(state.copyWith(testAnswerSheet: testAnswerSheet));
  void setResultDate(int resultDate) =>
      emit(state.copyWith(resultDate: resultDate));
  void setCurrentQuestion(String currentQuestion) =>
      emit(state.copyWith(currentQuestion: currentQuestion));
  void setQuestionIndex(int questionIndex) =>
      emit(state.copyWith(questionIndex: questionIndex));
  void setQuestionText(String questionText) =>
      emit(state.copyWith(questionText: questionText));
  void setQuestionImage(String questionImage) =>
      emit(state.copyWith(questionImage: questionImage));
  void setRightOptionId(String rightOptionId) =>
      emit(state.copyWith(rightOptionId: rightOptionId));
  void setQuestionMarks(double questionMarks) =>
      emit(state.copyWith(questionMarks: questionMarks));
  void setNegativeMarks(double negativeMarks) =>
      emit(state.copyWith(negativeMarks: negativeMarks));
  void setOptionText(String optionText) =>
      emit(state.copyWith(optionText: optionText));
  void setOptionImage(String optionImage) =>
      emit(state.copyWith(optionImage: optionImage));
  void setOptionIndex(int optionIndex) =>
      emit(state.copyWith(optionIndex: optionIndex));
  void setIsRight(bool isRight) => emit(state.copyWith(isRight: isRight));

  // getter
  List<TestModel> get testModel => state.testModel;
  List<QuestionModel> get questionModel => state.questionModel;
  List<OptionModel> get optionModel => state.optionModel;
  String get testId => state.testId;
  String get questionId => state.questionId;
  String get optionId => state.optionId;
  String get testName => state.testName;
  String get testDescription => state.testDescription;
  int get testTimeStamp => state.testTimeStamp;
  int get timeStampHour => state.timeStampHour;
  int get timeStampMinute => state.timeStampMinute;
  int get timeStampSecond => state.timeStampSecond;
  String get testCode => state.testCode;
  int get testDate => state.testDate;
  String get testEligibility => state.testEligibility;
  String get testSyllabus => state.testSyllabus;
  String get testAnswerSheet => state.testAnswerSheet;
  int get resultDate => state.resultDate;
  String get currentQuestion => state.currentQuestion;
  int get questionIndex => state.questionIndex;
  String get questionText => state.questionText;
  String get questionImage => state.questionImage;
  String get rightOptionId => state.rightOptionId;
  double get questionMarks => state.questionMarks;
  double get negativeMarks => state.negativeMarks;
  String get optionText => state.optionText;
  String get optionImage => state.optionImage;
  int get optionIndex => state.optionIndex;
  bool get isRight => state.isRight;
  String get error => state.error;
  Status get status => state.status;

  void setError(String error) => emit(state.copyWith(error: error));
  void setStatus(Status status) => emit(state.copyWith(status: status));
}

class TestState extends Equatable {
  final List<TestModel> testModel;
  final List<QuestionModel> questionModel;
  final List<OptionModel> optionModel;
  final String testId;
  final String questionId;
  final String optionId;
  final String testName;
  final String testDescription;
  final int testTimeStamp;
  final int timeStampHour;
  final int timeStampMinute;
  final int timeStampSecond;
  final String testCode;
  final int testDate;
  final String testEligibility;
  final String testSyllabus;
  final String testAnswerSheet;
  final int resultDate;
  final String currentQuestion;
  final int questionIndex;
  final String questionText;
  final String questionImage;
  final String rightOptionId;
  final double questionMarks;
  final double negativeMarks;
  final String optionText;
  final String optionImage;
  final int optionIndex;
  final bool isRight;
  final String error;
  final Status status;

  const TestState({
    this.testModel = const [],
    this.questionModel = const [],
    this.optionModel = const [],
    this.testId = '',
    this.questionId = '',
    this.optionId = '',
    this.testName = '',
    this.testDescription = '',
    this.testTimeStamp = 0,
    this.timeStampHour = 0,
    this.timeStampMinute = 0,
    this.timeStampSecond = 0,
    this.testCode = '',
    this.testDate = 0,
    this.testEligibility = '',
    this.testSyllabus = '',
    this.testAnswerSheet = '',
    this.resultDate = 0,
    this.currentQuestion = '',
    this.questionIndex = 0,
    this.questionText = '',
    this.questionImage = '',
    this.rightOptionId = '',
    this.questionMarks = 0.0,
    this.negativeMarks = 0.0,
    this.optionText = '',
    this.optionImage = '',
    this.optionIndex = 0,
    this.isRight = false,
    this.error = '',
    this.status = Status.initial,
  });

  @override
  List<Object?> get props => [
        testModel,
        questionModel,
        optionModel,
        testId,
        questionId,
        optionId,
        testName,
        testDescription,
        testTimeStamp,
        timeStampHour,
        timeStampMinute,
        timeStampSecond,
        testCode,
        testDate,
        testEligibility,
        testSyllabus,
        testAnswerSheet,
        resultDate,
        currentQuestion,
        questionIndex,
        questionText,
        questionImage,
        rightOptionId,
        questionMarks,
        negativeMarks,
        optionText,
        optionImage,
        optionIndex,
        isRight,
        error,
        status,
      ];

  TestState copyWith({
    List<TestModel>? testModel,
    List<QuestionModel>? questionModel,
    List<OptionModel>? optionModel,
    String? testId,
    String? questionId,
    String? optionId,
    String? testName,
    String? testDescription,
    int? testTimeStamp,
    int? timeStampHour,
    int? timeStampMinute,
    int? timeStampSecond,
    String? testCode,
    int? testDate,
    String? testEligibility,
    String? testSyllabus,
    String? testAnswerSheet,
    int? resultDate,
    String? currentQuestion,
    int? questionIndex,
    String? questionText,
    String? questionImage,
    String? rightOptionId,
    double? questionMarks,
    double? negativeMarks,
    String? optionText,
    String? optionImage,
    int? optionIndex,
    bool? isRight,
    String? error,
    Status? status,
  }) {
    return TestState(
      testModel: testModel ?? this.testModel,
      questionModel: questionModel ?? this.questionModel,
      optionModel: optionModel ?? this.optionModel,
      testId: testId ?? this.testId,
      questionId: questionId ?? this.questionId,
      optionId: optionId ?? this.optionId,
      testName: testName ?? this.testName,
      testDescription: testDescription ?? this.testDescription,
      testTimeStamp: testTimeStamp ?? this.testTimeStamp,
      timeStampHour: timeStampHour ?? this.timeStampHour,
      timeStampMinute: timeStampMinute ?? this.timeStampMinute,
      timeStampSecond: timeStampSecond ?? this.timeStampSecond,
      testCode: testCode ?? this.testCode,
      testDate: testDate ?? this.testDate,
      testEligibility: testEligibility ?? this.testEligibility,
      testSyllabus: testSyllabus ?? this.testSyllabus,
      testAnswerSheet: testAnswerSheet ?? this.testAnswerSheet,
      resultDate: resultDate ?? this.resultDate,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      questionIndex: questionIndex ?? this.questionIndex,
      questionText: questionText ?? this.questionText,
      questionImage: questionImage ?? this.questionImage,
      rightOptionId: rightOptionId ?? this.rightOptionId,
      questionMarks: questionMarks ?? this.questionMarks,
      negativeMarks: negativeMarks ?? this.negativeMarks,
      optionText: optionText ?? this.optionText,
      optionImage: optionImage ?? this.optionImage,
      optionIndex: optionIndex ?? this.optionIndex,
      isRight: isRight ?? this.isRight,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }
}
