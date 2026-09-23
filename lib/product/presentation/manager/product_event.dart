part of 'product_bloc.dart';


sealed class ProductEvent {}
class GetProductsEvent extends ProductEvent{}
class AddProductEvent extends ProductEvent{
  final Product product;

  AddProductEvent({required this.product});
}
class UpdateProductEvent extends ProductEvent{
  final int id;
  final Product product;

  UpdateProductEvent({required this.id, required this.product});
}
class DeleteProductEvent extends ProductEvent{
  final int id;

  DeleteProductEvent({required this.id});

}
class GetSingleProductEvent extends ProductEvent{
 final int id;

  GetSingleProductEvent({required this.id});
}
class SearchProductEvent extends ProductEvent{
  final String q;

  SearchProductEvent({required this.q});
}
class CustomProductEvent extends ProductEvent{
  final int limit;
  final int skip;
  final List<String>select;

  CustomProductEvent({required this.limit, required this.skip, required this.select});
}
class SortProductEvent extends ProductEvent{
  final String title;
  final String order;

  SortProductEvent({required this.title, required this.order});
}
class GetCategoryEvent extends ProductEvent{}
class GetNamesCategoriesEvent extends ProductEvent{}
class GetProductsByCategoriesEvent extends ProductEvent{
  final String name;

  GetProductsByCategoriesEvent({required this.name});
}
