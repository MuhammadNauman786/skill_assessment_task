import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../modals/api_response.dart';
import '../modals/category_product.dart';
import '../utils/http_util.dart';

class CategoriesService {
  Future<ApiResponse<List<CategoryProduct>>> fetchCategoryProducts() async {
    try {
      Response response = await HttpUtil.instance.get(Uri.parse("https://fakestoreapi.com/products",));

      Iterable l = jsonDecode(response.body);
      List<CategoryProduct> categories = l.map<CategoryProduct>((categoryProduct) {
        return CategoryProduct.fromJson(categoryProduct);
      }).toList();

      return ApiResponse<List<CategoryProduct>>(
        statusCode: response.statusCode,
        data: categories,
      );
    } catch (e) {
      return ApiResponse<List<CategoryProduct>>(
        statusCode: HttpStatus.internalServerError,
        data: null,
        error: e.toString(),
      );
    }
  }
}
