import 'package:bloc/bloc.dart';
import 'package:mlingo/bloc/update_translations/update_translations_state.dart';

import 'update_translations_event.dart';

class UpdateTranslationsBloc
    extends Bloc<UpdateTranslationsEvent, UpdateTranslationsState> {
  UpdateTranslationsBloc() : super(UpdateTranslationsInitial()) {
    on<UpdateTranslationsEvent>((event, emit) {});
  }
}
