import 'package:flutter/material.dart';
import 'package:nayakoseli/StateManagementModel/LogInModel.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/ui/Screens/dashboard.dart';
import 'package:nayakoseli/ui/login/login.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashPage extends StatelessWidget {


  @override
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
        navigateRoute: Provider.of<CartModel>(context,listen:false).showContainer==false?Dashboard():LogInPage(),
        duration: 3000,
        imageSize: 300,
        imageSrc: "assets/nk.PNG",
        text: "जे देखीन्छ तेइ पाईन्छ ..",

        textType: TextType.NormalText,

        pageRouteTransition: PageRouteTransition.Normal,
        textStyle: TextStyle(

          fontWeight: FontWeight.w600,
          color: Color(0xff0672BA),
          fontSize: 35.0,
        ),
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor
    );
  }
}