import 'package:catcare2/screens/fundMain.dart';
import 'package:catcare2/screens/home.dart';
import 'package:catcare2/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catcare2/screens/signup.dart';

import '../models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:catcare2/Animation/FadeAnimation.dart';
import 'package:provider/provider.dart';

import 'menu.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key}) : super(key: key);
  static const routeName = '/signup';

  get user => null;

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  //Username
  Container buildContainerUsername(var label) {
    return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[100]))),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
          ),
        ));
  }

  //Email
  Container buildContainerEmail(var label) {
    return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[100]))),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.isEmpty || !value.contains('@')) {
              return 'invalid email';
            }
            return null;
          },
          /*onSaved: (value) {
            _authData['email'] = value;
          },*/
          onChanged: (value) {
            setState(() {
              _email = value.trim();
            });
          },
        ));
  }

  //Password
  Container buildContainerPassword(var label) {
    return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[100]))),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
          ),
          obscureText: true,
          controller: _passwordController,
          validator: (value) {
            if (value.isEmpty || value.length <= 6) {
              return 'invalid password';
            }
            return null;
          },
          /*onSaved: (value) {
            _authData['password'] = value;
          },*/
          onChanged: (value) {
            setState(() {
              _password = value.trim();
            });
          },
        ));
  }

  //Confirm Password
  Container buildContainerConfirmPassword(var label) {
    return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[100]))),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
          ),
          obscureText: true,
          validator: (value) {
            if (value.isEmpty || value != _passwordController.text) {
              return 'invalid password';
            }
            return null;
          },
          onSaved: (value) {},
        ));
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

//Submit Function
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    await Provider.of<Authentication>(context, listen: false)
        .signUp(_authData['email'], _authData['password']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 100,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 80,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 80,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        right: -200,
                        bottom: 0,
                        width: 800,
                        height: 200,
                        child: Center(
                          child: FadeAnimation(
                              1.5,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/catlogo.png'))),
                              )),
                        ),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 80),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: Colors.black,
                                          offset: Offset(10.0, 10.0),
                                        ),
                                      ]),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  //buildContainerUsername("Username"),
                                  buildContainerEmail("Email"),
                                  buildContainerPassword("Password"),
                                  //buildContainerUsername("Phone No."),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10.0,
                                    offset: Offset(
                                      10.0,
                                      10.0,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Colors.white,
                                  Colors.pink,
                                ])),
                            child: Center(
                              child: TextButton(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    //_submit();
                                    auth.createUserWithEmailAndPassword(
                                        email: _email, password: _password);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MenuPage()),
                                    );
                                  }),
                            ),
                          )),
                      SizedBox(
                        height: 50,
                        child: FadeAnimation(
                          1.5,
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        /*appBar: AppBar(
          title: Text('Login'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.pinkAccent, Colors.pink])),
            ),
          ],
        )*/
        );
  }
}
