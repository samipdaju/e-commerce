import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        title: Text("Confirm Order",
        style: TextStyle(color:Colors.black,),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(


            children: [
              Text("Your Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25
              ),),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Your Name"),
                onChanged: (value){

                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Your Phone Number"),
              ),
              SizedBox(
                height: 25,
              ),
              Text("Address",style: TextStyle(

                fontSize: 25
              ),
                textAlign: TextAlign.center,),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Province"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: "City"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Area"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
