import 'package:catcare2/screens/add_product.dart';
import 'package:catcare2/screens/shop.dart';
import 'package:catcare2/screens/statistic.dart';
import 'package:catcare2/widget/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'fundMain.dart';
import 'funding.dart';

class MenuPage extends StatefulWidget {
  final int currentIndex;
  MenuPage({this.currentIndex = 0});
  @override
  _MenuPageState createState() => new _MenuPageState();
}

Drawer _buildDrawer() {
  return Drawer(
      child: ListView(children: <Widget>[
    DrawerHeaderItem(),
    LogoutItem(),
    ReferAFriendItem(),
    AddProduct(),
    AboutItem(),
    RateAppItem(),
  ]));
}

//Menu Header
class DrawerHeaderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
//      child: Text("Menu",
//        style: TextStyle(
//          fontSize: 20.0,
//          color: Colors.white,
//        ),
//      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
            image: AssetImage("assets/images/blue.jpg"), fit: BoxFit.contain),
      ),
      child: null,
    );
  }
}

/// Logout item
class LogoutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Logout"),
      leading: Icon(Icons.exit_to_app, color: Colors.grey),
      onTap: () {
//        AuthProvider().logout();

//        Navigator.pop(context);
//        Navigator.pop(context);

        Navigator.pushNamed(context, '/');
      },
    );
  }
}

/// Refer a friend item
class ReferAFriendItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Refer a Friend"),
      leading: Icon(Icons.share, color: Colors.grey),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, '/refer-a-friend');
      },
    );
  }
}

/// Add Product
class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Sell Item in Market"),
      leading: Icon(Icons.add_business, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProductPage()),
        );
      },
    );
  }
}

/// About item
class AboutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("About"),
      leading: Icon(Icons.info_outline, color: Colors.grey),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, '/about');
      },
    );
  }
}

/// Rate app item
class RateAppItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Rate Us"),
      leading: Icon(Icons.star, color: Colors.grey),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, '/rate-app');
      },
    );
  }
}

Drawer _buildEndDrawer() {
  return Drawer(
      child: ListView(
          children: <Widget>[DrawerHeader(child: Text('This is Setting'))]));
}

class _MenuPageState extends State<MenuPage> {
  String _currTitle = 'Welcome to Cat Community!';
  int _currIndex = 0;
  final List<Widget> _children = [
    //ProductListWidget(),
    Fund(),
    CreateFund(),
    Shop(),
    Chart(),
  ];

  @override
  void initState() {
    super.initState();
    _currIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currTitle),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            //onPressed: () {Navigator.of(context).pushNamed('/setting');}
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingPage(
                          userID: widget.userID,
                        )),
              );*/
            },
          ),
        ],
      ),
      body: _children[_currIndex],
      drawer: _buildDrawer(),
      endDrawer: _buildEndDrawer(),
      bottomNavigationBar: Container(
        height: 60,
        child: BottomNavigationBar(
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          onTap: onTabTapped,
          currentIndex: _currIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: 'Create Fund',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Market',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
                backgroundColor: Colors.pink),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    if (index == _currIndex) setState(() {});
    setState(() {
      _currIndex = index;
    });
  }
}
