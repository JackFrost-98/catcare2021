import 'package:catcare2/models/funds.dart';
import 'package:catcare2/widget/fund_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FundDetails extends StatelessWidget {
  final List<Funds> funds;
  FundDetails({@required this.funds});

  @override
  Widget build(BuildContext context) {
    return funds.isEmpty
        ? Center(
            child: Text(
              'No funds.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : SizedBox(height: 260, child: FundDetailsWidget(fund: funds[1]));
  }
}
