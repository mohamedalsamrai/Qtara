// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/components/RowWeather.dart';

class WeatherWeek extends StatelessWidget {
  const WeatherWeek({
    super.key,
   
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(40)),
        color: Color(0xfffdfdfd),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Weather Week',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
        RowWeather(),
        ],
      ),
    );
  }
}
