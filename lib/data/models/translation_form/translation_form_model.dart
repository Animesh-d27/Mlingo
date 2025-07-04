import 'dart:convert';

TranslationFormModel translationFormModelFromJson(String str) =>
    TranslationFormModel.fromJson(json.decode(str));

String translationFormModelToJson(TranslationFormModel data) =>
    json.encode(data.toJson());

class TranslationFormModel {
  final int status;
  final String message;
  final Data data;

  TranslationFormModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TranslationFormModel.fromJson(Map<String, dynamic> json) =>
      TranslationFormModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
