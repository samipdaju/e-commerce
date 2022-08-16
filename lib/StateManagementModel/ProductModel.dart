import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:nayakoseli/model/productTypes.dart';
import 'package:nayakoseli/model/trackordermodel.dart';

import '../model/database.dart';

class CartModel extends ChangeNotifier {
  List<Products> carts = [];
  bool showContainer = false;

  int totalSum = 0;
  int currentIndex = 0;




  getProducts() async {
    carts = await Databaseclass().getProduct();
    notifyListeners();
    if (carts != null) {
      return carts;
    }
    return null;
  }

  showMoney() {
    totalSum = 0;
    for (int i = 0; i < carts.length; i++) {
      int quantity = carts[i].quantity;
      totalSum += (int.parse(carts[i].rate) * quantity);
    }
    return totalSum;
  }

  showMoneys() {
    totalSum = showMoney();
    return totalSum;
  }

  decreaseMoney(int rate) {
    totalSum -= rate;
    notifyListeners();
  }

  onCartIndex() {
    getProducts();
    notifyListeners();
  }

  changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  addProductsInCart({id, image, name, rate, description, quantity}) async {
    Products products = Products(
        id: id,
        imageUrl: image,
        description: description,
        productName: name,
        rate: rate,
        quantity: quantity);

    Fluttertoast.showToast(
        msg: " ${name} Added to Cart ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,

        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );

    await Databaseclass().insert(products);
    await getProducts();


    notifyListeners();
  }

  deleteProductsInCart(index) async {
    await Databaseclass().delete(carts[index].id);
    await getProducts();

    notifyListeners();
  }

  update(
      {required image,
      required rate,
      required description,
      required productName,
      required quantity,
        required index}) async {
    Products products = Products(
        imageUrl: image,
        description: description,
        productName: productName,
        rate: rate,
        quantity: quantity);

    await Databaseclass().update(products, carts[index].id);
    await getProducts();
    notifyListeners();
  }

  updateDecrease(
      {required image,
      required rate,
      required description,
      required productName,
      required quantity,
      required index}) async {
    Products products = Products(
        imageUrl: image,
        description: description,
        productName: productName,
        rate: rate,
        quantity: quantity);

    await Databaseclass().updateDecrease(products, carts[index].id);
    await getProducts();
    notifyListeners();
  }

  void orderAdd( {required visible,required orderId,required name,required isPlaced,required isShipped,required isPicked,required isDelivered}){
    TrackOrderModel order = TrackOrderModel(visible: visible,
        orderId: orderId, name: name, isShipped: isShipped, isPlaced: isPlaced, isDelivered: isDelivered, isPicked: isPicked);
    orderedList.add(order);
    notifyListeners();
  }



}
