// dependency injection
import 'package:assessment/core/network/network.dart';
import 'package:assessment/features/grocery/data/data%20sources/grocery_local_data_source.dart';
import 'package:assessment/features/grocery/data/data%20sources/grocery_remote_data_source.dart';
import 'package:assessment/features/grocery/data/repository/grocery_repository_impl.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:assessment/features/grocery/domain/usecases/get_all_groceries.dart';
import 'package:assessment/features/grocery/domain/usecases/get_grocery_item.dart';
import 'package:assessment/features/grocery/presentation/bloc/bloc/get_all/get_all_bloc.dart';
import 'package:assessment/features/grocery/presentation/bloc/bloc/get_item/get_item_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async{
  var client = http.Client();
  var connectiivity = InternetConnectionChecker();
  var sharedPreference = await SharedPreferences.getInstance();
  
//   getIt.registerSingleton<InternetConnectionChecker>(connectiivity);
//   getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl(internetConnectionChecker: getIt<InternetConnectionChecker>()),);
//   getIt.registerSingleton<SharedPreferences>(sharedPreference);
//   getIt.registerSingleton<http.Client>(client);
//   getIt.registerSingleton<GroceryRemoteDataSource>(GroceryRemoteDataSourceImpl(client: getIt()));
//   // getIt.registerSingleton<GroceryLocalDataSource>(GroceryLocalDataSourceImpl(sharedPreferences: getIt()));
//   getIt.registerSingleton<GroceryRepository>(GroceryRepositoryImpl(groceryRemoteDataSource: getIt(), networkInfo: getIt()));
//   // getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(productRemoteDataSource: getIt(), networkInfo: getIt(), productLocalDataSource: getIt()));
//   getIt.registerSingleton<GetAllBloc>(GetAllBloc(getIt()));
//   getIt.registerSingleton<GetAllGroceries>(GetAllGroceries(getIt()));
//   getIt.registerSingleton<GetGroceryItem>(GetGroceryItem(getIt()));
//   getIt.registerSingleton<GetItemBloc>(GetItemBloc());
// Future<void> setup() async {
//   var client = http.Client();
//   var connectivity = InternetConnectionChecker();
//   var sharedPreference = await SharedPreferences.getInstance();
  
  // Register core dependencies
  getIt.registerSingleton<InternetConnectionChecker>(connectiivity);
  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(internetConnectionChecker: getIt()));
  getIt.registerSingleton<SharedPreferences>(sharedPreference);
  getIt.registerSingleton<http.Client>(client);
  
  // Register data sources
  getIt.registerSingleton<GroceryRemoteDataSource>(
      GroceryRemoteDataSourceImpl(client: getIt()));
  // If you need local data source, uncomment and register it.
  // getIt.registerSingleton<GroceryLocalDataSource>(
  //     GroceryLocalDataSourceImpl(sharedPreferences: getIt()));
  
  // Register repositories
  getIt.registerSingleton<GroceryRepository>(
      GroceryRepositoryImpl(groceryRemoteDataSource: getIt(), networkInfo: getIt()));
  
  // Register use cases
  getIt.registerSingleton<GetAllGroceries>(GetAllGroceries(getIt()));
  getIt.registerSingleton<GetGroceryItem>(GetGroceryItem(getIt()));
  
  // Register blocs
  getIt.registerSingleton<GetAllBloc>(GetAllBloc(getIt()));
  getIt.registerSingleton<GetItemBloc>(GetItemBloc());
}

