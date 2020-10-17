import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QRScanLogsScreen extends StatefulWidget {
  @override
  _QRScanLogsScreenState createState() => _QRScanLogsScreenState();
}

class _QRScanLogsScreenState extends State<QRScanLogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
Future getData() async{
  var id = await getStringValuesSF('product_id');
  String body =json.encode(id);
  var url = 'https://demo121flutter.000webhostapp.com/user_log.php';
  http.Response response = await http.post(url, body:body);
  var data = jsonDecode(response.body);
  //TODO display fetched data
}
getStringValuesSF(data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = await prefs.getString(data.toString()) ?? 'blank value';
  return stringValue;
}
addStringToSF(key,value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key.toString(), value.toString());
}