import 'package:employee_data_app/constants/baseUrlConstants.dart';

class ApiPaths {
  final String baseUrl = 'http://localhost:8000';

  static String get getAllEmployees =>
      '${BaseUrlConstants().baseUrl()}/employee';

  static String get updateEmployeeData =>
      '${BaseUrlConstants().baseUrl()}/employee/add';

  static String get deleteEmployee =>
      '${BaseUrlConstants().baseUrl()}/employee/remove';
}
