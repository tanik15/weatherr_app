import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widgets/gridview_widget.dart';
import 'package:weather_app/widgets/new_data.dart';
import 'package:weather_app/widgets/weather_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApi apiRequest = WeatherApi();
  var data;
  WeatherModel? modelData;
  NewWeatherModel? day1;
  NewWeatherModel? day2;
  NewWeatherModel? day3;
  NewWeatherModel? day4;
  NewWeatherModel? day5;
  var newData;

  Future<void> getData() async {
    data = await apiRequest.getWeatherData();
    newData = await apiRequest.getWeatherNewData();
    modelData = WeatherModel.fromJson(data);

    day1 = NewWeatherModel(
        date: newData['list'][0]['dt_txt'],
        minTemp: newData['list'][0]['main']['temp_min'],
        maxTemp: newData['list'][0]['main']['temp_max'],
        description: newData['list'][0]['weather'][0]['main']);
    day2 = NewWeatherModel(
        date: newData['list'][8]['dt_txt'],
        minTemp: newData['list'][8]['main']['temp_min'],
        maxTemp: newData['list'][8]['main']['temp_max'],
        description: newData['list'][8]['weather'][0]['main']);
    day3 = NewWeatherModel(
        date: newData['list'][16]['dt_txt'],
        minTemp: newData['list'][16]['main']['temp_min'],
        maxTemp: newData['list'][16]['main']['temp_max'],
        description: newData['list'][16]['weather'][0]['main']);
    day4 = NewWeatherModel(
        date: newData['list'][24]['dt_txt'],
        minTemp: newData['list'][24]['main']['temp_min'],
        maxTemp: newData['list'][24]['main']['temp_max'],
        description: newData['list'][24]['weather'][0]['main']);
    day5 = NewWeatherModel(
        date: newData['list'][32]['dt_txt'],
        minTemp: newData['list'][32]['main']['temp_min'],
        maxTemp: newData['list'][32]['main']['temp_max'],
        description: newData['list'][32]['weather'][0]['main']);

    print(modelData!.humidity);
    return data;
  }

  Future<void> getNewData() async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 3, 22, 39),
                  Color.fromARGB(255, 3, 90, 167),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )));
        }
        if (data == null) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 3, 22, 39),
                Color.fromARGB(255, 3, 90, 167),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Center(
              child: Text("Something went wrong...Please try after sometime"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 3, 22, 39),
                    Color.fromARGB(255, 3, 90, 167),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 330,
                      child: Stack(
                        children: [
                          Positioned(
                              right: size.width * 0.05,
                              top: size.height * 0.2,
                              child: Image.asset(
                                "assets/img2.jpeg",
                                height: 35,
                              )),
                          Positioned(
                              left: size.width * 0.42,
                              top: size.height * 0.12,
                              child: Image.asset(
                                "assets/img3.jpeg",
                                height: 150,
                              )),
                          Positioned(
                              left: size.width * 0.2,
                              top: size.height * 0.15,
                              child: Image.asset(
                                "assets/img1.jpeg",
                                height: 200,
                              )),
                          Positioned(
                              left: size.width * 0.05,
                              top: size.height * 0.1,
                              child: Image.asset(
                                "assets/img2.jpeg",
                                height: 55,
                              )),
                          Positioned(
                              right: size.width * 0.1,
                              top: size.height * 0.35,
                              child: Image.asset(
                                "assets/img2.jpeg",
                                height: 35,
                              )),
                          Positioned(
                              left: size.width * 0.05,
                              top: size.height * 0.37,
                              child: Image.asset(
                                "assets/img2.jpeg",
                                height: 37,
                              )),
                        ],
                      ),
                    ),
                    if (modelData != null)
                      TempDetails(
                        temp: modelData!.temp,
                        cityname: modelData!.cityName,
                        detailed: modelData!.detailed,
                      ),
                    if (modelData == null)
                      const TempDetails(
                        temp: 300,
                        cityname: 'abc',
                        detailed: 'abc',
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Today ${(day1!.minTemp - 273.15).toStringAsFixed(0)}°C / ${(day1!.maxTemp - 273.15).toStringAsFixed(0)}°C",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    if (modelData != null)
                      GridViewWidget(
                          feelsLike: modelData!.feelsLike,
                          humidity: modelData!.humidity,
                          pressure: modelData!.pressure,
                          wind: modelData!.wind,
                          visibility: modelData!.visibility,
                          description: modelData!.description),
                    if (modelData == null)
                      const GridViewWidget(
                          feelsLike: 300,
                          humidity: 80,
                          pressure: 1250,
                          wind: 5,
                          visibility: 10000,
                          description: 'Rainy'),
                    if (day1 != null)
                      NewDataWidget(
                        date: day1!.date,
                        desc: day1!.description,
                        maxTemp: day1!.maxTemp,
                        minTemp: day1!.minTemp,
                      ),
                    if (day2 != null)
                      NewDataWidget(
                        date: day2!.date,
                        desc: day2!.description,
                        maxTemp: day2!.maxTemp,
                        minTemp: day2!.minTemp,
                      ),
                    if (day3 != null)
                      NewDataWidget(
                        date: day3!.date,
                        desc: day3!.description,
                        maxTemp: day3!.maxTemp,
                        minTemp: day3!.minTemp,
                      ),
                    if (day4 != null)
                      NewDataWidget(
                        date: day4!.date,
                        desc: day4!.description,
                        maxTemp: day4!.maxTemp,
                        minTemp: day4!.minTemp,
                      ),
                    if (day5 != null)
                      NewDataWidget(
                        date: day5!.date,
                        desc: day5!.description,
                        maxTemp: day5!.maxTemp,
                        minTemp: day5!.minTemp,
                      ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return const Center(child: Text("Loading"));
      },
    ));
  }
}

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required this.temp,
    required this.cityname,
    required this.detailed,
  }) : super(key: key);
  final double temp;
  final String cityname;
  final String detailed;

  @override
  Widget build(BuildContext context) {
    double temperature = (temp - 273.15);
    return Column(
      children: [
        Text(
          cityname,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
        Text(
          "${temperature.toStringAsFixed(0)}°C",
          style: const TextStyle(color: Colors.white, fontSize: 75),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              detailed,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
           const SizedBox(width: 5,),
            if (detailed == 'Rain')
                Image.asset(
                  "assets/img5png.jpg",
                  height: 25,
                  color: Colors.white,
                ),
            if (detailed == 'Clouds')
                Image.asset(
                  "assets/cloud.png",
                  height: 25,
                  color: Colors.white,
                )

          ],
        )
      ],
    );
  }
}
