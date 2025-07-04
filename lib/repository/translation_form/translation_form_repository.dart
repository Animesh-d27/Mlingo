import '../../data/models/translation_form/translation_form_model.dart';

abstract class TranslationFormRepository {
  Future<TranslationFormModel> translationForm(Map translationFormMap);
  Future<TranslationFormModel> editTranslationForm(Map translationFormMap);
}
