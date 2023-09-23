import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget(
      {Key? key,
      required this.wind,
      required this.humidity,
      required this.pressure,
      required this.feelsLike,
      required this.visibility,
      required this.description})
      : super(key: key);
  final double wind;
  final int humidity;
  final int pressure;
  final double feelsLike;
  final int visibility;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          DetailsWidget(
            detail: 'Humidity',
            icon: Icons.water_drop_outlined,
            value: "$humidity %",
          ),
          DetailsWidget(
            detail: "Pressure",
            icon: Icons.speed_outlined,
            value: "$pressure hpa",
          ),
          DetailsWidget(
            detail: "Feels like",
            icon: Icons.thermostat,
            value: "${(feelsLike - 273.15).toStringAsFixed(0)} °C",
          ),
          DetailsWidget(
            detail: "Visibility",
            icon: Icons.visibility_outlined,
            value: "${visibility / 1000} mi",
          ),
          DetailsWidget(
            detail: "Wind",
            icon: Icons.wind_power,
            value: "$wind mi/h",
          ),
          DetailsWidget(
            detail: "Description",
            icon: Icons.description,
            value: description,
          )
        ],
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
    required this.icon,
    required this.detail,
    required this.value,
  }) : super(key: key);
  final IconData icon;
  final String detail;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              detail,
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$value",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
