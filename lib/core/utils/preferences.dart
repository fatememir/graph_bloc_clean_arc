import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;



class PreferenceUtils {
  static SharedPreferences? shared;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    print("waiting for instantion" + shared.toString()) ;

    shared =  await SharedPreferences.getInstance();
    print("done  instantion" + shared.toString()) ;

    return shared;
  }
}