part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class searchfordata extends WeatherEvent {
  final String city;

  searchfordata(this.city);
}
