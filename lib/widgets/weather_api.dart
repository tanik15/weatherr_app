import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApi {
  Future<Position> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position;
  }

  Future<Map<String, dynamic>> getWeatherData() async {
    Position location = await getLocation();
    print("Lat: ${location.latitude}");
    print("Lng: ${location.longitude}");
    double laat = location.latitude;
    double loon = location.longitude;
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$laat&lon=$loon&appid=6cf8d6e2bff4379ffc6005710f151b29');
        // 'https://api.openweathermap.org/data/2.5/weather?lat=19.4564&lon=72.7925&appid=6cf8d6e2bff4379ffc6005710f151b29');
        // 'https://api.openweathermap.org/data/2.5/weather?lat=$laat&lon=$loon&appid=6cf8d6e2bff4379ffc6005710f151b29');
    var response = await http.get(url);
    var bodyy = jsonDecode(response.body);
    // print(bodyy['weather'][0]['main']);
    print(bodyy);
    return bodyy;
  }

  Future<Map<String, dynamic>> getWeatherNewData() async {
    Position location = await getLocation();
    print("Lat: ${location.latitude}");
    print("Lng: ${location.longitude}");
    double laat = location.latitude;
    double loon = location.longitude;
    final url = Uri.parse(
        // 'https://api.openweathermap.org/data/2.5/weather?lat=19.4564&lon=72.7925&appid=6cf8d6e2bff4379ffc6005710f151b29');
        'https://api.openweathermap.org/data/2.5/forecast?lat=$laat&lon=$loon&appid=6cf8d6e2bff4379ffc6005710f151b29');
    var response = await http.get(url);
    var bodyy = jsonDecode(response.body);
    // print(bodyy['weather'][0]['main']);
    // print(bodyy);
    return bodyy;
  }
}

// https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=6cf8d6e2bff4379ffc6005710f151b29



