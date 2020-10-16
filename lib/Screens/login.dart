import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/Scanner.dart';
import 'package:inventory_management_system/widgets/titleText.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Image.asset(
            'assets/images/login_icon.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
            SizedBox(height: 20,),
            Container(
              width: size.width-40,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email ID'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

              Container(
                width: size.width-40,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),
              ),
          SizedBox(height: 20,),
          ButtonTheme(
              minWidth: size.width-20,
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScanner()),
                  );
                },
                child: Text('LOG IN',style: TextStyle(color: Colors.white),),
              ),),


            ]
          ),
        ),
      ),
    );
  }
}
