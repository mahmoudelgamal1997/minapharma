
import 'package:minafarma/service/model/HomeResponse.dart';
import 'package:minafarma/service/utils/state_manager/base_notifier.dart';

import '../../service/core/cache/UserCache.dart';

class HomeModel extends BaseNotifier{


  HomeModel(){
    getRecentProducts();
  }
   List<HomeResponse> products=[];
   Future getRecentProducts()async{

       var res;
       setBusy();
    try {
      res = await api.getHome();
      print('res invoked');

    }catch(Excpetion){
      products= await UserCache.instance.getData()!;
      setIdle();
      print('dddddd ${products.length}');
      print('data retrieve ');

    }


      res.fold((error) => {setError(),}, (data) {
        for (int i = 0; i < data.length; i++) {
          try {
            products.add(HomeResponse.fromJson(data[i]));
          } catch (Exception) {

          }
        }

        UserCache.instance.setData(products);
        print('data saved');
        setIdle();
      });

     }
}