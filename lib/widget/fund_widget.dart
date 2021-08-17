import 'package:catcare2/models/funds.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/fund_controller.dart';
import 'package:catcare2/screens/edit_product.dart';
import 'package:catcare2/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FundWidget extends StatelessWidget {
  final Funds fund;

  const FundWidget({
    @required this.fund,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        key: Key(fund.id),
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: fund.imgUrl.isEmpty
                          ? AssetImage("assets/images/Cat Health 1.png")
                          : NetworkImage(fund.imgUrl),
                      fit: BoxFit.cover)),
            ),
            // Checkbox( dah apa lagi?
            //   activeColor: Theme.of(context).primaryColor,
            //   checkColor: Colors.white,
            //   value: product.isDone,
            //   onChanged: (_) {
            //     final isDone = ProductController.toggleProductStatus(product);

            //     Utils.showSnackBar(
            //       context,
            //       isDone ? 'Task completed' : 'Task marked incomplete',
            //     );
            //   },
            // ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fund.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      '${fund.goal}',
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ),
                  if (fund.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        fund.reason,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteFund(BuildContext context, Funds fund) {
    final provider = Provider.of<FundController>(context, listen: false);
    provider.removeFund(fund);

    Utils.showSnackBar(context, 'Deleted the task');
  }
}
