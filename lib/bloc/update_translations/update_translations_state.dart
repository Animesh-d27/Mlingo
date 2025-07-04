import '../../data/models/update_translations/update_translations_model.dart';

abstract class UpdateTranslationsState {}

class UpdateTranslationsInitial extends UpdateTranslationsState {}

class UpdateTranslationsSaving extends UpdateTranslationsState {}

class UpdateTranslationsSaved extends UpdateTranslationsState {
  final UpdateTranslationsModel updateTranslationsModel;

  UpdateTranslationsSaved({required this.updateTranslationsModel});
}

class UpdateTranslationsNotSaved extends UpdateTranslationsState {
  final String errorMessage;

  UpdateTranslationsNotSaved({required this.errorMessage});
}
