import '../../data/models/update_translations/update_translations_model.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/dio_client.dart';
import 'update_translations_repository.dart';

class UpdateTranslationsRepositoryImpl extends UpdateTranslationsRepository {
  @override
  Future<UpdateTranslationsModel> updateTranslations(
      Map updateTranslationsMap) async {
    try {
      final response = await DioClient().post(
          "${ApiConstants.baseUrl}updateTranslation", updateTranslationsMap);
      return UpdateTranslationsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
