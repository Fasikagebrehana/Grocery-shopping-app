import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GetGroceryItem {
  final GroceryRepository repository;

  GetGroceryItem(this.repository);

  Future<Either<Failure, Grocery>> call(String id) async {
    return await repository.getGroceryItem(id);
  }
}