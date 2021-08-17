import 'package:catcare2/controllers/fund_controller.dart';
import 'package:catcare2/widget/fund_list_widget.dart';
import 'package:catcare2/models/funds.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:catcare2/Animation/FadeAnimation.dart';

import 'Favourite.dart';
import 'fund_details.dart';
import 'fundhealth.dart';

class Category {
  String title;
  String imgSrc;
  Widget target;
  Category(this.title, this.imgSrc, this.target);
}

final List<Category> _categories = <Category>[
  Category('Food', 'assets/images/Cat Food.png', Heart()),
  Category('Toy', 'assets/images/Cat Toy.png', Heart()),
  Category('Health', 'assets/images/Cat Health 1.png', Heart()),
  Category('Shelter', 'assets/images/Cat Shelter.png', Heart()),
];

class Fund extends StatefulWidget {
  Fund({Key key}) : super(key: key);

  @override
  _FundState createState() => _FundState();
}

class _FundState extends State<Fund> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var fundController = FundController;
    return Stack(
      children: <Widget>[
        //Top Row Item
        Image(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/images/stripe cyan.png"),
          fit: BoxFit.contain,
          width: double.infinity,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
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
                              color: Colors.grey[500],
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {});
                            }),
                        Icon(
                          LineAwesomeIcons.search,
                          color: Colors.grey[500],
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Feline Market",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 37,
                        fontFamily: 'CentraleSansRegular'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 32,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.black87,
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
                      child: TextButton(
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
                          child: FutureBuilder<List<Funds>>(
                            future: FundController.fetchFunds(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return Center(
                                    child: CircularProgressIndicator());
                              return FundDetails(funds: snapshot.data);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  child: FutureBuilder<List<Funds>>(
                    future: FundController.fetchFunds(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      return FundListWidget(funds: snapshot.data);
                    },
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
