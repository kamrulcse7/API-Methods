import 'package:e_commerce_app_with_api/model/category_list_model.dart';
import 'package:e_commerce_app_with_api/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider with ChangeNotifier{
  List<CategoryListModel> categoryList = [];
  getcategoryData()async{
    categoryList = await ApiService().fetchCategory();
    notifyListeners();
  }
}