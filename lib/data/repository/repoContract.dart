
import '../model/Data.dart';

abstract class ProductsRepository {
  Future<Data> getListOfProduct();
}

abstract class ProductsDataSource {
  Future<Data> getListOfProduct();
}