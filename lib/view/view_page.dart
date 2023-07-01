import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/view/home_page.dart';

import '../modelsview/bloc/weather_bloc.dart';

class view extends StatelessWidget {
  const view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, const Color.fromARGB(255, 179, 149, 3)]),
          ),
          child: Column(
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is Weatherisloding) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Weatherisloaded) {
                    var weather = state.weather;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://openweathermap.org/img/w/${weather.icon}.png',
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          weather.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(weather.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            )),
                        Text(
                          weather.temperature.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )
                      ],
                    );
                  } else if (state is Weathernotloaded) {
                    return Text(state.error);
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(
                height: 100,
              ),
              FloatingActionButton(
                  child: Icon(Icons.keyboard_backspace_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          )),
    );
  }
}
