import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/modelsview/fetchdata.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Weatherdata weatherdata;

  WeatherBloc(this.weatherdata) : super(WeatherInitial()) {
    on<searchfordata>((event, emit) async {
      try {
        emit(Weatherisloding());
        Weather weather = await weatherdata.getdata(event.city);
        print(weather);
        emit(Weatherisloaded(weather));
      } catch (e) {
        emit(Weathernotloaded('$e'));
      }
    });
  }
}
