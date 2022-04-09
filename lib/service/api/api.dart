import 'dart:convert';

import 'package:either_option/either_option.dart';
import 'package:flutter/cupertino.dart';



class RequestType {
  static const String Get = 'get';
  static const String Post = 'post';
  static const String Put = 'put';
  static const String Delete = 'delete';
}

class Header {
  // static Map<String, dynamic> clientAuth({@required String clientID}) {
  //   final hashedClient = const Base64Encoder().convert("$clientID:".codeUnits);
  //   return {'Authorization': 'Basic $hashedClient'};
  // }

  static Map<String, dynamic> get clientAuth =>
      {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYwOGQzZDA5MmFhMjM2MDRhYWY0ODM1MyIsImVtYWlsIjoia0BnbWFpbC5jb20iLCJ1c2VyVHlwZSI6ImtpdGNoZW4iLCJpYXQiOjE2MTk4Njg5NjB9.k2z43HJWv7TRbekHjkKtsTufnJRE1ba10bmz6KAu8gk'};

  // static Map<String, dynamic> get userAuth =>
  //     {'Authorization': 'Bearer ${UserCache.instance.getUser().token}'};
}

class EndPoint {
  static const String HOME = '/products';

}

abstract class Api {
 // Future<User> getUser(int userId);

  Future<Either<dynamic, dynamic>> signIn(BuildContext context,
      {Map<String, dynamic> body});


  Future<Either<dynamic, dynamic>> getHome(BuildContext context);
}
