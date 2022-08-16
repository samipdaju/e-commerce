import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nayakoseli/commonwidgets/bottomBar&appBar.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/ui/Screens/aboutUsPage.dart';
import 'package:nayakoseli/ui/Screens/homePage.dart';
import 'package:nayakoseli/ui/Screens/profilePage.dart';
import 'package:nayakoseli/ui/Screens/refresh.dart';
import 'package:nayakoseli/ui/Screens/searchPage.dart';
import 'package:nayakoseli/ui/Screens/trackOrder.dart';
import 'package:provider/provider.dart';

import 'cartPage.dart';

class Dashboard extends StatelessWidget {

  Future onRefresh()async{

  return null;
  }

  List screens = [
    HomePage(),
    CartPage(),
    ProfilePage(),
    TrackOrder(),
    AboutUs(),
  ];

  List appTitle = ["HomePage", "Your Cart", "Profile", "About US"];


  @override
  Widget build(BuildContext context) {
    
    return Consumer<CartModel>(builder: (context, cart, child) {
      return Scaffold(

        drawer: SafeArea(
          child: Drawer(
            elevation: 10,

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme
                          .of(context)
                          .scaffoldBackgroundColor,
                      Colors.white,
                      Theme
                          .of(context)
                          .scaffoldBackgroundColor
                    ]),
              ),

              child: ListView(



                children: <Widget>[
                  Container(
                    height: 80,
                    child: DrawerHeader(

                      decoration: BoxDecoration(


                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme
                                    .of(context)
                                    .scaffoldBackgroundColor,
                                Colors.white,

                              ]),
                        ),

                      child: ListTile(
                        title: Text('Naya Koseli',style: TextStyle(
                          fontSize: 26
                        ),),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings",style: TextStyle(
                      fontSize: 20
                    ),),
                    onTap: () {
                      cart.changeIndex(3);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text("Search Products",style: TextStyle(
                        fontSize: 20
                    ),),
                    onTap: () {
                      Navigator.pop(context);
                      showSearch(context: context, delegate: SearchPage());

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.facebook),
                    title: Text("Visit Naya Koseli on Facebook",style: TextStyle(
                        fontSize: 20
                    ),),
                    onTap: () async {
                      await customLaunch("fb://page/114426203732040");

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Visit Our Store",style: TextStyle(
                        fontSize: 20
                    ),),
                    onTap: () async {
                      await customLaunch("https://www.google.com/maps/search/?api=1&query=0.0017690,0.0004410");

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.perm_device_information),
                    title: Text("About Us",style: TextStyle(
                        fontSize: 20
                    ),),
                    onTap: () {
                      cart.changeIndex(3);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text("Carts",style: TextStyle(
                        fontSize: 20
                    ),),
                    onTap: () {
                      cart.changeIndex(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile",style: TextStyle(
                        fontSize: 20
                    ),),
                    onTap: () {
                      cart.changeIndex(2);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        appBar: AppBar(
          title: appBars[
          Provider
              .of<CartModel>(context, listen: false)
              .currentIndex],
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          centerTitle: true,


          ),


        body: RefreshIndicator(
          onRefresh: onRefresh,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    Colors.white,
                    Theme
                        .of(context)
                        .scaffoldBackgroundColor
                  ]),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: screens[
                Provider
                    .of<CartModel>(context, listen: false)
                    .currentIndex],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNav(),
      );
    });
  }

}
