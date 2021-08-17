import 'package:catcare2/models/funds.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/fund_controller.dart';
import 'package:catcare2/screens/edit_product.dart';
import 'package:catcare2/screens/fundMain.dart';
import 'package:catcare2/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class FundDetailsWidget extends StatelessWidget {
  final Funds fund;

  const FundDetailsWidget({
    @required this.fund,
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
                  content: Text(
                      'Thank you for backing this project! Click Continue to return to Fund Page'),
                  action: SnackBarAction(
                    label: 'Continue',
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => Fund()),
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
              child: Text("Back this project for RM 5"),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        child: Container(
          key: Key(fund.id),
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
                        image: fund.imgUrl.isEmpty
                            ? AssetImage("assets/images/Cat Health 1.png")
                            : NetworkImage(fund.imgUrl),
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
                        fund.title,
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
                        'Goal RM 5000',
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    if (fund.description.isNotEmpty)
                      Container(
                          height: 200,
                          child: SingleChildScrollView(
                            child: Text(
                              fund.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.5,
                                color: Colors.grey,
                              ),
                            ),
                          )),
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
        "Cat Fund Details",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        // FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }

  void deleteFund(BuildContext context, Funds fund) {
    final provider = Provider.of<FundController>(context, listen: false);
    provider.removeFund(fund);

    Utils.showSnackBar(context, 'Deleted the task');
  }
}
