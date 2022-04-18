import 'package:flutter/material.dart';
import 'package:piton_arge/globalVariables/product_detail_variables.dart';
import 'package:piton_arge/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final name;
  const DetailScreen({Key? key, this.name}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    String name = Provider.of<ProductDetail>(context).getName;
    String detail = Provider.of<ProductDetail>(context).getDetail;
    String price = Provider.of<ProductDetail>(context).getPrice;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: name,
          size: 14.0,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset("assets/logo-nav.png"),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
             Row(
            children: [
              TextWidget(text: "Fiyat: ", size: 20.0,),
              TextWidget(text: price.toString(), size: 20.0,),
              TextWidget(text: "TL", size: 20.0,),
            ],
          ),
           TextWidget(text: detail, size: 20.0,),
          ],
        ),
      ),
    );
  }
}
