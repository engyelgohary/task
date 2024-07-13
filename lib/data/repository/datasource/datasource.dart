import 'package:taskroute/data/API/api_manger.dart';
import 'package:taskroute/data/repository/repoContract.dart';

import '../../model/Data.dart';

class ProductDataSourceImpl implements ProductsDataSource{
  ApiManager apiManager;
  ProductDataSourceImpl({required this.apiManager});
  @override
  Future<Data> getListOfProduct() async {
  return await apiManager.getListOfProduct();
  }
}