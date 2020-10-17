import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  final String productId, msg;
  DetailsScreen(this.productId, this.msg);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}


class _DetailsScreenState extends State<DetailsScreen> {
  var product_name;
  var product_id;
  var product_brand;
  var product_cat;
  var product_desc;
  var product_image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1200px-Cat03.jpg'),
            ),
            Text(""),
            Text('Description................')


          ],
        ),
      ),
    );
  }

  Future getData() async{
    var id = await getStringValuesSF('product_id');
    String body =json.encode(id);
    var url = 'https://demo121flutter.000webhostapp.com/product_details.php';//
    http.Response response = await http.post(url, body:body);
    Map data = jsonDecode(response.body);
    product_name = data["product_title"];
    product_id = data["product_id"];
    product_brand = data["product_brand"];
    product_cat = data["product_cat"];
    product_desc = data["product_desc"];
    product_image = data["product_image"];
  }
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