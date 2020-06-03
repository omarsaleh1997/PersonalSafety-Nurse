import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personalsafteynurse/componants/color.dart';
import 'login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Exit Application?', style: TextStyle(color: Colors.white)),
            content: Text('You are going to exit the application.',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              FlatButton(
                child: Text('NO', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Color(0xffEA0046),
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/images/cloud.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/location.svg',
                    width: 300,
                    height: 200,
                  ),
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 400.0, left: 35),
                      child: Text('PERSONAL',
                          style: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(35, 460, 0.0, 0.0),
                      child: Text('RESCUE',
                          style: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.only(
                    top: 550, left: 40.0, bottom: 10, right: 40),
                child: Container(
                  height: 50.0,
                  width: 500,
                  child: RaisedButton(
                    color: greyFade,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
