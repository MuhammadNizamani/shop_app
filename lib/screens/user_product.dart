import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_products_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';

class UserProduct extends StatelessWidget {
  static const routeName = "/user-product";

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductsScreen.routeName);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productData.item.length,
            itemBuilder: (_, i) => Column(
                  children: <Widget>[
                    UserProductItem(
                      id: productData.item[i].id,
                      title: productData.item[i].title,
                      imageUrl: productData.item[i].imageUrl,
                    ),
                    Divider(),
                  ],
                )),
      ),
    );
  }
}
