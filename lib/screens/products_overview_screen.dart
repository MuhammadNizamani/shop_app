import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/21.1%20badge.dart.dart';
import 'package:shop_app/widgets/product_grid.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  var _showOnlyfavoritesData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showOnlyfavoritesData = true;
                  } else {
                    _showOnlyfavoritesData = false;
                  }
                });
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
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.rounteName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyfavoritesData),
    );
  }
}
