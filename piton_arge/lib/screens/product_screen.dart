import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:piton_arge/globalVariables/login_variables.dart';
import 'package:piton_arge/globalVariables/product_detail_variables.dart';
import 'package:piton_arge/screens/product_detail_screen.dart';
import 'package:piton_arge/screens/starter_screen.dart';
import 'package:piton_arge/service/product_service.dart';
import 'package:piton_arge/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class _ProductScreenState extends State<ProductScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () async{
                SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setBool("isLogin", false);
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
              },
              child: Icon(Icons.exit_to_app)),
          )
        ],
        title: TextWidget(text: "Piton"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: FutureBuilder(
          future: dioProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                  crossAxisCount: 1,
                  children: List.generate(snapshot.data.length, (index) {
                    String name = snapshot.data[index]["name"];
                    String detail = snapshot.data[index]["description"];
                    String price = snapshot.data[index]["price"].toString();
                    void _setDetailName(BuildContext context) {
                      Provider.of<ProductDetail>(context, listen: false)
                          .setDetailName(name);
                    }

                    void _setDetail(BuildContext context) {
                      Provider.of<ProductDetail>(context, listen: false)
                          .setDetail(detail);
                    }

                      void _setPrice(BuildContext context) {
                      Provider.of<ProductDetail>(context, listen: false)
                          .setPrice(price);
                    }

                    return InkWell(
                      onTap: () {
                        _setDetailName(context);
                        _setDetail(context);
                        _setPrice(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailScreen()),
                        );
                      },
                      child: ProductCard(
                        id: snapshot.data[index]["id"],
                        name: snapshot.data[index]["name"],
                        price: snapshot.data[index]["price"],
                      ),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
