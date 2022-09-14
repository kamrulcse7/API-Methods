import 'package:e_commerce_app_with_api/model/order_list_model.dart';
import 'package:e_commerce_app_with_api/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier{
  List<OrderListModel> orderList = [];
  getOrderData()async{
    orderList = await ApiService().fetchOrder();
    notifyListeners();
  }
  
}