import 'package:dio/dio.dart';
import 'package:untitled10/product/data/models/product_model.dart';
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


Future<ProductModel> getProduct()async{
 final response= await dio.get("/products");
 if(response.statusCode==200){
   return ProductModel.fromJson(response.data);
 }
 else{throw Exception(response.statusMessage);}
 }
Future<String> addProduct(Product product)async{
 final response= await dio.post("/products/add",data: product.toJson());
 if(response.statusCode==200||response.statusCode==201){
   return "success";
 }
 else{
   throw Exception(response.statusMessage);
 }
}
Future<Product> updateProduct(int id, Product product)async{
final response= await  dio.put("/products/$id",data: product.toJson());
if(response.statusCode==200){
  return Product.fromJson(response.data);
}
else{
  throw Exception(response.statusMessage);
}
}
Future<String> deleteProduct(int id)async{
   final response=await dio.delete("/products/$id");
   if(response.statusCode==200){
     return "done";
   }
   else{
     throw Exception(response.statusMessage);
   }
}

}
