import 'package:flutter/material.dart';
import 'package:piton_arge/service/like_service.dart';
import 'package:piton_arge/service/un_like_service.dart';
import 'package:piton_arge/widgets/text_widget.dart';

class ProductCard extends StatefulWidget {
  final id;
  final name;
  final price;
  const ProductCard({
    Key? key,
    this.id,
    this.name,
    this.price,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

bool isLiked = false;

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                              if (isLiked == true) {
                                dioLike(widget.id);
                              } else {
                                dioUnLike(widget.id);
                              }
                            });
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: isLiked == false
                                ? Colors.grey
                                : Colors.red[200],
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                size: 40,
                                color: isLiked == false
                                    ? Colors.grey[600]
                                    : Colors.red,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Image.asset("assets/logo-nav.png"),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          TextWidget(text: widget.name, size: 20.0),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextWidget(text: "Fiyat: "),
              TextWidget(text: widget.price.toString()),
              TextWidget(text: "TL"),
            ],
          )
        ],
      ),
    );
  }
}
