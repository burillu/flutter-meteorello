import 'package:flutter/material.dart';
import 'package:meteorello/components/city_weather.dart';
import 'package:meteorello/model/city_models.dart';

class HomePage extends StatelessWidget {
  //final CityModel cityModel;
  //const HomePage({required this.cityModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemBuilder: (context, index) =>
          CityWeather(cityModel: weatherData[index]),
      itemCount: weatherData.length,
    ));
  }
}
