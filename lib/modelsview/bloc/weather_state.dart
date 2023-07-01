part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class Weatherisloding extends WeatherState {}

class Weatherisloaded extends WeatherState {
  final Weather weather;

  Weatherisloaded(this.weather);
}

class Weathernotloaded extends WeatherState {
  final String error;

  Weathernotloaded(this.error);
}
