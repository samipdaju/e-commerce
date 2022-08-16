import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nayakoseli/model/categories.dart';
import 'package:nayakoseli/model/productTypes.dart';
import 'package:nayakoseli/ui/Screens/productDetails%20Screen.dart';

class ProductScreen extends StatelessWidget {
  final Categories categories;
  ProductScreen({required this.categories});


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
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
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
                  tag: categories.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(categories.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                        color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                            color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.search,
                            color: Theme.of(context).scaffoldBackgroundColor
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
               left: 10,
                bottom: 20,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Text(
                    categories.category,
                    textAlign: TextAlign.center,

                    style: TextStyle(

                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).scaffoldBackgroundColor
                    ),
                  ),
                ),
              ),
            ]),

            Expanded(
              child: ListView.builder(

                itemBuilder: (context,position){
                 Products productType= categories.productTypes[position];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen(products: productType)));
                  },
                  child: Stack(

                    children: [
                      Container(

                        padding:EdgeInsets.fromLTRB(140, 5, 10, 5),
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 180,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            Container(

                              child: Text(productType.productName,style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Text("Rs: ${productType.rate}",style: TextStyle(

                              fontSize: 20,

                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Buy Now",style: TextStyle(
                                  color: Colors.blue
                                ),),
                                Icon(Icons.shopping_cart,color: Colors.blue,)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom:10,
                        left:20,
                        child: Hero(
                          tag:   productType.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20)
                            ,child: Image(image: AssetImage(

                              productType.imageUrl,

                            ),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: categories.productTypes.length,),
            ),


          ],
        ),
      ),
    );
  }
}
