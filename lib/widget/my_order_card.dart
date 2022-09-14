
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const.dart';
import '../model/order_list_model.dart';

class MyOrderCard extends StatelessWidget {
  MyOrderCard({
    Key? key,
    required this.orderList,
    required this.index,
  }) : super(key: key);

  final List<OrderListModel> orderList;
  int index;

  @override
  Widget build(BuildContext context) {
    String dateTime = DateFormat("dd MMM yyyy, hh:mm a")
        .format(DateTime.parse("${orderList[index].orderDateAndTime}"));
    String orderStatus =
        '${orderList[index].orderStatus!.orderStatusCategory!.name}';
    String orderId = '${orderList[index].id}';

    var payStatus = orderList[index].payment!.paymentStatus;
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${dateTime}",
                  style: myTextStyle(14.0, Colors.black54),
                ),
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: orderStatus == 'Ongoing'
                      ? Colors.orangeAccent
                      : Colors.lightGreen,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                    child: Text(
                      "${orderStatus}",
                      style: myTextStyle(14.0, Colors.white, FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              height: 20.0,
            ),
            rowListItem(
              title: "Customer Name:",
              value: "${orderList[index].user!.name}",
              clr: Colors.teal[50],
            ),
            rowListItem(
              title: "Product Price:",
              value: "${orderList[index].price}",
            ),
            rowListItem(
              title: "Product Quantity:",
              value: "${orderList[index].quantity}",
              clr: Colors.teal[50],
            ),
            rowListItem(
              title: "Payment Status:",
              value: payStatus == 0 ? "Complete" : "Processing",
              // clr: Colors.teal[50],
            ),
          ],
        ),
      ),
    );
  }

  Container rowListItem({String? title, String? value, Color? clr}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration:
          BoxDecoration(color: clr, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${title}",
            style: myTextStyle(15.0, Colors.black54, FontWeight.w400),
          ),
          Text(
            "${value}",
            style: myTextStyle(15.0, Colors.black87, FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
