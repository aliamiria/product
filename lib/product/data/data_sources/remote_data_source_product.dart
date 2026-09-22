import 'package:dio/dio.dart';

import 'package:untitled10/product/data/models/category_model.dart';
import 'package:untitled10/product/data/models/product_model.dart';

import '../../../core/errors/dio_exception_handler.dart';

class RemoteDataSourceProduct {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  Future<ProductModel> getProduct() async {
    try {
      final response = await dio.get("/products");
      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<String> addProduct(Product product) async {
    try {
      await dio.post("/products/add", data: product.toJson());

      return "success";
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<Product> updateProduct(int id, Product product) async {
    try {
      final response = await dio.put("/products/$id", data: product.toJson());

      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<String> deleteProduct(int id) async {
    try {
      await dio.delete("/products/$id");

      return "done";
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<Product> getSingleProduct(int id) async {
    try {
      final response = await dio.get("/products/$id");

      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<ProductModel> searchProduct(String q) async {
    try {
      final response = await dio.get(
        "/products/search",
        queryParameters: {"q": q},
      );

      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<ProductModel> customProduct(int limit, int skip, List<String> select,) async {
    try {
      final response = await dio.get(
        "/products",
        queryParameters: {
          "limit": limit,
          "skip": skip,
          "select": select.join(','),
        },
      );

      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<ProductModel> sortProduct(String title, String order) async {
    try {
      final response = await dio.get(
        "/products",
        queryParameters: {"sortBy": title, "order": order},
      );

      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  //category

  Future<List<CategoryModel>> getCategory() async {
    try {
      final response = await dio.get("/products/categories");

      List<dynamic> categories = response.data;
      return categories.map((e) => CategoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<List<String>> getNamesCategories() async {
    try {
      final response = await dio.get("/products/category-list");
      return response.data;
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  Future<ProductModel> getProductsByCategories(String category) async {
    try {
      final response = await dio.get("/products/category/$category");

      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }
}
