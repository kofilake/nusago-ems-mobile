class EnvConfig {
  // Base URL API — di-inject via --dart-define-from-file
  static const String hostUrl = String.fromEnvironment(
    'HOST_URL',
    defaultValue: 'http://localhost:8000/api', // nanti ganti IP asli
  );

  // Nama environment untuk debugging
  static const String envName = String.fromEnvironment(
    'ENV_NAME',
    defaultValue: 'Development',
  );
}

class EnvConfigProvider {
  static final EnvConfig _config = EnvConfig();

  static EnvConfig get instance => _config;
}
