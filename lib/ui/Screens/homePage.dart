import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nayakoseli/StateManagementModel/LogInModel.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/commonwidgets/gridView.dart';

import 'package:nayakoseli/model/categories.dart';
import 'package:nayakoseli/model/productTypes.dart';
import 'package:nayakoseli/ui/Screens/productDetails%20Screen.dart';
import 'package:nayakoseli/ui/Screens/productScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  var newgfgList = [sports, accessories, clothes].expand((x) => x).toList();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<LogInModel>(builder: (context, cart, child) {
        return Column(children: [
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: cart.showTextField,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  Provider.of<LogInModel>(context, listen: false).onTapSearch();
                },
              )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SEARCH BY CATEGORIES",
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // IconButton(onPressed: (){}, icon: Icon(Icons.search))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    Categories category = categories[position];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                      categories: category,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        margin: EdgeInsets.all(10),
                        width: 210,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2.6),
                                        blurRadius: 6,
                                      ),
                                    ]),
                                child: Hero(
                                  tag: category.imageUrl,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(category.imageUrl),
                                      height: 170,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 05),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2.6),
                                      blurRadius: 6,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                width: 200,
                                child: Text(
                                  category.category,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: categories.length,
                ),
              ),
              Grids(
                title: "All products",
                category: newgfgList,
              ),
              Text(
                "BestSeller",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: CarouselSlider.builder(
                  itemBuilder:
                      (BuildContext context, position, int pageViewIndex) {
                    Products product = bestSeller[position];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(products: product)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("${product.imageUrl}"),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  itemCount: bestSeller.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      cart.onPageChanged(index);

                    },
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                ),
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    for (int i = 0; i < bestSeller.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.white,
                          ),

                          Visibility(
                            visible: cart.isSellerSelected[i],
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ]),
                      )
                  ])),
              SizedBox(
                height: 20,
              )
            ],
          )
        ]);
      }),
    );
  }
}
