import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/screens/edit_product.dart';
import 'package:catcare2/widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class PersonalProductWidget extends StatelessWidget {
  final Product product;

  const PersonalProductWidget({
    @required this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(product.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              //onTap: () => editProduct(context, product),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteProduct(context, product),
              icon: Icons.delete,
            )
          ],
          child: buildProduct(context),
        ),
      );

  Widget buildProduct(BuildContext context) => GestureDetector(
        //onTap: () => editProduct(context, product),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: product.isDone,
                onChanged: (_) {
                  final isDone = ProductController.toggleProductStatus(product);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task completed' : 'Task marked incomplete',
                  );
                },
              ),
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
                    if (product.description.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          product.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteProduct(BuildContext context, Product product) {
    final provider = Provider.of<ProductController>(context, listen: false);
    provider.removeProduct(product);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  // void editProduct(BuildContext context, Product product) =>
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => EditProductPage(product: product),
  //       ),
  //     );
}
