
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:minafarma/service/core/cache/UserCache.dart';
import 'package:minafarma/service/utils/CardBox.dart';
import 'package:minafarma/service/utils/styles/colors.dart';
import 'package:provider/provider.dart';
import '../../service/core/cache/AppCache.dart';
import '../auth/Login.dart';
import 'HomeModel.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeModel>(
        create: (context) => HomeModel(),
        child: Consumer<HomeModel>(builder: (context, model, __) {
          print("token:  ${UserCache.instance.getUserCache()}");
           return Scaffold(
            appBar: AppBar(title: Text("Home"),
                backgroundColor: AppColors.yellow,
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {'Logout'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
              ],
            ),
            body:Container(
              child: Column(
                children: [
                 // Recent Product
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                      itemCount:model.products.length,
                        itemBuilder: (BuildContext context,int index){
                          return Container(
                            padding: EdgeInsets.all(8.0),
                            child: CardBox(
                              AppColors.primaryBackground,
                              8.0,
                           Column(children: [
                             CachedNetworkImage(
                                 imageUrl: model.products[index].image.toString()
                                 ,placeholder: (context, url) => CircularProgressIndicator()
                                 ,height: 80),
                             Text(model.products[index].title.toString(),
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                           ],)
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ));
        }));
  }

  Future<void> handleClick(String value) async {
    switch (value){
      case 'Logout':
     //   UserCache.instance.setUserCache(false);
    //   UserCache.instance.setUser(null);
      await AppCache.instance.prefs!.remove(AppCache.KEY_USER);
      // AppCache.instance.prefs!.clear();
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
       );
        print('Logged out successfully');
    }
  }
}