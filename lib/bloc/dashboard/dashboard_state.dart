part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardFetching extends DashboardState {}

class DashboardFetched extends DashboardState {
  final FetchDashboardModel fetchDashboardModel;

  DashboardFetched({required this.fetchDashboardModel});
}

class DashboardNotFetched extends DashboardState {
  final String errorMessage;

  DashboardNotFetched({required this.errorMessage});
}
