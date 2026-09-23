import 'package:bloc/bloc.dart';
import 'package:untitled10/core/state/request_state.dart';
import 'package:untitled10/product/data/models/category_model.dart';
import 'package:untitled10/product/data/models/product_model.dart';
import 'package:untitled10/product/data/repositories/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo productRepo;

  ProductBloc({required this.productRepo}) : super(ProductState()) {

    // Get All Products
    on<GetProductsEvent>((event, emit) async {
      emit(
        state.copyWith(
          products: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.getProduct();

      data.fold(
            (l) => emit(
          state.copyWith(
            products: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            products: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Add Product
    on<AddProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          addProduct: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.addProduct(event.product);

      data.fold(
            (l) => emit(
          state.copyWith(
            addProduct: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            addProduct: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Update Product
    on<UpdateProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          upDateProduct: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.updateProduct(
        event.id,
        event.product,
      );

      data.fold(
            (l) => emit(
          state.copyWith(
            upDateProduct: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            upDateProduct: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Delete Product
    on<DeleteProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          deleteProduct: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.deleteProduct(event.id);

      data.fold(
            (l) => emit(
          state.copyWith(
            deleteProduct: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            deleteProduct: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Get Single Product
    on<GetSingleProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          product: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.getSingleProduct(event.id);

      data.fold(
            (l) => emit(
          state.copyWith(
            product: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            product: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Search Products
    on<SearchProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          searchProduct: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.searchProduct(event.q);

      data.fold(
            (l) => emit(
          state.copyWith(
            searchProduct: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            searchProduct: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Custom Products
    on<CustomProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          customProduct: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.customProduct(
        event.limit,
        event.skip,
        event.select,
      );

      data.fold(
            (l) => emit(
          state.copyWith(
            customProduct: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            customProduct: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Sort Products
    on<SortProductEvent>((event, emit) async {
      emit(
        state.copyWith(
          sortProduct: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.sortProduct(
        event.title,
        event.order,
      );

      data.fold(
            (l) => emit(
          state.copyWith(
            sortProduct: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            sortProduct: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Get Categories
    on<GetCategoryEvent>((event, emit) async {
      emit(
        state.copyWith(
          categories: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.getCategory();

      data.fold(
            (l) => emit(
          state.copyWith(
            categories: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            categories: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Get Category Names
    on<GetNamesCategoriesEvent>((event, emit) async {
      emit(
        state.copyWith(
          namesCategory: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.getNamesCategories();

      data.fold(
            (l) => emit(
          state.copyWith(
            namesCategory: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            namesCategory: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });

    // Get Products By Category
    on<GetProductsByCategoriesEvent>((event, emit) async {
      emit(
        state.copyWith(
          productsByCategory: RequestState(status: Status.loading),
        ),
      );

      final data = await productRepo.getProductsByCategories(
        event.name,
      );

      data.fold(
            (l) => emit(
          state.copyWith(
            productsByCategory: RequestState(
              error: l.message,
              status: Status.error,
            ),
          ),
        ),
            (r) => emit(
          state.copyWith(
            productsByCategory: RequestState(
              data: r,
              status: Status.success,
            ),
          ),
        ),
      );
    });
  }
}