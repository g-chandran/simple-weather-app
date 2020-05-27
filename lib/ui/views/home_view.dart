import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enums/viewstates.dart';
import '../../core/viewmodels/home_model.dart';
import '../../locator.dart';

const kBigText = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
const kSubText = TextStyle(fontSize: 25.0, fontWeight: FontWeight.normal);

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
      create: (context) => locator<HomeModel>(),
      child: Consumer<HomeModel>(
        builder: (context, model, child) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(fontSize: 20),
                  onSubmitted: (value) async {
                    await model.getData(value);
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[400],
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                model.state == ViewState.Idle
                    ? Container()
                    : model.state == ViewState.Busy
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[400],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          model.data.cityName,
                                          style: kBigText,
                                        ),
                                        Text(
                                          model.data.temperature.toString(),
                                          style: kBigText,
                                        ),
                                      ],
                                    ),
                                    Text(model.data.mainDescription,
                                        style: kBigText.copyWith(fontSize: 30)),
                                    Text(model.data.description,
                                        style: kBigText.copyWith(fontSize: 30)),
                                    Divider(
                                      height: 20,
                                      thickness: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Pressure',
                                          style: kSubText,
                                        ),
                                        Text(
                                          model.data.pressure.toString(),
                                          style: kSubText,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Humidity',
                                          style: kSubText,
                                        ),
                                        Text(
                                          model.data.humidity.toString(),
                                          style: kSubText,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Wind Speed',
                                          style: kSubText,
                                        ),
                                        Text(
                                          model.data.windSpeed.toString(),
                                          style: kSubText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
