import 'dart:convert';

import 'package:e_commerce_app_with_api/const.dart';
import 'package:e_commerce_app_with_api/model/category_list_model.dart';
import 'package:e_commerce_app_with_api/model/order_list_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };

  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}",
    };
    return header;
  }

  static Future<String> login(String email, String password) async {
    try {
      var endPointUrl = "${baseUrl}api/admin/sign-in";
      Map map = Map<String, dynamic>();
      map["email"] = email;
      map["password"] = password;
      var response = await http.post(
        Uri.parse(endPointUrl),
        body: map,
        headers: defaultHeader,
      );

      if (response.statusCode == 200) {
        // showInToast("Login Succesfull");
        return response.body;
      } else {
        // showInToast("Invalid email or password");
        return "Data Loading Error ";
      }
    } catch (e) {
      return "something is wrong $e";
    }
  }

  Future<List<OrderListModel>> fetchOrder() async {
    List<OrderListModel> orderList = [];
    try {
      var endPointUrl = "${baseUrl}api/admin/all/orders";
      var response = await http.get(
        Uri.parse(endPointUrl),
        headers: await getHeaderWithToken(),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        OrderListModel orderListModel;
        for (var i in data) {
          orderListModel = OrderListModel.fromJson(i);
          orderList.add(orderListModel);
        }
        return orderList;
      } else {
        return orderList;
      }
    } catch (e) {
      print("Errorrrrrrrrrrrrrr $e");
      return orderList;
    }
  }

  Future<List<CategoryListModel>> fetchCategory() async {
    List<CategoryListModel> categoryList = [];
    try {
      var endPointUrl = '${baseUrl}api/admin/category';
      var response = await http.get(Uri.parse(endPointUrl),
          headers: await getHeaderWithToken());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        CategoryListModel categoryListModel;
        for (var i in data) {
          categoryListModel = CategoryListModel.fromJson(i);
          categoryList.add(categoryListModel);
        }
        return categoryList;
      } else {
        return categoryList;
      }
    } catch (e) {
      print(e);
      return categoryList;
    }
  }
}
