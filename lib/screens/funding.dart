// import 'package:catcare2/api/firebase_api.dart';
// import 'package:catcare2/controllers/downloadfile_firebase_api.dart';
import 'package:catcare2/controllers/fund_controller.dart';
import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/models/funds.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/screens/fundMain.dart';
import 'package:catcare2/widget/fund_list_widget.dart';
import 'package:catcare2/widget/personal_product_list_widget.dart';
import 'package:catcare2/widget/personal_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:catcare2/Animation/FadeAnimation.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'fund_details.dart';

class CreateFund extends StatefulWidget {
  CreateFund({Key key}) : super(key: key);

  @override
  _CreateFundState createState() => _CreateFundState();
}

class _CreateFundState extends State<CreateFund> {
  openURL() async {
    if (!await canLaunch("https://forms.gle/6L49XuWupZkbTUYx9")) {
      await launch("https://forms.gle/6L49XuWupZkbTUYx9");
    } else {
      throw 'Could not Launch URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          0.5,
                          Container(
                              child: ListTile(
                            leading: FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: null,
                              child: Icon(Icons.person),
                              backgroundColor: Colors.grey[400],
                            ),
                            title: Text('User'),
                            subtitle: Text('Create your fund here!'),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    0.6,
                    Container(
                      height: 165.0,
                      width: 300.0,
                      child: Center(
                          child: Text(
                              'Hi Apip, Here you can make a page to raise a fund for cats. Choose from these 3 at the bottom which you are willing to create fund raising :',
                              style: TextStyle(
                                fontSize: 17.0,
                                height: 1.5,
                              ))),
                    ),
                  ),
                  FadeAnimation(
                    0.7,
                    Container(
                      height: 120.0,
                      child: Center(
                        child: Row(children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(25.0, 2.0, 2.0, 2.0),
                            child: TextButton(
                              onPressed: () {
                                openURL();
                                // bool result = await FirebaseApi().downloadFile(
                                //     '/Cat Fund Form/CatCare Fund Form.docx');

                                // final snackBar = SnackBar(
                                //   content: Text(result
                                //       ? 'File started download.'
                                //       : 'File cannot be download'),
                                // );
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(snackBar);
                              },
                              child: Container(
                                height: 77.0,
                                width: 77.0,
                                child: Center(
                                    child: Text('Cat Food Fund',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          height: 1.5,
                                          color: Colors.black,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                            child: TextButton(
                              onPressed: () {
                                openURL();
                                // final snackBar = SnackBar(
                                //   content: Text(
                                //       'Please update you phone number to proceed.'),
                                //   action: SnackBarAction(
                                //     label: 'Go',
                                //     onPressed: () {
                                //       /*Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 SettingPage()),
                                //       );*/
                                //     },
                                //   ),
                                // );
                                // Scaffold.of(context).showSnackBar(snackBar);
                              },
                              child: Container(
                                height: 77.0,
                                width: 77.0,
                                child: Center(
                                    child: Text('Cat Shelter Fund',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          height: 1.5,
                                          color: Colors.black,
                                        ))),
                                decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              openURL();
                              // final snackBar = SnackBar(
                              //   content: Text(
                              //       'Please update you phone number to proceed.'),
                              //   action: SnackBarAction(
                              //     label: 'Go',
                              //     onPressed: () {
                              //       /*Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => SettingPage()),
                              //       );*/
                              //     },
                              //   ),
                              // );
                              // Scaffold.of(context).showSnackBar(snackBar);
                            },
                            child: Container(
                              height: 77.0,
                              width: 77.0,
                              child: Center(
                                  child: Text('Cat Neuter Fund',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1.5,
                                        color: Colors.black,
                                      ))),
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0,
                                    )
                                  ]),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    0.8,
                    Container(
                      height: 140.0,
                      child: Center(
                          child: Text('Currently Total Funding: \nRM200',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                                height: 1.5,
                              ))),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 3.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.9,
                    Container(
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 3.0,
                          )
                        ],
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  60.0, 20.0, 10.0, 0.0),
                              child: Icon(
                                Icons.favorite,
                                size: 35.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 26.0, 80.0, 0.0),
                              child: Text('209'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 20.0, 10.0, 0.0),
                              child: Icon(
                                Icons.share,
                                size: 35.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 26.0, 0.0, 0.0),
                              child: Text('100'),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          0.5,
                          Container(
                              child: ListTile(
                            leading: FloatingActionButton(
                              heroTag: "btn1",
                              onPressed: null,
                              child: Icon(Icons.person),
                              backgroundColor: Colors.grey[400],
                            ),
                            title: Text('Market'),
                            subtitle: Text('Track your item here!'),
                          )),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    0.7,
                    FutureBuilder<List<Product>>(
                      future: ProductController.fetchProducts(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: CircularProgressIndicator());
                        return PersonalProductListWidget(
                            products: snapshot.data);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

// class PlaceholderWidgetFund extends StatelessWidget {
//   PlaceholderWidgetFund();

// }
