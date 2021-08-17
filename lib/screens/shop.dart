import 'package:catcare2/api/firebase_api.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/screens/product_details.dart';
import 'package:catcare2/screens/shopfood.dart';
import 'package:catcare2/widget/product_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:catcare2/Animation/FadeAnimation.dart';
import 'package:provider/provider.dart';

import 'Favourite.dart';

class Category {
  String title;
  String imgSrc;
  Widget target;
  Category(this.title, this.imgSrc, this.target);
}

final List<Category> _categories = <Category>[
  Category('Food', 'assets/images/Cat Food.png', ShopFood()),
  Category('Toy', 'assets/images/Cat Toy.png', Heart()),
  Category('Health', 'assets/images/Cat Health 1.png', Heart()),
  Category('Shelter', 'assets/images/Cat Shelter.png', Heart()),
];

class Shop extends StatefulWidget {
  Shop({Key key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Top Row Item
        Image(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/images/purple.jpg"),
          fit: BoxFit.contain,
          width: double.infinity,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {});
                            }),
                        Icon(
                          LineAwesomeIcons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Feline Market",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'CentraleSansRegular'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 32,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w100),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 20,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w100),
                      ),
                    ],
                  )
                ],
              ),
            ),
            FadeAnimation(
              0.5,
              Container(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 170,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: FlatButton(
                          child: Text(
                            _categories[index].title,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      _categories[index].target),
                            );
                          }),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(_categories[index].imgSrc),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
              ),
            ),
            //Bottom List
            FadeAnimation(
                0.7,
                Container(
                    child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 500),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                          opacity: animation,
                          child: FutureBuilder<List<Product>>(
                            future: ProductController.fetchProducts(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Center(
                                    child: CircularProgressIndicator());
                              return ProductDetails(products: snapshot.data);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  child: FutureBuilder<List<Product>>(
                    future: ProductController.fetchProducts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      return ProductListWidget(products: snapshot.data);
                    },
                  ),
                ))),
          ],
        ),
      ],
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
