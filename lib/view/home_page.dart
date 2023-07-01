import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/modelsview/bloc/weather_bloc.dart';
import 'package:weather_app/view/view_page.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String cityname = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      //we will make the searchbar later
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  hintText: 'enter the city name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  label: Text('city'),
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 8),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  String text = textEditingController.text;
                  BlocProvider.of<WeatherBloc>(context)
                      .add(searchfordata(text));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => view(),
                      ));
                },
                child: Text('submit')),
          ],
        ),
      ),
    );
  }
}
