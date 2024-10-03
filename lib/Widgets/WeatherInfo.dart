// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/Temp.dart';
import 'package:news/components/WeatherWeek.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news/pages/SerachPage.dart';

class WeatherInfo extends StatelessWidget {
   WeatherInfo({
    super.key,
   
    required this.name,
  
  });

 
  final String name;

  @override
  Widget build(BuildContext context) {
    Size ksize = MediaQuery.sizeOf(context);
   var weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return SafeArea(
      child: Stack(children: [
        Image.asset(
          "assets/images/IMG_8148.JPG",
          width: ksize.width,
          height: ksize.height,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Color.fromARGB(213, 239, 245, 252),
                            size: 21,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w200,
                                  color: Color.fromARGB(213, 239, 245, 252)),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Serachpage()));
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 27,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Temp(
                            temp: "${weatherModel[0].temp}",
                          ),
                          const Text(
                            "°",
                            style: TextStyle(
                                fontSize: 85,
                                color:
                                    Color.fromARGB(175, 255, 255, 255)),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            WeatherWeek(),
          ],
        ),
      ]),
    );
  }
}

