class LocationInfo {
  final String name;
  final String url;

  LocationInfo({required this.name, required this.url});

  factory LocationInfo.fromJson(Map<String, dynamic> json) {
    return LocationInfo(
      name: json['name'],
      url: json['url'],
    );
  }
}
