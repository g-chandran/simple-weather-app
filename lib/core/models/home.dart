import 'package:meta/meta.dart';

class Home {
  double temperature, humidity, pressure, tempMin, tempMax, windSpeed;
  String mainDescription, description, cityName;

  Home({
    this.temperature,
    this.humidity,
    this.pressure,
    this.tempMin,
    this.tempMax,
    this.windSpeed,
    this.mainDescription,
    this.description,
    this.cityName,
  });

  Home.fromJson({@required Map<String, dynamic> map}) {
    var mapBase = map['map'];
    temperature = mapBase['temp'];
    humidity = mapBase['humidity'];
    pressure = mapBase['pressure'];
    tempMin = mapBase['temp_min'];
    tempMax = mapBase['temp_max'];
    windSpeed = map['wind']['speed'];
    mainDescription = map['weather'][0]['main'];
    description = map['weather'][0]['description'];
    cityName = map['name'];
  }
}
