class WeatherModel {
  late String cityName;
  late double temp;
  late double wind;
  late int humidity;
  late int pressure;
  late double feelsLike;
  late String detailed;
  late int visibility;
  late String description;
  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.feelsLike,
    required this.detailed,
    required this.visibility,
    required this.description,
  });

  WeatherModel.fromJson(Map<String, dynamic> json){
    cityName = json['name'];
    temp= json['main']['temp'];
    wind= json['wind']['speed'];
    humidity= json['main']['humidity'];
    pressure= json['main']['pressure'];
    feelsLike= json['main']['feels_like'];
    detailed= json['weather'][0]['main'];
    visibility= json['visibility'];
    description= json['weather'][0]['description'];
  }
}

class NewWeatherModel {
  final String date;
  final double minTemp;
  final double maxTemp;
  final String description;

  NewWeatherModel({required this.date,required this.minTemp,required this.maxTemp,required this.description});
}
