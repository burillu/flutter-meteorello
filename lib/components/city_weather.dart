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
      color: Colors.black12,
      colorBlendMode: BlendMode.darken,
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityModel.name,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "${cityModel.temperature}˚",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
            ),
            Expanded(
                child: ForecastWeather(
                    sevenDaysForecast: cityModel.sevenDaysForecast))
          ],
        ),
      ),
    ));

class ForecastWeather extends StatelessWidget {
  final List<DayForecastModel> sevenDaysForecast;

  const ForecastWeather({required this.sevenDaysForecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black54,
      ),
      width: double.infinity,
      //height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Temperature per i prossimi giorni"),
          ),
          ListDivisor(),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(sevenDaysForecast[index].name),
                      trailing: Text(
                        "${sevenDaysForecast[index].temperature.toString()}˚",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                separatorBuilder: (contex, index) => ListDivisor(),
                itemCount: sevenDaysForecast.length),
          )
        ],
      ),
    );
  }
}

class ListDivisor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(color: Colors.white12),
    );
  }
}
