// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherModel extends StatelessWidget {
  final String time;
  final IconData icon;
  final int temp;

  const WeatherModel({super.key, required this.time, required this.icon, required this.temp});
  factory WeatherModel.fromJson(json) {
    String date = json["datetime"];
    // ignore: non_constant_identifier_names
    String Day = date.substring(5, 10);
    String condition = json["conditions"];
    double tempF = json["temp"];

   
    double tempC = ((tempF - 32) * 5 / 9);
    int tempInCelsius = tempC.toInt();

    IconData icon = condition == "Clear"
        ? Icons.wb_sunny
        : condition.contains("Rain")
            ? Icons.water_drop_rounded
            : condition.contains("Partially")||condition.contains("Cloudy")
                ? Icons.wb_cloudy_outlined
                : Icons.wb_sunny;

    return WeatherModel(time: Day, icon: icon, temp: tempInCelsius);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,
            size: 40,
            color: icon == Icons.wb_sunny
                ? Colors.amber
                : icon == Icons.water_drop_rounded
                    ? Colors.blue[400]
                    : icon == Icons.severe_cold_outlined
                        ? Colors.blue[200]
                        : Colors.black),
        const SizedBox(height: 5),
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 5),
        Text("$temp°",
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
