import 'package:assessment/core/error/failure.dart';
import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllGroceries {
  final GroceryRepository repository;

  GetAllGroceries(this.repository);

  Future<Either<Failure, List<GroceryModel>>> call() async {
    return await repository.getAllGroceries();
  }
}