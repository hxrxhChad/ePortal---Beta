import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/index.dart';

class TestService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> setTest(
      String testName,
      String testDescription,
      int testTimeStamp,
      String testAuthor,
      List<String> testParticipants,
      String testCode,
      int testDate,
      String testSyllabus,
      String testEligibilityDetails,
      List<String> testFeedback,
      int testResultDate,
      String testAnswerSheet) async {
    TestModel testModel = TestModel(
      testName: testName,
      testDescription: testDescription,
      testTimeStamp: testTimeStamp,
      testAuthor: testAuthor,
      testParticipants: testParticipants,
      testCode: testCode,
      testDate: testDate,
      testSyllabus: testSyllabus,
      testEligibilityDetails: testEligibilityDetails,
      testFeedback: testFeedback,
      testResultDate: testResultDate,
      testAnswerSheet: testAnswerSheet,
    );

    final testRef = _firestore
        .collection('tests')
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    testModel.testId = testRef.id;
    final data = testModel.toJson();

    await testRef.set(data);
    return testRef.id;
  }

  Future<String> setQuestion(
    String questionText,
    String questionImage,
    String rightOptionId,
    String testId,
    double questionMarks,
    double negativeMarks,
    int questionIndex,
  ) async {
    QuestionModel questionModel = QuestionModel(
      questionText: questionText,
      questionImage: questionImage,
      testId: testId,
      questionMarks: questionMarks,
      negativeMarks: negativeMarks,
      questionIndex: questionIndex,
    );

    final questionRef = _firestore
        .collection('questions')
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    questionModel.questionId = questionRef.id;
    final data = questionModel.toJson();

    await questionRef.set(data);
    return questionRef.id;
  }

  Future<void> setOption(
    String optionText,
    String optionImage,
    String questionId,
    int optionIndex,
    bool isRight,
  ) async {
    OptionModel optionModel = OptionModel(
        optionText: optionText,
        optionImage: optionImage,
        questionId: questionId,
        optionIndex: optionIndex,
        isRight: isRight);

    final optionRef = _firestore
        .collection('options')
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    optionModel.optionId = optionRef.id;
    final data = optionModel.toJson();

    await optionRef.set(data);
  }

  // Stream<List<MessageModel>> getMessage(String chatId) {
  //   return FirebaseFirestore.instance
  //       .collection('messages')
  //       .where('chatId', isEqualTo: chatId)
  //       .orderBy('time', descending: true)
  //       .snapshots()
  //       .map((querySnapshot) {
  //     return querySnapshot.docs.map((doc) {
  //       // Retrieve readBy field from the document snapshot
  //       List<String> readBy = List<String>.from(doc['readBy'] ?? []);

  //       return MessageModel(
  //         messageId: doc['messageId'],
  //         chatId: doc['chatId'],
  //         senderId: doc['senderId'],
  //         time: doc['time'],
  //         type: doc['type'],
  //         content: doc['content'],
  //         readBy: readBy,
  //       );
  //     }).toList();
  //   });
  // }

  Stream<List<TestModel>> getTestModel() {
    return FirebaseFirestore.instance
        .collection('tests')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              // Convert each document snapshot to ChatModel instance
              return TestModel.fromJson(doc.data());
            }).toList());
  }

  Stream<List<QuestionModel>> getQuestionModel() {
    return FirebaseFirestore.instance
        .collection('questions')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              // Convert each document snapshot to ChatModel instance
              return QuestionModel.fromJson(doc.data());
            }).toList());
  }

  Stream<List<OptionModel>> getOptionModel() {
    return FirebaseFirestore.instance
        .collection('options')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              // Convert each document snapshot to ChatModel instance
              return OptionModel.fromJson(doc.data());
            }).toList());
  }
}
