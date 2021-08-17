import 'package:catcare2/controllers/product_controller.dart';
import 'package:catcare2/screens/add_product.dart';
import 'package:catcare2/screens/fundMain.dart';
import 'package:catcare2/screens/menu.dart';
import 'package:catcare2/screens/product_details.dart';
import 'package:catcare2/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
// import 'package:provider/provider.dart';
// import 'package:catcare2/models/authentication.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Care',
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (context) => SignupScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          Home.routeName: (context) => Home(),
          // _FundState.routeName: (context) => _FundState(),
          AddProductPage.routeName: (context) => AddProductPage(),
        },
      );

  //  MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<ProductController>(
  //           create: (_) => ProductController(),
  //         ),
  //       ],
  //       child: MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         title: 'Cat Care',
  //         theme: ThemeData(
  //           primaryColor: Colors.blueGrey,
  //         ),
  //         home: MenuPage(),
  //         routes: {
  //           SignupScreen.routeName: (context) => SignupScreen(),
  //           LoginScreen.routeName: (context) => LoginScreen(),
  //           Home.routeName: (context) => Home(),
  //           Fund.routeName: (context) => Fund(),
  //           AddProductPage.routeName: (context) => AddProductPage(),
  //         },
  //       ),
  //     );
}
