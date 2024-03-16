import 'package:dio/dio.dart';
import 'package:employee_data_app/constants/api_paths.dart';
import 'package:employee_data_app/models/base_models.dart/base_list_model.dart';
import 'package:employee_data_app/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class EmployeeRepository extends ChangeNotifier {
  List<Employee> employees = [];
  bool isLoading = false;
  bool hasError = false;

  Future<void> fetchData() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final dio = Dio();

      Logger().d("executing");

      Logger().d(ApiPaths.getAllEmployees);

      var response = await dio.get(ApiPaths.getAllEmployees);

      var employeeData = BaseListModel<Employee>.fromJson(
          response.data, (item) => Employee.fromJson(item));

      if (employeeData.data != null) {
        employees = employeeData.data!;
      }
      isLoading = false;
      notifyListeners();
    } catch (error) {
      hasError = true;
    }
  }
}
