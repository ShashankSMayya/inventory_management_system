import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/login.dart';
import 'package:inventory_management_system/widgets/titleText.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/signup_icon.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                icon: Icon(
                  Icons.account_circle_rounded,
                ),
              ),
            ),
          ),
          Container(
            width: size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email-ID',
                icon: Icon(
                  Icons.email,
                ),
              ),
            ),
          ),
          Container(
            width: size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile-Number',
                icon: Icon(
                  Icons.phone,
                ),
              ),
            ),
          ),
          Container(
            width: size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Set-Password',
                icon: Icon(
                  Icons.lock,
                ),
              ),
            ),
          ),
          Container(
            width: size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm-Password',
                icon: Icon(
                  Icons.lock,
                ),),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            minWidth: size.width - 20,
            child: RaisedButton(
              shape: StadiumBorder(),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                'REGISTER',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
