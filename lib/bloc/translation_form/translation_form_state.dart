import '../../data/models/translation_form/translation_form_model.dart';

abstract class TranslationFormState {}

class TranslationFormInitial extends TranslationFormState {}

class TranslationFormSaving extends TranslationFormState {}

class TranslationFormSaved extends TranslationFormState {
  final TranslationFormModel translationFormModel;

  TranslationFormSaved({required this.translationFormModel});
}

class TranslationFormNotSaved extends TranslationFormState {
  final String errorMessage;

  TranslationFormNotSaved({required this.errorMessage});
}
