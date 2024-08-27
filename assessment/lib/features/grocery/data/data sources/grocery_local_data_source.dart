import 'dart:async';
import 'dart:convert';

import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GroceryLocalDataSource {
  Future<List<GroceryModel>> getGroceries();
  Future<Grocery> getGroceryItem(String id);
}

class GroceryLocalDataSourceImpl implements GroceryLocalDataSource {
  SharedPreferences sharedPreferences;
  String groceryKey = 'groceries';
  GroceryLocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<List<GroceryModel>> getGroceries() {
    // TODO: implement getGroceries
    final groceries = sharedPreferences.getStringList(groceryKey);
    // save to shared preferences in local storage
    if (groceries != null) {
      try {
        final decodedGroceries = groceries.map((groceryJson) => Grocery.fromJson(jsonDecode(groceryJson) as Map<String, dynamic>)).toList();
        return Future.value(decodedGroceries as FutureOr<List<GroceryModel>>?);
      } catch (e) {
        throw CacheFailure('Failed to decode groceries');
      } 
      } else {
        throw CacheFailure('Failed to load groceries');
      }
    
  }
  
  @override
  Future<Grocery> getGroceryItem(String id) {
    // TODO: implement getGroceryItem
    final groceries = sharedPreferences.getStringList(groceryKey);
    if (groceries != null) {
      try {
        // Find the grocery with the specified id
        final groceryJson = groceries.firstWhere((groceryJson) {
            final groceryMap = jsonDecode(groceryJson) as Map<String, dynamic>;
            return groceryMap['id'] == id;
          },
          orElse: () => throw CacheFailure('Grocery item not found'),
        );
        // Decode JSON string to Grocery object
        final grocery = Grocery.fromJson(jsonDecode(groceryJson) as Map<String, dynamic>);
        return Future.value(grocery);
      } catch (e) {
        throw CacheFailure('Failed to decode grocery item');
        }
    } else {
      throw CacheFailure('Failed to load groceries');
    }
  }


}