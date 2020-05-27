import 'package:meta/meta.dart';

class Home {
  var temperature, pressure, windSpeed, humidity;
  String mainDescription, description, cityName;

  Home({
    this.temperature,
    this.humidity,
    this.pressure,
    this.windSpeed,
    this.mainDescription,
    this.description,
    this.cityName,
  });

  Home.fromJson({@required Map<String, dynamic> map}) {
    var mapBase = map['main'];
    temperature = mapBase['temp'];
    humidity = mapBase['humidity'];
    pressure = mapBase['pressure'];
    windSpeed = map['wind']['speed'];
    mainDescription = map['weather'][0]['main'];
    description = map['weather'][0]['description'];
    cityName = map['name'];
  }
}
