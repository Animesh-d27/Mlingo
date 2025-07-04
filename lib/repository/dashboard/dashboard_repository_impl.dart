import 'package:mlingo/data/models/dashboard/fetch_dashboard_model.dart';

import '../../utils/constants/api_constants.dart';
import '../../utils/dio_client.dart';
import 'dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  @override
  Future<FetchDashboardModel> fetchDashboard() async {
    try {
      final response =
          await DioClient().get("${ApiConstants.baseUrl}getAllTranslations");
      return FetchDashboardModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
