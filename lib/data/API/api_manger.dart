import 'dart:convert';
import '../model/Data.dart';
import 'api_constant.dart';
import 'package:http/http.dart' as http;


class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstanace() {
    _instance ??= ApiManager._();
    return _instance!;
  }
  Future<Data> getListOfProduct() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productApi);
    try {
      var response = await http.get(url);
      var productsResponse =
      Data.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return productsResponse;
      } else {
        throw Exception(
            'Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching products: $error');
      throw Exception('Error fetching products: $error');
    }
  }
}