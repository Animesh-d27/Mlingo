import 'dart:convert';

GetAllLanguagesModel getAllLanguagesModelFromJson(String str) =>
    GetAllLanguagesModel.fromJson(json.decode(str));

String getAllLanguagesModelToJson(GetAllLanguagesModel data) =>
    json.encode(data.toJson());

class GetAllLanguagesModel {
  final int status;
  final String message;
  final List<Datum> data;

  GetAllLanguagesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllLanguagesModel.fromJson(Map<String, dynamic> json) =>
      GetAllLanguagesModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int languageId;
  final String language;

  Datum({
    required this.languageId,
    required this.language,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        languageId: json["language_id"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language_id": languageId,
        "language": language,
      };
}
