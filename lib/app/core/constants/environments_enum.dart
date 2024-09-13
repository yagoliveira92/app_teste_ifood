enum EnvironmentEnum {
  production(
    type: 'production',
    apiBaseUrl: 'api.openweathermap.org',
    apiKey: '9dd2d5523676b81c6b39eebc387044d7',
  ),
  development(
    type: 'development',
    apiBaseUrl: 'api.openweathermap.org',
    apiKey: '9dd2d5523676b81c6b39eebc387044d7',
  );

  const EnvironmentEnum({
    required this.type,
    required this.apiBaseUrl,
    required this.apiKey,
  });

  final String type;
  final String apiBaseUrl;
  final String apiKey;

  EnvironmentEnum envFromString(String value) {
    switch (value) {
      case "PROD":
        return EnvironmentEnum.production;
      case "DEV":
        return EnvironmentEnum.development;
      default:
        throw ArgumentError("Invalid status string: $value");
    }
  }
}

extension EnvironmentsEnumMethods on EnvironmentEnum {
  static EnvironmentEnum envFromString(String value) {
    switch (value) {
      case "PROD":
        return EnvironmentEnum.production;
      case "DEV":
        return EnvironmentEnum.development;
      default:
        throw ArgumentError("Invalid status string: $value");
    }
  }
}
