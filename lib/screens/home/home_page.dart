import 'package:flutter/material.dart';
import 'package:final_630710678_1/model/wt.dart'; // ตรวจสอบว่า import ถูกต้องหรือไม่
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final jsonFile = await DefaultAssetBundle.of(?.globalKey.currentContext).loadString("assets/wt.json");
  final data = json.decode(jsonFile);
  final weatherData = WeatherData.fromJson(data);
  runApp(WeatherApp(weatherData: weatherData));
}



class WeatherApp extends StatelessWidget {
  final WeatherData weatherData;

  WeatherApp({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(weatherData: weatherData),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  final WeatherData weatherData;

  WeatherScreen({required this.weatherData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather? currentWeather;

  @override
  void initState() {
    super.initState();
    currentWeather = widget.weatherData.cities[0]; // เลือกเมืองที่คุณต้องการ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: currentWeather == null
          ? Center(child: CircularProgressIndicator())
          : WeatherInfo(weather: currentWeather),
    );
  }
}

class WeatherInfo extends StatelessWidget {
  final Weather? weather;

  WeatherInfo({required this.weather});

  @override
  Widget build(BuildContext context) {
    if (weather == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text('City: ${weather!.city}, ${weather!.country}'),
          Text('Last Updated: ${weather!.lastUpdated}'),
          Text('Temperature: ${weather!.tempC} °C', style: TextStyle(fontSize: 20)),
          Text('Feels Like: ${weather!.feelsLikeC} °C', style: TextStyle(fontSize: 20)),
          Text('Wind Speed: ${weather!.windKph} km/h', style: TextStyle(fontSize: 20)),
          Text('Humidity: ${weather!.humidity}%', style: TextStyle(fontSize: 20)),
          Text('UV: ${weather!.uv}', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
