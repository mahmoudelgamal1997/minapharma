import 'dart:convert';

import 'package:minafarma/service/model/HomeResponse.dart';
import 'package:minafarma/service/model/UserModel.dart';

import 'AppCache.dart';

class UserCache {

  static final UserCache _instance= UserCache();

  static UserCache get instance{
    return _instance;
  }

  void setUserCache(bool isUser){
    if (isUser == null) return ;
    AppCache.instance.prefs!.setBool(AppCache.KEY_EXIST, isUser);
  }

   bool? getUserCache(){
    bool? isUser= AppCache.instance.prefs!.getBool(AppCache.KEY_EXIST);
    return isUser;
  }


  void setUser(UserModel? model){
   if (model == null) return;
     String json =jsonEncode(model.toJson());
     AppCache.instance.prefs!.setString(AppCache.KEY_USER, json);
   }



  UserModel? getUser(){
    String? json = AppCache.instance.prefs!.getString(AppCache.KEY_USER);
    return json == null ? null : UserModel.fromJson(jsonDecode(json));
  }
  void setData(List<HomeResponse> data){
    if (data ==null) return;
    String json = HomeResponse.encode(data);
    AppCache.instance.prefs!.setString(AppCache.KEY_DATA, json);
  }
  List<HomeResponse>? getData(){
    dynamic? json = AppCache.instance.prefs!.getString(AppCache.KEY_DATA);
    return json == null ? null : HomeResponse.decode(json);
  }

}