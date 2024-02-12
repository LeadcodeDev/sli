abstract interface class EnvironmentContract {
  String get name;

  String get accessKey;

  String get secretKey;

  String get region;

  List<String> get buckets;

  String get endpoint;
}

final class Environment implements EnvironmentContract {
  @override
  final String name;

  @override
  final String accessKey;

  @override
  final String secretKey;

  @override
  final String region;

  @override
  final List<String> buckets;

  @override
  final String endpoint;

  Environment(
      {required this.name,
        required this.accessKey,
        required this.secretKey,
        required this.region,
        required this.buckets,
        required this.endpoint,
      });

  factory Environment.fromDisk(payload) {
    return Environment(
      name: payload['name'],
      accessKey: payload['access_key'],
      secretKey: payload['secret_key'],
      region: payload['region'],
      buckets: List.from(payload['buckets']),
      endpoint: payload['endpoint'],
    );
  }
}
