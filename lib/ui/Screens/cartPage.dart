import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/model/trackordermodel.dart';

import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 10,
        ),
        Consumer<CartModel>(
          builder: (context, cart, child) {
            return cart.carts != null
                ? Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, position) {
                          var product = cart.carts[position];
                          int quantity = product.quantity;
                          int rate = int.parse(product.rate) * quantity;

                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Stack(children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(140, 5, 10, 5),
                                  margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 6,
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Text(
                                          product.productName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Rs: "
                                        "$rate",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Piece: "
                                        "${product.quantity}",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () async {
                                            // TrackOrderModel order = TrackOrderModel(
                                            //     orderId: "2189sfjuhsa",
                                            //     name: product.productName,
                                            //     isShipped: true,
                                            //     isPlaced: true,
                                            //     isDelivered: true,
                                            //     isPicked: true);
                                            cart.orderAdd(
                                                visible: true,
                                                orderId: "2189sfjuhsa",
                                                name: product.productName,
                                                isPlaced: true,
                                                isShipped: false,
                                                isPicked: false,
                                                isDelivered: false);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            alignment: Alignment.bottomRight,
                                            child: TextButton(
                                              onPressed: () {
                                                cart.orderAdd(
                                                    visible: true,
                                                    orderId: "2189sfjuhsa",
                                                    name: product.productName,
                                                    isPlaced: true,
                                                    isShipped: false,
                                                    isPicked: false,
                                                    isDelivered: false);
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.store,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    "Buy Now",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(
                                      product.imageUrl,
                                    ),
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: IconButton(
                                    onPressed: () async {
                                      print("Hello");

                                      cart.deleteProductsInCart(position);

                                      cart.decreaseMoney(
                                          int.parse(product.rate));
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 35,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 0,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await Provider.of<CartModel>(context,
                                                  listen: false)
                                              .update(
                                                  image: product.imageUrl,
                                                  quantity: product.quantity,
                                                  description:
                                                      product.description,
                                                  productName:
                                                      product.productName,
                                                  rate: product.rate,
                                                  index: position);
                                        },
                                        icon: CircleAvatar(
                                          backgroundColor: Colors.black54,
                                          child: Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          await Provider.of<CartModel>(context,
                                                  listen: false)
                                              .updateDecrease(
                                                  image: product.imageUrl,
                                                  quantity: product.quantity,
                                                  description:
                                                      product.description,
                                                  productName:
                                                      product.productName,
                                                  rate: product.rate,
                                                  index: position);
                                        },
                                        icon: CircleAvatar(
                                          backgroundColor: Colors.black54,
                                          child: Icon(
                                            Icons.remove,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]));
                        },
                        itemCount: cart.carts.length,
                      ),
                    ),
                  )
                : Container();
          },
        ),
        Consumer<CartModel>(builder: (context, cart, child) {
          return Visibility(
            visible: cart.carts.length == 0 ? false : true,
            child: InkWell(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                        'Are you sure you want to Confirm Order for Rs. ${cart.showMoneys().toString()}'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, "orderPage"),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('NO',
                            style: TextStyle(fontSize: 18, color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                child: Text(
                  "Confirm Order Rs."
                  " ${cart.showMoneys().toString()}"
                  "",
                  style: TextStyle(color: Colors.yellow, fontSize: 20),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
