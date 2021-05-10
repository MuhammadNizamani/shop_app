import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          backgroundColor: Colors.black45,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          )),
    );
  }
}
