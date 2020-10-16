import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:inventory_management_system/Screens/details_screen.dart';


class QRScanner extends StatefulWidget {
  @override
  _QRScanner createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {
  var result = "";
  Future _scan() async {
    try {
      ScanResult qrRes = await BarcodeScanner.scan();
      setState(() {
        result = qrRes.rawContent;
        print("\n\n\n" + result);
      });

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => DetailsScreen(result)),
      // );

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
