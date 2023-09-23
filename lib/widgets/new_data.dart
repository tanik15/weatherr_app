import 'package:flutter/material.dart';

class NewDataWidget extends StatelessWidget {
  const NewDataWidget({
    Key? key,
    required this.desc,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
  }) : super(key: key);
  final String desc;
  final String date;
  final double minTemp;
  final double maxTemp;

  @override
  Widget build(BuildContext context) {
    List newDate = date.split(" ");
    String formatedDate = newDate[0].replaceAll('-', '/');
    String minT = (minTemp - 273.15).toStringAsFixed(0);
    String maxT = (maxTemp - 273.15).toStringAsFixed(0);
    TextStyle whiteco = const TextStyle(color: Colors.white70, fontSize: 18);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.transparent,
        child: ListTile(
          leading: Text(formatedDate, style: whiteco),
          title: Row(
            children: [
              Text(
                desc,
                textAlign: TextAlign.center,
                style: whiteco,
              ),
              const SizedBox(
                width: 5,
              ),
              if (desc == 'Rain')
                Image.asset(
                  "assets/img5png.jpg",
                  height: 25,
                  color: Colors.white70,
                ),
              if (desc == 'Clouds')
                Image.asset(
                  "assets/cloud.png",
                  height: 25,
                  color: Colors.white70,
                )
            ],
          ),
          trailing: Text(
            "$minT/$maxT",
            style: whiteco,
          ),
        ),
      ),
    );
  }
}
