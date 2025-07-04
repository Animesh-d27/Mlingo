import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../di/modules.dart';
import '../../data/models/dashboard/fetch_dashboard_model.dart';
import '../../repository/dashboard/dashboard_repository.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _dashboardRepository = getIt<DashboardRepository>();

  DashboardBloc() : super(DashboardInitial()) {
    on<FetchDashboard>(_fetchDashboard);
  }

  FutureOr _fetchDashboard(
      FetchDashboard event, Emitter<DashboardState> emit) async {
    emit(DashboardFetching());
    FetchDashboardModel fetchDashboardModel =
        await _dashboardRepository.fetchDashboard();
    if (fetchDashboardModel.status == 200) {
      emit(DashboardFetched(fetchDashboardModel: fetchDashboardModel));
    } else {
      emit(DashboardNotFetched(errorMessage: fetchDashboardModel.message));
    }
  }
}
