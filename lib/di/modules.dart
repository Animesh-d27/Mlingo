import 'package:get_it/get_it.dart';
import '../repository/dashboard/dashboard_repository.dart';
import '../repository/dashboard/dashboard_repository_impl.dart';
import '../repository/languages/get_languages_repository.dart';
import '../repository/languages/get_languages_repository_impl.dart';
import '../repository/translation_form/translation_form_repository.dart';
import '../repository/translation_form/translation_form_repository_impl.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl());
  getIt.registerLazySingleton<TranslationFormRepository>(
      () => TranslationRepositoryImpl());
  getIt.registerLazySingleton<GetLanguagesRepository>(
      () => GetLanguagesRepositoryImpl());
}
