// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  String? testId;
  String? testName;
  String? testDescription;
  int? testTimeStamp;
  String? testAuthor;
  List<String>? testParticipants;
  String? testCode;
  int? testDate;
  String? testSyllabus;
  String? testEligibilityDetails;
  List<String>? testFeedback;
  int? testResultDate;
  String? testAnswerSheet;

  TestModel({
    this.testId,
    this.testName,
    this.testDescription,
    this.testTimeStamp,
    this.testAuthor,
    this.testParticipants,
    this.testCode,
    this.testDate,
    this.testSyllabus,
    this.testEligibilityDetails,
    this.testFeedback,
    this.testResultDate,
    this.testAnswerSheet,
  });

  TestModel copyWith({
    String? testId,
    String? testName,
    String? testDescription,
    int? testTimeStamp,
    String? testAuthor,
    List<String>? testParticipants,
    String? testCode,
    int? testDate,
    String? testSyllabus,
    String? testEligibilityDetails,
    List<String>? testFeedback,
    int? testResultDate,
    String? testAnswerSheet,
  }) =>
      TestModel(
        testId: testId ?? this.testId,
        testName: testName ?? this.testName,
        testDescription: testDescription ?? this.testDescription,
        testTimeStamp: testTimeStamp ?? this.testTimeStamp,
        testAuthor: testAuthor ?? this.testAuthor,
        testParticipants: testParticipants ?? this.testParticipants,
        testCode: testCode ?? this.testCode,
        testDate: testDate ?? this.testDate,
        testSyllabus: testSyllabus ?? this.testSyllabus,
        testEligibilityDetails:
            testEligibilityDetails ?? this.testEligibilityDetails,
        testFeedback: testFeedback ?? this.testFeedback,
        testResultDate: testResultDate ?? this.testResultDate,
        testAnswerSheet: testAnswerSheet ?? this.testAnswerSheet,
      );

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        testId: json["testId"],
        testName: json["testName"],
        testDescription: json["testDescription"],
        testTimeStamp: json["testTimeStamp"],
        testAuthor: json["testAuthor"],
        testParticipants: json["testParticipants"] == null
            ? []
            : List<String>.from(json["testParticipants"]!.map((x) => x)),
        testCode: json["testCode"],
        testDate: json["testDate"],
        testSyllabus: json["testSyllabus"],
        testEligibilityDetails: json["testEligibilityDetails"],
        testFeedback: json["testFeedback"] == null
            ? []
            : List<String>.from(json["testFeedback"]!.map((x) => x)),
        testResultDate: json["testResultDate"],
        testAnswerSheet: json["testAnswerSheet"],
      );

  Map<String, dynamic> toJson() => {
        "testId": testId,
        "testName": testName,
        "testDescription": testDescription,
        "testTimeStamp": testTimeStamp,
        "testAuthor": testAuthor,
        "testParticipants": testParticipants == null
            ? []
            : List<dynamic>.from(testParticipants!.map((x) => x)),
        "testCode": testCode,
        "testDate": testDate,
        "testSyllabus": testSyllabus,
        "testEligibilityDetails": testEligibilityDetails,
        "testFeedback": testFeedback == null
            ? []
            : List<dynamic>.from(testFeedback!.map((x) => x)),
        "testResultDate": testResultDate,
        "testAnswerSheet": testAnswerSheet,
      };
}
