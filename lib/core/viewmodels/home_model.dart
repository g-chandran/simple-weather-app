import 'package:clima_two/core/enums/viewstates.dart';
import 'package:clima_two/core/models/home.dart';
import 'package:clima_two/core/services/api.dart';
import 'package:clima_two/locator.dart';
import 'package:flutter/foundation.dart';

class HomeModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Api _api = locator<Api>();
  Home data;

  Future getData(String city) async {
    setState(ViewState.Busy);
    data = await _api.getData(city);
    setState(ViewState.Idle);
  }
}
