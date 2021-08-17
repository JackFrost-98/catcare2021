import 'package:catcare2/controllers/imagePicker_controller.dart';
import 'package:flutter/material.dart';

class ProductFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String title;
  final String description;
  final String price;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedPrice;
  final VoidCallback onSavedProduct;

  const ProductFormWidget({
    Key key,
    @required this.formKey,
    @required this.title,
    this.price = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    @required this.onChangedPrice,
    @required this.onSavedProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          child: Center(
            child: SizedBox(
              width: 300,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Container(
                    //   child: Image.file(_image)
                    // ),
                    SizedBox(height: 8),
                    buildTitle(),
                    SizedBox(height: 8),
                    buildPrice(),
                    SizedBox(height: 8),
                    buildDescription(),
                    SizedBox(height: 16),
                    buildButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildPrice() => TextFormField(
        maxLines: 1,
        onChanged:
            onChangedPrice, //tq tukar satu bayar 100ringgitfor   using our service
        // validator: (price) {
        //   if (price.isEmpty) {
        //     return 'The price cannot be empty';
        //   }
        //   return price;
        // },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Price',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onSavedProduct,
          child: Text('Save'),
        ),
      );
}
