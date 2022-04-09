import 'package:shared_preferences/shared_preferences.dart';

class AppCache{
  static final AppCache _instance = AppCache();

  static AppCache get instance{
    return _instance;
  }

  SharedPreferences? prefs;

  static const String KEY_EXIST="Exist";
  static const String KEY_USER="User";
  static const String KEY_DATA="Data";
  static const String KEY_DATABASE="DataBase";

  Future<void> init () async{
    prefs= await SharedPreferences.getInstance();
  }

}