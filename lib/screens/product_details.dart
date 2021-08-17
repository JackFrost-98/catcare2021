import 'package:catcare2/models/products.dart';
import 'package:catcare2/widget/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final List<Product> products;
  ProductDetails({@required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Center(
            child: Text(
              'No products.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : SizedBox(
            height: 260, child: ProductDetailsWidget(product: products[2]));
  }
}
