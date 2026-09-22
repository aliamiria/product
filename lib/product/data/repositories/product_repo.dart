import 'package:dartz/dartz.dart';
import 'package:untitled10/core/errors/error_handler.dart';
import 'package:untitled10/core/errors/failures.dart';
import 'package:untitled10/product/data/data_sources/remote_data_source_product.dart';
import 'package:untitled10/product/data/models/category_model.dart';
import 'package:untitled10/product/data/models/product_model.dart';

class  ProductRepo {
  final  RemoteDataSourceProduct remoteDataSourceProduct ;

  ProductRepo({required this.remoteDataSourceProduct});
  Future<Either<Failure,ProductModel>>   getProduct ()async {
     try {
       final data=  await remoteDataSourceProduct.getProduct();
       return Right(data);
     } on Exception catch (e) {
       return Left(ErrorHandler.mapExceptionToFailure(e));
     }

  }
  Future<Either<Failure,String >>addProduct(Product product)async{
    try {
      final data=await remoteDataSourceProduct.addProduct(product);
      return Right(data);
    } on Exception catch (e) {
   return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,Product>>updateProduct(int id,Product product)async{
    try {
      final data=await remoteDataSourceProduct.updateProduct(id, product);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,String>>deleteProduct(int id)async{
    try {
      final data=await remoteDataSourceProduct.deleteProduct(id);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,Product>>getSingleProduct(int id)async{
    try {
      final data=await remoteDataSourceProduct.getSingleProduct(id);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,ProductModel>>searchProduct(String q)async{
    try {
      final data=await remoteDataSourceProduct.searchProduct(q);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,ProductModel>>customProduct(int limit, int skip , List<String> select)async{
    try {
      final data=await remoteDataSourceProduct.customProduct(limit,skip,select);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,ProductModel>>sortProduct( String title,String order)async{
    try {
      final data=await remoteDataSourceProduct.sortProduct(title,order);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,List<CategoryModel>>>getCategory( )async{
    try {
      final data=await remoteDataSourceProduct.getCategory();
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,List<String>>>getNamesCategories( )async{
    try {
      final data=await remoteDataSourceProduct.getNamesCategories();
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
  Future<Either<Failure,ProductModel>>getProductsByCategories(String category )async{
    try {
      final data=await remoteDataSourceProduct.getProductsByCategories(category);
      return Right(data);
    } on Exception catch (e) {
      return Left(ErrorHandler.mapExceptionToFailure(e));
    }
  }
}