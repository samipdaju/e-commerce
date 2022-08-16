import 'package:flutter/material.dart';
import 'package:nayakoseli/StateManagementModel/LogInModel.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/ui/Screens/searchPage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

List appBars = [
  Consumer<LogInModel>(builder: (context, cart, child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HomePage",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {
           ;
            },
            icon: Icon(Icons.search))
      ],
    );
  }),
  Consumer<CartModel>(builder: (context, cart, child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Cart  ",
                style: TextStyle(color: Colors.black),
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Text(
          cart.carts.length != 0
              ? "${Provider.of<CartModel>(context, listen: false).carts.length.toString()} Items"
              : "",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Profile",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            ("assets/john.jpg"),
          ))
    ],
  ),
  Text(
    "My Orders",
    style: TextStyle(color: Colors.black),
  ),
  Text(
    "About Us",
    style: TextStyle(color: Colors.black),
  )
];

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      selectedIconTheme:
          Theme.of(context).iconTheme.copyWith(size: 30, color: Colors.blue),
      iconSize: 30,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      onTap: (index) {
        Provider.of<CartModel>(context, listen: false).changeIndex(index);

        Provider.of<CartModel>(context, listen: false).onCartIndex();
      },
      currentIndex: Provider.of<CartModel>(context, listen: false).currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Your Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.border_outer),
          label: "My Orders",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: "About Us",
        ),

      ],
    );
  }
}

Future<void> customLaunch(command) async {
  if (await canLaunch(command)) {
    print("launched $command");
    await launch(command);
  } else {
    print(' could not launch $command');
  }
}
