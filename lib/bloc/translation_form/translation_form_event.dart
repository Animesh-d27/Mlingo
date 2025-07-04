abstract class TranslationFormEvent {
  const TranslationFormEvent();
}

class TranslationForm extends TranslationFormEvent {
  final Map translationFormMap;

  TranslationForm({required this.translationFormMap});
}

class EditTranslationForm extends TranslationFormEvent {
  final Map editTranslationFormMap;

  EditTranslationForm({required this.editTranslationFormMap});
}
