import 'dart:convert';

class BaseListModel<T> {
  bool success;
  String? message;
  String? error;
  List<T>? data;
  int? hasMore;
  int? totalRequestCount;

  BaseListModel({
    required this.success,
    this.data,
    this.message,
    this.error,
    this.hasMore,
    this.totalRequestCount,
  });

  factory BaseListModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return BaseListModel(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => fromJson(item))
              .toList() ??
          [],
      message: json['message'],
      error: json['error'],
      hasMore: json['hasMore'],
      totalRequestCount: json['totalRequestCount'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;

    if (this.data != null) {
      data['data'] = this.data!.map((item) => toJson(item)).toList();
    }
    if (message != null) {
      data['message'] = message;
    }
    if (error != null) {
      data['error'] = error;
    }
    if (hasMore != null) {
      data['hasMore'] = hasMore;
    }
    if (totalRequestCount != null) {
      data['totalRequestCount'] = totalRequestCount;
    }
    return data;
  }

  factory BaseListModel.fromRawJson(String str, T Function(dynamic) fromJson) =>
      BaseListModel.fromJson(json.decode(str), fromJson);

  String toRawJson(Map<String, dynamic> Function(T) toJson) {
    if (this.data != null) {
      json.encode(this.data!.map((item) => toJson(item)).toList());
    }
    return "dataNotFoundErrorMessage";
  }
}
