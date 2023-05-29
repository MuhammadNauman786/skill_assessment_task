import 'package:flutter/material.dart';
import 'package:skill_assessment_task/modals/api_response.dart';

import '../modals/category_product.dart';
import '../services/category_services.dart';

class CategoryProductProvider with ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  int? statusCode;
  List<CategoryProduct>? categoryProducts;
  late CategoriesService categoriesService;

  CategoryProductProvider(){
    categoriesService = CategoriesService();
  }

  dynamic getCategoryProducts()async{
    isLoading = true;
    notifyListeners();

    ApiResponse<List<CategoryProduct>> response = await categoriesService.fetchCategoryProducts();

    if(response.statusCode == 200){
      categoryProducts = response.data;
    }
    else {
      statusCode = response.statusCode;
      errorMessage = response.error;
    }

    isLoading = false;
    notifyListeners();
  }

}