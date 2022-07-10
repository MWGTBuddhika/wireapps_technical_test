import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:wireapps_technical_test/feature/home/entity/product.dart';

import '../../core/services/dio_networking_service.dart';
import '../constants/api_paths.dart';


class HomeRepository {
  static final HomeRepository _singleton = HomeRepository._internal();

  factory HomeRepository() {
    return _singleton;
  }
  HomeRepository._internal();

  Future<List<Product>?> fetchProducts() async {
    //calling endpoint using dio
    String url = APIPaths.productsAPI;
    Dio dio = DioNetworkingService.obj().dioClient;
    dio.options.headers['content-Type'] = 'application/json';

    final response = await dio.get(url);

    if(response.statusCode == 200){
      print(response.data);
      List<Product>? fetchedList =
      response.data['data']
          .map<Product>((n) => (Product.fromJson(n)))
          .toList();
      return fetchedList;

    } else {
      return null;
    }
  }
}
