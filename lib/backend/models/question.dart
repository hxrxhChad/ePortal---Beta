// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  String? questionId;
  String? questionText;
  String? questionImage;
  String? testId;
  double? questionMarks;
  double? negativeMarks;
  int? questionIndex;

  QuestionModel({
    this.questionId,
    this.questionText,
    this.questionImage,
    this.testId,
    this.questionMarks,
    this.negativeMarks,
    this.questionIndex,
  });

  QuestionModel copyWith({
    String? questionId,
    String? questionText,
    String? questionImage,
    String? testId,
    double? questionMarks,
    double? negativeMarks,
    int? questionIndex,
  }) =>
      QuestionModel(
        questionId: questionId ?? this.questionId,
        questionText: questionText ?? this.questionText,
        questionImage: questionImage ?? this.questionImage,
        testId: testId ?? this.testId,
        questionMarks: questionMarks ?? this.questionMarks,
        negativeMarks: negativeMarks ?? this.negativeMarks,
        questionIndex: questionIndex ?? this.questionIndex,
      );

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        questionId: json["questionId"],
        questionText: json["questionText"],
        questionImage: json["questionImage"],
        testId: json["testId"],
        questionMarks: json["questionMarks"],
        negativeMarks: json["negativeMarks"],
        questionIndex: json["questionIndex"],
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "questionText": questionText,
        "questionImage": questionImage,
        "testId": testId,
        "questionMarks": questionMarks,
        "negativeMarks": negativeMarks,
        "questionIndex": questionIndex,
      };
}
