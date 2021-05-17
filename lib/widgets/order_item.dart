import 'package:flutter/material.dart';
import '../providers/orders.dart' as ol;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ol.OrderItem order;
  OrderItem(this.order);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("\$${order.amount}"),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.datatime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
