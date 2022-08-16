import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nayakoseli/model/categories.dart';

class LogInModel extends ChangeNotifier{

  bool showPassword = true;
  bool showConfirmPassword = true;
  bool showPasswordSignUp = true;
  bool showTextField = false;
  int current = 0;
  List isSellerSelected = [true, false, false];

  onTapPassword(){
    showPassword = !showPassword;
    notifyListeners();
  }
  onTapSignUpPassword(){
    showPasswordSignUp = !showPasswordSignUp;
    notifyListeners();
  }

  onTapConfirmPassword(){
    showConfirmPassword = ! showConfirmPassword;
    notifyListeners();
  }

  onTapSearch(){
    showTextField = !showTextField;
    notifyListeners();
  }

  onPageChanged(index){
    current = index;
   for (int i=0;i<bestSeller.length;i++){
     if (index==i){
       isSellerSelected[i]= true;
     }
     else{
       isSellerSelected[i]= false;
     }
   }
    notifyListeners();
  }


}