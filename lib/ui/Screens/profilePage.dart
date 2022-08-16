import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nayakoseli/StateManagementModel/ProductModel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

 late File _image ;

 bool load = true;

final picker = ImagePicker();

 Future getImage() async {
   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

   if (pickedFile != null) {
     setState(() {
       _image = File(pickedFile.path);
       load = false;
     });
   }
 }
   Future getCamera() async {
     final pickedFile = await picker.pickImage(source: ImageSource.camera);

     if (pickedFile != null) {
       setState(() {
         _image = File(pickedFile.path);
         load = false;
       });
     }
   }

     @override
     void initState() {
       // TODO: implement initState
       super.initState();
     }
     @override
     Widget build(BuildContext context) {
       return Container(
         child: Center(

           child:Consumer<CartModel>(builder: (context, cart, child) {
             return ListView(

               children: [
                 SizedBox(height: 30,),
                 Stack(
                   children: [
                     InkWell(
                         onTap: getImage,
                         child: Container(
                           alignment: Alignment.center,
                           child: CircleAvatar(

                             backgroundImage: AssetImage("assets/john.jpg"),
                             radius: 100,
                           ),
                         )

                       // Container(
                       //   height: 200,
                       //   width: MediaQuery.of(context).size.width-30,
                       //   child: load == false?
                       //        Image.file(_image)
                       //       :Image.asset('assets/john.jpg') ,
                       // ),
                     ),


                     Positioned(
                       bottom: 0,
                       left: 130,
                       child: Row(
                         children: [
                           IconButton(onPressed: getImage, icon: Icon(
                               Icons.photo),
                             color: Colors.purple,),
                           IconButton(onPressed: getCamera, icon: Icon(
                               Icons.camera),
                             color: Colors.purple,)
                         ],
                       ),
                     )
                   ],
                 ),
                 SizedBox(height: 30,),
                 Text("Samip Paudel",
                   textAlign: TextAlign.center, style: TextStyle(
                     fontSize: 30,
                   ),),
                 SizedBox(height: 30,),
                 ListTile(
                   onTap: (){
                     cart.changeIndex(3);
                   },
                   leading: Icon(Icons.store,
                     size: 30,
                     color: Colors.black,),


                   title: Text("My Orders",
                     style: TextStyle(
                         fontSize: 20
                     ),),
                 ),
                 ListTile(
                   onTap: (){

                   },
                   leading: Icon(Icons.card_giftcard,
                     size: 30,
                     color: Colors.black,),


                   title: Text("My Payments",
                     style: TextStyle(
                         fontSize: 20
                     ),),
                 ),
                 ListTile(
                   onTap: () {

                     cart.changeIndex(1);
                   },
                   leading: Icon(Icons.shopping_cart,
                     size: 30,
                     color: Colors.black,),


                   title: Text("My Cart",
                     style: TextStyle(
                         fontSize: 20
                     ),),
                 ),


                 SizedBox(height: 40,),
                 Column(

                   children: [
                     TextButton(
                       onPressed: () {
                         showDialog<String>(
                           context: context,
                           builder: (BuildContext context) =>
                               AlertDialog(
                                 title: const Text(
                                     'Are you sure you want to log out?'),

                                 actions: <Widget>[
                                   TextButton(
                                     onPressed: () =>
                                         Navigator.pushReplacementNamed(
                                             context, "logIn"),
                                     child: const Text('YES', style: TextStyle(
                                         fontSize: 18
                                     ),),
                                   ),
                                   TextButton(
                                     onPressed: () =>
                                         Navigator.pop(context, 'OK'),
                                     child: const Text('NO', style: TextStyle(
                                         fontSize: 18
                                     )),
                                   ),
                                 ],
                               ),
                         );
                       },
                       child: Container(
                         width: double.infinity,
                         decoration: BoxDecoration(color: Colors.white,
                           borderRadius: BorderRadius.circular(30),

                         ),
                         margin: EdgeInsets.all(15),
                         padding: EdgeInsets.symmetric(
                             horizontal: 10, vertical: 10),
                         child: Center(
                           child: Text("Log Out ", style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.w600,
                               color: Colors.brown
                           ),),
                         ),


                       ),
                     ),
                   ],
                 )

               ],
             );
           }
               
           ),
         ),
       );
     }
   }


