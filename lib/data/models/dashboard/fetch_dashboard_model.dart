import 'dart:convert';

FetchDashboardModel fetchDashboardModelFromJson(String str) =>
    FetchDashboardModel.fromJson(json.decode(str));

String fetchDashboardModelToJson(FetchDashboardModel data) =>
    json.encode(data.toJson());

class FetchDashboardModel {
  final int status;
  final String message;
  final List<dynamic> data;

  FetchDashboardModel(
      {required this.status, required this.message, required this.data});

  factory FetchDashboardModel.fromJson(Map<String, dynamic> json) =>
      FetchDashboardModel(
          status: json["status"],
          message: json["message"],
          data: List<dynamic>.from(json["data"].map((x) => x)));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x))
      };
}
