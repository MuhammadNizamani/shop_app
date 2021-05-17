import 'package:flutter/material.dart';
import 'package:shop_app/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("friend Hello! "),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Payment"),
            onTap: () {
              Navigator.of(context).popAndPushNamed(OrdersScreen.rountName);
            },
          ),
        ],
      ),
    );
  }
}
