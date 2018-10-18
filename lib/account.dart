import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 10.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: Image.asset(
              "assets/login.jpg",
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            height: 20.0,
          ),
          new Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            child: new Column(children: <Widget>[
              new Text(
                "You're not signed in",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 10.0, left: 25.0, right: 25.0, bottom: 20.0),
                child: new Text(
                  "Sign in now to upload, save, and comment on videos.",
                  style: TextStyle(color: Colors.grey[700], fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
              new RaisedButton(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                onPressed: () {},
                color: Colors.blue,
                child: new Text(
                  "SIGN IN",
                  style: new TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
      color: Colors.grey[300],
    );
  }
}

// new Container(
//           color: Colors.grey,
//           width: MediaQuery.of(context).size.width,
//           height: 60.0,
//           child: new RawMaterialButton(
//             fillColor: Colors.blue,
//               elevation: 0.0,
//               child: new Text(
//                 "SIGN IN",
//                 style: new TextStyle(fontSize: 0.0, color: Colors.white),
//               ),
//               onPressed: () {}),
//         ),
