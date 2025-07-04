import '../../data/models/languages/get_languages_model.dart';

abstract class GetLanguagesRepository {
  Future<GetAllLanguagesModel> getAllLanguages();
}
