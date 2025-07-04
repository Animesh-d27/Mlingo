import 'dart:convert';

UpdateTranslationsModel updateTranslationsModelFromJson(String str) =>
    UpdateTranslationsModel.fromJson(json.decode(str));

String updateTranslationsModelToJson(UpdateTranslationsModel data) =>
    json.encode(data.toJson());

class UpdateTranslationsModel {
  final String key;
  final List<Translation> translations;

  UpdateTranslationsModel({
    required this.key,
    required this.translations,
  });

  factory UpdateTranslationsModel.fromJson(Map<String, dynamic> json) =>
      UpdateTranslationsModel(
        key: json["key"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  final String language;
  final String translation;

  Translation({
    required this.language,
    required this.translation,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        language: json["language"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "translation": translation,
      };
}
