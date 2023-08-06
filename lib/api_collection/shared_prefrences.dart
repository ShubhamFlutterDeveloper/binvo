import 'package:shared_preferences/shared_preferences.dart';

import '../app/utils/shared_prefrence.dart';

class PreferenceManager {
  PreferenceManager._();
  static PreferenceManager? _instance;
  static PreferenceManager get() {
    _instance ??= PreferenceManager._();
    return _instance!;
  }

  Future preferenceSet(key, value) async {
    return (await SharedPreferences.getInstance()).setString(key, value);
  }

  Future setAccessToken(value) async {
    return (await SharedPreferences.getInstance()).setString(PreferenceConstants.accessToken,value);
  }
  Future getAccessToken() async {
    return (await SharedPreferences.getInstance()).getString(PreferenceConstants.accessToken);
  }
  Future preferenceGet(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }
  Future setMainOnBoardValue(bool value) async {
    (await SharedPreferences.getInstance()).setBool(PreferenceConstants.showOnBoard, value);
  }
  Future getMainOnBoardValue() async {
    return (await SharedPreferences.getInstance()).getBool(PreferenceConstants.showOnBoard);
  }
  preferenceClear() async {
    (await SharedPreferences.getInstance()).clear();
  }

}


