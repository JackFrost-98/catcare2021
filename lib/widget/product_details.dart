import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/screens/edit_product.dart';
import 'package:catcare2/screens/shop.dart';
import 'package:catcare2/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import 'favbtn.dart';

class ProductDetailsWidget extends StatelessWidget {
  final Product product;

  const ProductDetailsWidget({
    @required this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content:
                      Text('Purchased, click continue to return to Cat Market'),
                  action: SnackBarAction(
                    label: 'Continue',
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Shop()),
                      );
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onPrimary: Colors.white,
              ),
              child: Text("Add to Cart"),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        child: Container(
          key: Key(product.id),
          color: Colors.white,
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
            top: 50,
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: product.imgUrl.isEmpty
                            ? AssetImage("assets/images/Cat Health 1.png")
                            : NetworkImage(product.imgUrl),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 40),
                      child: Text(
                        'RM ${product.price}',
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    if (product.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          product.description,
                          style: TextStyle(
                              fontSize: 20, height: 1.5, color: Colors.grey),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Cat Market Details",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        // FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }

  void deleteProduct(BuildContext context, Product product) {
    final provider = Provider.of<ProductController>(context, listen: false);
    provider.removeProduct(product);

    Utils.showSnackBar(context, 'Deleted the task');
  }
}
