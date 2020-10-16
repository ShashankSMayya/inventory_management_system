import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'details_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QRScanner(),
    );
  }
}

class QRScanner extends StatefulWidget {
  @override
  _QRScanner createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {
  var result = "";

  Future addUserlog(qrRes) async{
    result = qrRes.toString();
    currentPhoneDate = DateTime.now().toString();
    currentPhoneDate = currentPhoneDate.substring(0,19);
    var usrname= await getStringValuesSF();
    usrname =usrname.substring(11,usrname.length - 1);
    getData([usrname, currentPhoneDate, result]);
  }

  String currentPhoneDate;
  String Formatted;
  Future _scan() async {
    try {
      ScanResult qrRes = await BarcodeScanner.scan();
      setState(()  {
        addUserlog(qrRes);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailsScreen(result, currentPhoneDate.toString())),
      );
      addStringToSF('product_id',result);
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera Permission necessary";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "Scan Incomplete";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text("Scan Part"),
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Welcome User',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          onPressed: _scan,
          label: Text(
            "Scan QR",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          icon: Icon(Icons.camera_alt),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Future<String> getData(details) async {
  var data = details;
  String body = json.encode(data);
  var url = 'https://demo121flutter.000webhostapp.com/addUserLog.php';
  http.Response response = await http.post(url, body: body);
  var result = jsonDecode(response.body);
  print("\n\n\n" + result);
  if (result.toString() == 'False') //incorrect username or password
    print("Failed to fetch");
  else if (result.toString() == 'True')
    print("Data fetched"); //goes to next page
  else
    print("ERROR");
  return result;}

 getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = await prefs.getString('username') ?? 'blank value';
  return stringValue;
}
addStringToSF(key,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key.toString(), value.toString());
}