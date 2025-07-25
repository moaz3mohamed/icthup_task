import 'package:dio/dio.dart';
import 'package:flutter_application_2/model/produt_api_model.dart';

class ProductApiDataSourceImpl {
  static final dio = Dio();
  static List<ProdutApiModel> products = [];

  static Future getproduct() async {
    try {
      var response = await dio.get('https://fakestoreapi.com/products#');
      if (response.statusCode == 200) {
        List newRespon = response.data;
        for (var item in newRespon) {
          // ignore: unused_local_variable
          final reslt = ProdutApiModel.fromJson(item);
          products.add(reslt);
        }
      } else {
        // ignore: avoid_print
        print('cant get product');
      }
    } catch (e) {
      // ignore: avoid_print
      print('error${e.toString()}');
    }
  }
}
