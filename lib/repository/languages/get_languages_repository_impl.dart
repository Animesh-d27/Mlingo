import '../../data/models/languages/get_languages_model.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/dio_client.dart';
import 'get_languages_repository.dart';

class GetLanguagesRepositoryImpl extends GetLanguagesRepository {
  @override
  Future<GetAllLanguagesModel> getAllLanguages() async {
    try {
      final response =
          await DioClient().get("${ApiConstants.baseUrl}getAllLanguage");
      return GetAllLanguagesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
