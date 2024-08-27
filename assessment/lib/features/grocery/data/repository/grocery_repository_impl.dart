import 'package:assessment/core/error/exceptions.dart';
import 'package:assessment/core/error/failure.dart';
import 'package:assessment/core/network/network.dart';
// import 'package:assessment/features/grocery/data/data%20sources/grocery_local_data_source.dart';
import 'package:assessment/features/grocery/data/data%20sources/grocery_remote_data_source.dart';
import 'package:assessment/features/grocery/domain/entity/grocery.dart';
import 'package:assessment/features/grocery/domain/repository/grocery_repository.dart';
import 'package:assessment/features/grocery/data/models/grocery_model.dart';
import 'package:dartz/dartz.dart';

class GroceryRepositoryImpl extends GroceryRepository{
  GroceryRemoteDataSource groceryRemoteDataSource;
  NetworkInfo networkInfo;

  GroceryRepositoryImpl({required this.groceryRemoteDataSource,  required this.networkInfo});

  // @override
  // Future<Either<Failure, Grocery>> addGroceryItem(Grocery groceryItem) async{
  //   // TODO: implement addGroceryItem
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, List<GroceryModel>>> getAllGroceries() async{
    // TODO: implement getAllGroceries
    
      try {
        final groceries = await groceryRemoteDataSource.getGroceries();
        print(groceries);
        // await groceryLocalDataSource.cacheGroceries(groceries);
        // final groceryModels = groceries.map((grocery) => GroceryModel.fromEntity(grocery)).toList();
        return Right(groceries);
      } on ServerException {
        return Left(ServerFailure());
      }
     
    }
    
      @override
      Future<Either<Failure, Grocery>> getGroceryItem(String id) async{
    // TODO: implement getGroceryItem
     // This should return a GroceryModel, not Either
     try{
        final grocery = await groceryRemoteDataSource.getGroceryItem(id);
        return Right(grocery as Grocery);
      }catch (e) {
        return  Left(CacheFailure('grocery item not found in local cache'));
      }
    }

 

}