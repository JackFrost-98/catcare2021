import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FundHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image(
              alignment: Alignment.topCenter,
              image: AssetImage("assets/images/stripe cyan.png"),
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            Positioned(
              top: 40,
              left: 30,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      LineAwesomeIcons.search,
                      color: Colors.grey[700],
                      size: 30,
                    ),
                  ),
                  Text(
                    "Lets start funding!",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 35,
                        fontFamily: 'CentraleSansRegular'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 32,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontFamily: 'CentraleSansRegular',
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              height: 400,
              width: 400,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    trailing: Icon(Icons.more_vert),
                    leading: Image.asset("assets/images/default.jpg"),
                    title: Text("Feeding Stray Cat",
                        style: TextStyle(
                            fontFamily: "Universiti Teknologi Malaysia",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text("Cat Shelter fundraising",
                        style: TextStyle(
                          fontFamily: "Universiti Teknologi Malaysia",
                          fontSize: 15,
                        )),
                    /*onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(prof, mockData)),
                    );
                  },*/
                  ),
                  ListTile(
                    trailing: Icon(Icons.more_vert),
                    leading: Image.asset("assets/images/default.jpg"),
                    title: Text("Low Cost Cat Hotel",
                        style: TextStyle(
                            fontFamily: "Skudai",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text("Fundraising for Free Cat Grooming",
                        style: TextStyle(
                          fontFamily: "Universiti Teknologi Malaysia",
                          fontSize: 15,
                        )),
                  ),
                  ListTile(
                    trailing: Icon(Icons.more_vert),
                    leading: Image.asset("assets/images/default.jpg"),
                    title: Text("Sharing is Caring",
                        style: TextStyle(
                            fontFamily: "Melaka",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text("Cat also hungry",
                        style: TextStyle(
                          fontFamily: "Selangor",
                          fontSize: 15,
                        )),
                  ),
                  ListTile(
                    trailing: Icon(Icons.more_vert),
                    leading: Image.asset("assets/images/default.jpg"),
                    title: Text("Fantastic Cat",
                        style: TextStyle(
                            fontFamily: "Malaysia",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text("Feline cross breeding",
                        style: TextStyle(
                          fontFamily: "Malaysia",
                          fontSize: 15,
                        )),
                  ),
                  ListTile(
                    trailing: Icon(Icons.more_vert),
                    leading: Image.asset("assets/images/default.jpg"),
                    title: Text("Raise Cat Neuter awareness, UTM",
                        style: TextStyle(
                            fontFamily: "CentraleSansRegular",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text("New Design Feline House",
                        style: TextStyle(
                          fontFamily: "CentraleSansRegular",
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
