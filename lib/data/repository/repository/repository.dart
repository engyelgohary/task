import 'package:taskroute/data/repository/repoContract.dart';

import '../../model/Data.dart';

class ProductsRepositoryImpl implements ProductsRepository{
  ProductsDataSource productsDataSource;
  ProductsRepositoryImpl({required this.productsDataSource});
  @override
  Future<Data> getListOfProduct() {
  return productsDataSource.getListOfProduct();
  }

}