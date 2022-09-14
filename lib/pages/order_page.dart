import 'package:e_commerce_app_with_api/model/order_list_model.dart';
import 'package:e_commerce_app_with_api/providers/order_provider.dart';
import 'package:e_commerce_app_with_api/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const.dart';
import '../widget/my_order_card.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // List<OrderListModel> orderList = [];
  // bool isVisible = true;
  // @override
  // void didChangeDependencies() async {
  //   orderList = await ApiService().fetchOrder();
  //   setState(() {});
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var orderList = Provider.of<OrderProvider>(context).orderList;
    var orderProvider = Provider.of<OrderProvider>(context).getOrderData();
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: orderList.isNotEmpty
          ? Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Container(
                    height: 30.0,
                    margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "All Order",
                            style: myTextStyle(16, Colors.white),
                          ),
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Complete",
                            style: myTextStyle(16, Colors.white),
                          ),
                          color: Colors.black12,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Ongoing",
                            style: myTextStyle(16, Colors.white),
                          ),
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: orderList.length,
                            itemBuilder: (context, index) {
                              return MyOrderCard(
                                orderList: orderList,
                                index: index,
                              );
                            },
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
