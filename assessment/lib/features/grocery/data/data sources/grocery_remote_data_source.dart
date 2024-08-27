import 'dart:convert';

import 'package:assessment/core/error/exceptions.dart';
import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';
import 'package:assessment/features/grocery/domain/usecases/get_grocery_item.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class GroceryRemoteDataSource {
  Future<List<GroceryModel>> getGroceries();
  Future<Either<Failure, GetGroceryItem>> getGroceryItem(String id);
}
class GroceryRemoteDataSourceImpl implements GroceryRemoteDataSource {
  final http.Client client;

  GroceryRemoteDataSourceImpl({required this.client});

  @override
Future<List<GroceryModel>> getGroceries() async {
  final response = await client.get(
    Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> decodedJson = json.decode(response.body);

    // Check if the 'data' key is present and contains a list
    if (decodedJson.containsKey('data') && decodedJson['data'] is List) {
      final List<dynamic> groceriesJson = decodedJson['data'];

      List<GroceryModel> listGroceries = groceriesJson.map((groceryJson) {
        // Assuming GroceryModel.fromJson is expecting a map
        return GroceryModel.fromJson(groceryJson);
      }).toList();
      
      return listGroceries;
    } else {
      throw ServerException('Invalid data format');
    }
  } else {
    throw ServerException('Failed to load groceries');
  }
}


  @override
  Future<Either<Failure, GetGroceryItem>> getGroceryItem(String id) async {
    final response = await client.get(
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/66be460f71fccd1506882d24')
    );

    if (response.statusCode == 200) {
      final grocery = json.decode(response.body);
      final groceryItem = grocery.fromJson(grocery);
      return Right(groceryItem);
    } else {
      return const Left(ServerFailure());
    }
  
  }

}