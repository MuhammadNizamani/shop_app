import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                print(selectedValue);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favorite"),
                      value: FilterOptions.Favorite,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOptions.All,
                    )
                  ])
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
