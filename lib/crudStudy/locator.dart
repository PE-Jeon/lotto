import 'package:get_it/get_it.dart';
import 'package:lotto/crudStudy/core/services/api.dart';
import 'package:lotto/crudStudy/core/viewmodels/CRUDEModel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}