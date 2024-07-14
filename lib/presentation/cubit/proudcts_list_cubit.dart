import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskroute/data/repository/repoContract.dart';
import '../../data/model/Data.dart';
part 'proudcts_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  ProductsRepository productsRepository;
  ProductsListCubit({required this.productsRepository}) : super(ProductsListInitial());
  List<Products> product = [];
  List<Products> searchResults = [];
  List<Products> cartItems = [];


  void fetchProducts() async {
    emit(ProductsListLoading());
    try {
      final response = await productsRepository.getListOfProduct();
      product = response.products ?? [];
      searchResults = product;
      emit(ProductsListSuccess(product: searchResults));
    } catch (e) {
      emit(ProductsListError(e.toString()));
    }
  }
  void searchProduct(String searchTerm) {
    if (searchTerm.isEmpty) {
      searchResults = product;
    } else {
      searchResults = product
          .where((item) =>
          item.title!.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }
    emit(ProductsListSuccess(product: searchResults));
  }

}

