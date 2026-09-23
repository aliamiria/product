part of 'product_bloc.dart';


class ProductState {
  final RequestState<ProductModel> products;

  final RequestState<String> addProduct;

  final RequestState<Product> upDateProduct;

  final RequestState<String> deleteProduct;

  final RequestState<Product> product;

  final RequestState<ProductModel> searchProduct;

  final RequestState<ProductModel> sortProduct;

  final RequestState<ProductModel> customProduct;

  final RequestState<List<CategoryModel>> categories;

  final RequestState<List<String>> namesCategory;

  final RequestState<ProductModel> productsByCategory;

  const ProductState({
    this.products = const RequestState(),
    this.addProduct = const RequestState(),
    this.upDateProduct = const RequestState(),
    this.deleteProduct = const RequestState(),
    this.product = const RequestState(),
    this.searchProduct = const RequestState(),
    this.sortProduct = const RequestState(),
    this.customProduct = const RequestState(),
    this.categories = const RequestState(),
    this.namesCategory = const RequestState(),
    this.productsByCategory = const RequestState(),
  });

  ProductState copyWith({
    RequestState<ProductModel>? products,
    RequestState<String>? addProduct,
    RequestState<Product>? upDateProduct,
    RequestState<String>? deleteProduct,
    RequestState<Product>? product,
    RequestState<ProductModel>? searchProduct,
    RequestState<ProductModel>? sortProduct,
    RequestState<ProductModel>? customProduct,
    RequestState<List<CategoryModel>>? categories,
    RequestState<List<String>>? namesCategory,
    RequestState<ProductModel>? productsByCategory,
  }) {
    return ProductState(
      products: products ?? this.products,
      addProduct: addProduct ?? this.addProduct,
      upDateProduct: upDateProduct ?? this.upDateProduct,
      deleteProduct: deleteProduct ?? this.deleteProduct,
      product: product ?? this.product,
      searchProduct: searchProduct ?? this.searchProduct,
      sortProduct: sortProduct ?? this.sortProduct,
      customProduct: customProduct ?? this.customProduct,
      categories: categories ?? this.categories,
      namesCategory: namesCategory ?? this.namesCategory,
      productsByCategory: productsByCategory ?? this.productsByCategory,
    );
  }
}
