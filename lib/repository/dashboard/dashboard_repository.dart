import '../../data/models/dashboard/fetch_dashboard_model.dart';

abstract class DashboardRepository {
  Future<FetchDashboardModel> fetchDashboard();
}
