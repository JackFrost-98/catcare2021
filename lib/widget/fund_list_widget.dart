import 'package:catcare2/models/funds.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/widget/product_widget.dart';
import 'package:flutter/material.dart';

import 'fund_widget.dart';

class FundListWidget extends StatelessWidget {
  final List<Funds> funds;
  FundListWidget({@required this.funds});

  @override
  Widget build(BuildContext context) {
    return funds.isEmpty
        ? Center(
            child: Text(
              'No products.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : SizedBox(
            height: 230,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) => Container(height: 8),
              itemCount: funds.length,
              itemBuilder: (context, index) => FundWidget(fund: funds[index]),
            ),
          );
  }
}
