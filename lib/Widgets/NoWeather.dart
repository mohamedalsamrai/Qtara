// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/pages/SerachPage.dart';

class Noweather extends StatelessWidget {
  const Noweather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[400],
          shadowColor: Colors.black,
          elevation: 2,
          title: Text("Qtara Weather App",
              style: GoogleFonts.poppins(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffffffff)))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("No weather data\nSeach for your city🔎",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(201, 0, 0, 0))),
            Container(
              color: Colors.blue,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Serachpage()));
                  },
                  child: Text(
                    "Search",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
