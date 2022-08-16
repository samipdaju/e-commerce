import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nayakoseli/model/productTypes.dart';
import 'package:nayakoseli/model/trackordermodel.dart';
import 'package:nayakoseli/model/trackordericonmodel.dart';

class Categories with ChangeNotifier{

  String category;
  String imageUrl;
  List<Products> productTypes;

  Categories({required this.imageUrl,required this.category,required this.productTypes});

}

List<Products> clothes =[

  Products(
    rate: "6000",

      imageUrl: "assets/Jacket.jpg",
      description: "Hottest outer in town",
      productName: "Jacket "),
  Products(
      rate: "6000",
      imageUrl: "assets/womens.jpg",
      description: "Hottest top in town",
      productName: "Top"),
  Products(
      rate: "6000",
      imageUrl: "assets/kids.jpg",
      description: "Cutest t-shirt",
      productName: "T-shirt(kids)"),
  Products(
      rate: "6000",
      imageUrl: "assets/Hoodie.jpg",
      description: "Warm Hoodie",
      productName: "Hoodie"),
  Products(
      rate: "6000",
      imageUrl: "assets/Ladies Jacket.jpg",
      description: "Warmest jackets",
      productName: "Jacket(Ladies)"),
  Products(
      rate: "6000",
      imageUrl: "assets/Top.jpg",
      description: " T-shirt",
      productName: "T-shirt"),




];

List<Products> accessories =[

  Products(
      rate: "6200",
      imageUrl: "assets/makeup kit.jpeg",
      description: "Don't miss a chance to enhance your beauty to the outer world",
      productName: "Makeup Kit"),
  Products(
      rate: "6000",
      imageUrl: "assets/bag.jpeg",
      description: "",
      productName: "Bag"),
  Products(
      rate: "6000",
      imageUrl: "assets/Goggles.jpg",
      description: "",
      productName: "Goggles"),


];
List<Products> sports =[

  Products(
      rate: "10000",
      imageUrl: "assets/graynicholls.jpg",
      description: "Best GrayNicholls Bat made from English Willow",
      productName: "Cricket Bat (Gray Nichols)"),
  Products(
      rate: "500",
      imageUrl: "assets/mryoud.jpg",
      description: "MR.Youd",
      productName: "Football"),
  Products(
      rate: "6000",
      imageUrl: "assets/boot.jpg",
      description: "Smooth looking and strong boot",
      productName: "Football Boot"),

];
List<Products> bestSeller =[

  Products(
      rate: "30000",
      imageUrl: "assets/AirPod Pro.jpg",
      description: "Latest Apple Air Pod Pro having nice sound quality",
      productName: "Apple AirPod Pro"),
  Products(
      rate: "2000",
      imageUrl: "assets/Goggles.jpg",
      description: "Don't miss a chance to look cool with these shades",
      productName: "Goggles"),
  Products(
      rate: "20000",
      imageUrl: "assets/AirPod.jpg",
      description: "Latest Apple Air Pod having nice sound quality",
      productName: "Apple AirPod"),





];

List<Categories> categories=[
  Categories(
      imageUrl: "assets/banner.jpeg",
      category: "Clothes",
      productTypes: clothes),
  Categories(
      imageUrl: "assets/sports.jpg",
      category: "Sports",
      productTypes: sports),
  Categories(
      imageUrl: "assets/accessories.jpg",
      category: "Accessories",
      productTypes: accessories)
];

