import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:nayakoseli/model/categories.dart';
import 'package:nayakoseli/model/productTypes.dart';
import 'package:nayakoseli/ui/Screens/productDetails%20Screen.dart';
import 'package:provider/provider.dart';

class Grids extends StatelessWidget {
  late final String title;
  late  var category;
  Grids({required this.title,required this.category});

  @override
  Widget build(BuildContext context) {
    return  Consumer<CartModel>(builder: (context, cart, child) {
      return Column(children: [
        Text(
          "$title",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
          width: MediaQuery
              .of(context)
              .size
              .width - 20,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 270,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, position) {
              Products product = category[position];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(products: product)));
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (Column(
                      children: [
                        Hero(
                          tag: product.imageUrl,
                          child: Image(
                            image: AssetImage(
                              "${product.imageUrl}",
                            ),
                            height: 150,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(product.productName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("Rs. ${product.rate}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,),
                            ),
                            IconButton(onPressed: () async {
                              await cart.addProductsInCart(

                                  id: cart.carts.length,
                                  image: product.imageUrl,
                                  rate: product.rate,
                                  name: product.productName,
                                  description: product.description,
                                  quantity: 1

                              );
                            }, icon:
                            Icon(Icons.shopping_cart),
                              color: Colors.lightBlueAccent,
                              iconSize: 25,)
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              );
            },
            itemCount: category.length,
          ),
        ),
      ]
      );
    }
    );
  }
}
