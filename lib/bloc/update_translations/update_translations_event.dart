abstract class UpdateTranslationsEvent {
  const UpdateTranslationsEvent();
}

class UpdateTranslationsForm extends UpdateTranslationsEvent {
  final Map updateTranslationsMap;

  UpdateTranslationsForm({required this.updateTranslationsMap});
}
