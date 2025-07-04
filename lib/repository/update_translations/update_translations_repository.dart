import '../../data/models/update_translations/update_translations_model.dart';

abstract class UpdateTranslationsRepository {
  Future<UpdateTranslationsModel> updateTranslations(Map updateTranslationsMap);
}
