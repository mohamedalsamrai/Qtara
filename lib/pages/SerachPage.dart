// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_cubit.dart';


class Serachpage extends StatefulWidget {
  const Serachpage({super.key});

  @override
  State<Serachpage> createState() => SerachpageState();
}

class SerachpageState extends State<Serachpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue[400],
        shadowColor: Colors.black,
        elevation: 2,
        title: Text("Search for your city",
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xffffffff))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 80),
            Text("Welcome back 🌟",
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(201, 0, 0, 0))),
            const SizedBox(height: 150),
            TextField(
            onSubmitted: (value) async {
  nameCity = value;
  if (value.isEmpty) {
    // إذا كان الحقل فارغًا
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("The city name cannot be empty."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق التنبيه
              },
            ),
          ],
        );
      },
    );
    return;
  }
  
  // إظهار علامة التحميل
  showDialog(
    context: context,
    barrierDismissible: false, // لا يمكن إغلاقه قبل انتهاء التحميل
    builder: (BuildContext context) {
      return const Dialog(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 15),
              Text("Loading..."),
            ],
          ),
        ),
      );
    },
  );

  // تحميل البيانات
  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
  await getWeatherCubit.gweWeatherData(cityName: value);

  // إغلاق علامة التحميل
  Navigator.pop(context); // إغلاق الـ Dialog

  // الرجوع للصفحة السابقة
  Navigator.pop(context);
},
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                hintText: "Enter city name",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey[600]),
                labelText: "Search",
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 21, horizontal: 14),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(14),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.3),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

String nameCity = "";
