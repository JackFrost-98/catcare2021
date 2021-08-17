import 'package:catcare2/models/products.dart';
import 'package:catcare2/widget/product_widget.dart';
import 'package:flutter/material.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  ProductListWidget({@required this.products});

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
            height: 260,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) => Container(height: 8),
              itemCount: products.length,
              itemBuilder: (context, index) =>
                  ProductWidget(product: products[index]),
            ),
          );
  }
}
