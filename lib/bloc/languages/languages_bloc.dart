import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../data/models/languages/get_languages_model.dart';
import '../../di/modules.dart';
import '../../repository/languages/get_languages_repository.dart';
import 'languages_event.dart';
import 'languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final GetLanguagesRepository _getLanguagesRepository =
      getIt<GetLanguagesRepository>();

  LanguagesBloc() : super(LanguagesInitial()) {
    on<GetAllLanguages>(_fetchLanguages);
  }

  FutureOr _fetchLanguages(
      GetAllLanguages event, Emitter<LanguagesState> emit) async {
    emit(FetchingLanguages());
    GetAllLanguagesModel getAllLanguagesModel =
        await _getLanguagesRepository.getAllLanguages();
    if (getAllLanguagesModel.status == 200) {
      emit(LanguagesFetched(getAllLanguagesModel: getAllLanguagesModel));
    } else {
      emit(FetchLanguageError());
    }
  }
}
