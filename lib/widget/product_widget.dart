import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/screens/edit_product.dart';
import 'package:catcare2/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    @required this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        key: Key(product.id),
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
                      image: product.imgUrl.isEmpty
                          ? AssetImage("assets/images/Cat Health 1.png")
                          : NetworkImage(product.imgUrl),
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
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      'RM ${product.price}',
                      style: TextStyle(fontSize: 20, height: 1.5),
                    ),
                  ),
                  if (product.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        product.description,
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

  void deleteProduct(BuildContext context, Product product) {
    final provider = Provider.of<ProductController>(context, listen: false);
    provider.removeProduct(product);

    Utils.showSnackBar(context, 'Deleted the task');
  }
}
