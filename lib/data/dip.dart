import 'package:taskroute/data/repository/datasource/datasource.dart';
import 'package:taskroute/data/repository/repoContract.dart';
import 'package:taskroute/data/repository/repository/repository.dart';

import 'API/api_manger.dart';

ProductsRepository injectProductsRepository(){
  return ProductsRepositoryImpl(productsDataSource: injectProductsRemoteDataSource());
}
ProductsDataSource injectProductsRemoteDataSource(){
  return ProductDataSourceImpl(apiManager:ApiManager.getInstanace());
}