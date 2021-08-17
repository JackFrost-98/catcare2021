// import 'package:catcare2/models/products.dart';
// import 'package:catcare2/controllers/product_controller.dart';
// import 'package:catcare2/widget/product_form_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class EditProductPage extends StatefulWidget {
//   final Product product;

//   const EditProductPage({Key key, @required this.product}) : super(key: key);

//   @override
//   _EditProductPageState createState() => _EditProductPageState();
// }

// class _EditProductPageState extends State<EditProductPage> {
//   final _formKey = GlobalKey<FormState>();

//   String title;
//   String description;

//   @override
//   void initState() {
//     super.initState();

//     title = widget.product.title;
//     description = widget.product.description;
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text('Edit Product'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {
//                 final provider =
//                     Provider.of<ProductController>(context, listen: false);
//                 provider.removeProduct(widget.product);

//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: ProductFormWidget(
//               title: title,
//               description: description,
//               onChangedTitle: (title) => setState(() => this.title = title),
//               onChangedDescription: (description) =>
//                   setState(() => this.description = description),
//               onSavedProduct: saveProduct,
//             ),
//           ),
//         ),
//       );

//   void saveProduct() {
//     final isValid = _formKey.currentState.validate();

//     if (!isValid) {
//       return;
//     } else {
//       final provider = Provider.of<ProductController>(context, listen: false);

//       provider.updateProduct(widget.product, title, description);

//       Navigator.of(context).pop();
//     }
//   }
// }
