import 'package:flutter/material.dart';
import 'package:meteorello/model/city_models.dart';

class CityWeather extends StatelessWidget {
  final CityModel cityModel;

  const CityWeather({required this.cityModel});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      background(cityModel.backgroundImageUrl),
      body(cityModel),
    ]);
  }
}

Widget background(backgroundImageUrl) {
  return Positioned(
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
    child: Image.network(
      backgroundImageUrl,
      fit: BoxFit.cover,
    ),
  );
}

Widget body(CityModel cityModel) => Positioned(
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityModel.name,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "${cityModel.temperature}˚",
            style: TextStyle(fontSize: 60),
          ),
          SizedBox(
            height: 200,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black54,
              ),
              width: double.infinity,
              height: double.infinity,
              child: Text("Altre temperature"),
            ),
          ))
        ],
      ),
    ));
