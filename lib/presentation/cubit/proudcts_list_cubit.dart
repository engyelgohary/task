import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskroute/data/repository/repoContract.dart';
import '../../data/model/Data.dart';
part 'proudcts_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  ProductsRepository productsRepository;
  ProductsListCubit({required this.productsRepository}) : super(ProductsListInitial());
  List<Products> product = [];
  void fetchProducts() async {
    emit(ProductsListLoading());
    try {
      final response = await productsRepository.getListOfProduct();
      product = response.products ?? [];
      emit(ProductsListSuccess(product: response));
    } catch (e) {
      emit(ProductsListError(e.toString()));
    }
  }
}
