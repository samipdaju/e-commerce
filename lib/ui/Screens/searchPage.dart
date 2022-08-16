

import 'package:flutter/material.dart';
import 'package:nayakoseli/model/categories.dart';
import 'package:nayakoseli/ui/Screens/productDetails%20Screen.dart';

class SearchPage extends SearchDelegate {
  List history=[];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.close),
    onPressed: (){
      query = "";
    },),];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.arrow_back),
      onPressed: (){
      close(context, null);
      },);
  }

  @override
  buildResults(BuildContext context) {
   throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List newgfgList = [sports, accessories, clothes].expand((x) => x).toList();
   
    newgfgList.sort((m1, m2) {
      var r = m1.productName.compareTo(m2.productName);
      if (r != 0) return r;
      return m1.productName.compareTo (m1.productName);
    });



    final myList = query.isEmpty?newgfgList:
    newgfgList.where((element) => element.productName.toString().toLowerCase().contains(query)).toList();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.white,
            Theme.of(context).scaffoldBackgroundColor,

          ]
        )
      ),

      child: myList.isNotEmpty? ListView.builder(itemBuilder: (context, position) {

        final product = myList[position];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
          child: Card(
            elevation: 4,


            child: ListTile(
              onTap: (){

                print(newgfgList);
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen(products: product)));
              },
              title: Text( product.productName,
              style: TextStyle(
                fontSize: 22,

              ),
              ),
              leading: Image(
                image: AssetImage(
                  product.imageUrl,

                ),

              ),
              subtitle: Text(
                  "Rs. ${product.rate}"
              ),

            )
          ),


        );
      },
      itemCount:myList.length ):Center(
        child: Text("Oops... Can't found $query \n Search with a different name",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,),

      )
    );
  }
}
