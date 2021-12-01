import 'package:flutter/material.dart';
import 'package:local_json/custom_value/CustomColors.dart';
import 'package:local_json/custom_value/text_value.dart';
import 'package:local_json/widget/custom_app_bar.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.appBackGroundColor,
      appBar: CustomAppBar(
        title: TextValue.appBarTitle,
        backGroundColor: CustomColors.appBarColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Image(
                image: NetworkImage(widget._product.imageURL.toString()),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              widget._product.name,
              style: TextStyle(
                  color: CustomColors.textColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              widget._product.description,
              style: TextStyle(
                  color: CustomColors.textColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Price: " "${widget._product.price.toString()}" " Tk",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
            ),
            Divider(),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(context);
                },
                child: Text(
                  "Buy",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: CustomColors.appBarTextColor,
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Price"),
      content: Text(widget._product.price.toString()),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
