import '../../data/models/languages/get_languages_model.dart';

abstract class LanguagesState {}

class LanguagesInitial extends LanguagesState {}

class FetchingLanguages extends LanguagesState {}

class LanguagesFetched extends LanguagesState {
  final GetAllLanguagesModel getAllLanguagesModel;

  LanguagesFetched({required this.getAllLanguagesModel});
}

class FetchLanguageError extends LanguagesState {}
