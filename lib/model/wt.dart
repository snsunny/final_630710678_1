import 'package:flutter/material.dart';
class Weather {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final int humidity;
  final int uv;
  final WeatherCondition condition;

  Weather({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      country: json['country'],
      lastUpdated: json['lastUpdated'],
      tempC: json['tempC'].toDouble(),
      tempF: json['tempF'].toDouble(),
      feelsLikeC: json['feelsLikeC'].toDouble(),
      feelsLikeF: json['feelsLikeF'].toDouble(),
      windKph: json['windKph'].toDouble(),
      windMph: json['windMph'].toDouble(),
      humidity: json['humidity'],
      uv: json['uv'],
      condition: WeatherCondition.fromJson(json['condition']),
    );
  }
}

class WeatherCondition {
  final String text;
  final String icon;
  final int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
class WeatherData {
  final List<Weather> cities;

  WeatherData({required this.cities});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> cityList = json['cities'];
    List<Weather> cities = cityList.map((city) => Weather.fromJson(city)).toList();
    return WeatherData(cities: cities);
  }
}
