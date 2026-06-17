class EnvConfig {
  static const String hostUrl = String.fromEnvironment(
    'HOST_URL',
    defaultValue: 'http://localhost:8000/api',
  );

  static const String envName = String.fromEnvironment(
    'ENV_NAME',
    defaultValue: 'Development',
  );
}

class EnvConfigProvider {
  static final EnvConfig _config = EnvConfig();

  static EnvConfig get instance => _config;
}
