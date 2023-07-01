class Weather {
  String name;
  double temperature;
  String description;
  String icon;
  Weather(
      {required this.name,
      required this.temperature,
      required this.description,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      icon: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
      name: json['name'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
