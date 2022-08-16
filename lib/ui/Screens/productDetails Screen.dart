
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';

import 'package:nayakoseli/model/productTypes.dart';

import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ProductDetailScreen extends StatelessWidget{
  final Products products;


  ProductDetailScreen({required this.products});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.white,
              Theme.of(context).scaffoldBackgroundColor
            ]),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            )
                          ]),
                      child: Hero(
                        tag: products.imageUrl,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage(products.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10,
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30,
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Product Description: \n${products.description}",
                  style: TextStyle(color: Colors.grey),
                ),
                Card(
                  shadowColor: Colors.brown,
                  elevation: 16,
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Text(
                      "${products.productName}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.brown,
                  elevation: 16,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Price: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        textshow(products: products)
                      ],
                    ),
                  ),
                ),
              RatingBar(
                initialRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star),
                  half: Icon(Icons.star_half),
                  empty: Icon(Icons.star_border),
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {

                },
              ),


              Consumer<CartModel>(builder: (context, cart, child) {
                  return GestureDetector(
                    onTap: () async {


                      await cart.addProductsInCart(

                        id: cart.carts.length,
                        image: products.imageUrl,
                        rate: products.rate,
                        name: products.productName,
                        description: products.description,
                        quantity: 1,


                      );




                      Navigator.pop(context);

                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Colors.white,
                            ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 19,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(FontAwesomeIcons.shoppingCart)
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      )),
    ));
  }
}

class textshow extends StatelessWidget {
  const textshow({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Text(
      products.rate,
      style: TextStyle(fontSize: 28),
    );
  }
}
