import 'package:flutter/foundation.dart';

import '../../locator.dart';
import '../enums/viewstates.dart';
import '../models/home.dart';
import '../services/api.dart';

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
    setState(ViewState.Display);
  }
}
