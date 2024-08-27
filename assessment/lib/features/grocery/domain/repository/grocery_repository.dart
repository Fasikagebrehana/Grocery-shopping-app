import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:dartz/dartz.dart';
import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';

abstract class GroceryRepository {
  Future<Either <Failure, List<GroceryModel>>> getAllGroceries();
  Future<Either <Failure, Grocery>> getGroceryItem(String id);
  // Future<Either <Failure, ListGroceryItem>> searchGroceryItems(String query);
  // Future<Either <Failure, Grocery>> addGroceryItem(Grocery groceryItem);

}