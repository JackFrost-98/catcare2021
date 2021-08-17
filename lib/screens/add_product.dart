import 'dart:io';

import 'package:catcare2/api/firebase_api.dart';
import 'package:catcare2/models/products.dart';
import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/screens/menu.dart';
import 'package:catcare2/widget/product_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  static const routeName = '/addProductPage';
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  File _image;
  String title;
  String description;
  String price;
  String imgSrc;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.topCenter,
                child: ImageForm(image: _image, callback: getImage),
              ),
              const SizedBox(height: 60),
              ProductFormWidget(
                formKey: _formKey,
                title: title,
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onChangedPrice: (price) => setState(() => this.price = price),
                onSavedProduct: addProduct,
              ),
            ],
          ),
        ),
      );

  void addProduct() async {
    final isValid = _formKey.currentState.validate();

    if (!isValid && _image == null) {
      return;
    } else {
      String downloadUrl = await FirebaseApi().uploadFile(title, _image);
      final product = Product(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        price: price,
        imgUrl: downloadUrl,
        createdTime: DateTime.now(),
      );

      bool status = await ProductController.insertProduct(product);

      status
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MenuPage(currentIndex: 2)),
            )
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Oops there is a problem occured during save')));
    }
  }

  Future getImage({bool gallery = true}) async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;
    // Let user select photo from gallery
    if (gallery) {
      pickedFile = await picker.getImage(
        source: ImageSource.gallery,
      );
    }
    // Otherwise open camera to get new photo
    else {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
      );
    }

    setState(() {
      // <- ni pakai dalam stateful widget giler
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        //_image = File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }
}

class ImageForm extends StatefulWidget {
  final File image;
  final Function callback;
  ImageForm({@required this.image, @required this.callback, Key key})
      : super(key: key);

  @override
  _ImageFormState createState() => _ImageFormState();
}

class _ImageFormState extends State<ImageForm> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return widget.image == null
        ? Column(
            children: [
              Text('No image selected.'),
              RawMaterialButton(
                fillColor: Colors.pinkAccent,
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  color: Colors.white,
                ),
                elevation: 8,
                onPressed: widget.callback,
                padding: EdgeInsets.all(15),
                shape: CircleBorder(),
              )
            ],
          )
        : Image.file(widget.image);
  }
}
