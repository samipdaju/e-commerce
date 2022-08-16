import 'package:flutter/material.dart';
import 'package:nayakoseli/StateManagementModel/LogInModel.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/StateManagementModel/searchModel.dart';
import 'package:nayakoseli/model/database.dart';
import 'package:nayakoseli/ui/Screens/dashboard.dart';
import 'package:nayakoseli/ui/Screens/orderPage.dart';
import 'package:nayakoseli/ui/Screens/searchPage.dart';
import 'package:nayakoseli/ui/Screens/splashScreen.dart';

import 'package:nayakoseli/ui/login/login.dart';
import 'package:nayakoseli/ui/login/signup.dart';
import 'package:provider/provider.dart';


void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Databaseclass().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MultiProvider(
      providers: [

        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
        ChangeNotifierProvider<LogInModel>(create: (_) => LogInModel()),
        ChangeNotifierProvider<SearchModel>(create: (_) => SearchModel()),



      ],child:

      MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor:  Color(0xffFCDC94),
                primaryIconTheme: IconThemeData(color: Colors.black),



              primarySwatch: Colors.blue,

            ),
            debugShowCheckedModeBanner: false,
        home: Dashboard(),
            routes: {
              "logIn": (context) => LogInPage(),
              "signup": (context) => SignUpPage(),
              "home": (context) => Dashboard(),
              "orderPage": (context) => OrderPage(),

              // "search": (context) => SearchPage(),

            },


    ),
    );

  }

}



