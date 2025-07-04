part of 'dashboard_bloc.dart';

abstract class DashboardEvent {
  const DashboardEvent();
}

class FetchDashboard extends DashboardEvent {
  const FetchDashboard();
}
