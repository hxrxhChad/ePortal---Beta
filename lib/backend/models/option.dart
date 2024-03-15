// To parse this JSON data, do
//
//     final optionModel = optionModelFromJson(jsonString);

import 'dart:convert';

OptionModel optionModelFromJson(String str) =>
    OptionModel.fromJson(json.decode(str));

String optionModelToJson(OptionModel data) => json.encode(data.toJson());

class OptionModel {
  String? optionId;
  String? optionText;
  String? optionImage;
  String? questionId;
  int? optionIndex;
  bool? isRight;

  OptionModel({
    this.optionId,
    this.optionText,
    this.optionImage,
    this.questionId,
    this.optionIndex,
    this.isRight,
  });

  OptionModel copyWith({
    String? optionId,
    String? optionText,
    String? optionImage,
    String? questionId,
    int? optionIndex,
    bool? isRight,
  }) =>
      OptionModel(
        optionId: optionId ?? this.optionId,
        optionText: optionText ?? this.optionText,
        optionImage: optionImage ?? this.optionImage,
        questionId: questionId ?? this.questionId,
        optionIndex: optionIndex ?? this.optionIndex,
        isRight: isRight ?? this.isRight,
      );

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        optionId: json["optionId"],
        optionText: json["optionText"],
        optionImage: json["optionImage"],
        questionId: json["questionId"],
        optionIndex: json["optionIndex"],
        isRight: json["isRight"],
      );

  Map<String, dynamic> toJson() => {
        "optionId": optionId,
        "optionText": optionText,
        "optionImage": optionImage,
        "questionId": questionId,
        "optionIndex": optionIndex,
        "isRight": isRight,
      };
}
