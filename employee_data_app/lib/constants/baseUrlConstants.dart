class BaseUrlConstants {
  static const String environment = "prod";

  String baseUrl() {
    if (environment == "prod") {
      return "https://employee-data-app.onrender.com";
    } else {
      return "http://192.168.0.112:8000";
    }
  }
}
