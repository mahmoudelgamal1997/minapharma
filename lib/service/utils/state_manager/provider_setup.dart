import 'package:get_it/get_it.dart';
import 'package:minafarma/service/api/http_api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HttpApi());
}

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  // ChangeNotifierProvider<MainUIVM>(create: (context) => MainUIVM()),
  // ChangeNotifierProvider<OpportunitiesVM>(
  //   create: (context) => OpportunitiesVM(),
  // )
];
