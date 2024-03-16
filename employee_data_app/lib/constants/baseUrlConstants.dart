class BaseUrlConstants {
  static const String environment = "local";

  String baseUrl() {
    if (environment == "prod") {
      //TODO: add a production url HERE
      return "";
    } else {
      return "http://localhost:8000";
    }
  }
}
