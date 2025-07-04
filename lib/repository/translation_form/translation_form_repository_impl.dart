import 'package:mlingo/data/models/translation_form/translation_form_model.dart';
import 'package:mlingo/repository/translation_form/translation_form_repository.dart';

import '../../utils/constants/api_constants.dart';
import '../../utils/dio_client.dart';

class TranslationRepositoryImpl extends TranslationFormRepository {
  @override
  Future<TranslationFormModel> translationForm(Map translationFormMap) async {
    try {
      final response = await DioClient()
          .post("${ApiConstants.baseUrl}addTranslation", translationFormMap);
      return TranslationFormModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TranslationFormModel> editTranslationForm(
      Map translationFormMap) async {
    try {
      final response = await DioClient()
          .post("${ApiConstants.baseUrl}addTranslation", translationFormMap);
      return TranslationFormModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
