import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mlingo/bloc/translation_form/translation_form_event.dart';
import 'package:mlingo/bloc/translation_form/translation_form_state.dart';

import '../../data/models/translation_form/translation_form_model.dart';
import '../../di/modules.dart';
import '../../repository/translation_form/translation_form_repository.dart';

class TranslationFormBloc
    extends Bloc<TranslationFormEvent, TranslationFormState> {
  final TranslationFormRepository _translationFormRepository =
      getIt<TranslationFormRepository>();

  TranslationFormBloc() : super(TranslationFormInitial()) {
    on<TranslationForm>(_translationForm);
    on<EditTranslationForm>(_editTranslationForm);
  }

  FutureOr _translationForm(
      TranslationForm event, Emitter<TranslationFormState> emit) async {
    emit(TranslationFormSaving());
    try {
      TranslationFormModel translationFormModel =
          await _translationFormRepository
              .translationForm(event.translationFormMap);
      if (translationFormModel.status == 200) {
        emit(TranslationFormSaved(translationFormModel: translationFormModel));
      } else {
        emit(TranslationFormNotSaved(
            errorMessage: translationFormModel.message));
      }
    } catch (e) {
      emit(TranslationFormNotSaved(errorMessage: e.toString()));
    }
  }

  FutureOr _editTranslationForm(
      EditTranslationForm event, Emitter<TranslationFormState> emit) async {
    emit(TranslationFormSaving());
    try {
      TranslationFormModel translationFormModel =
          await _translationFormRepository
              .translationForm(event.editTranslationFormMap);
      if (translationFormModel.status == 200) {
        emit(TranslationFormSaved(translationFormModel: translationFormModel));
      } else {
        emit(TranslationFormNotSaved(
            errorMessage: translationFormModel.message));
      }
    } catch (e) {
      emit(TranslationFormNotSaved(errorMessage: e.toString()));
    }
  }
}
