import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nayakoseli/commonwidgets/bottomBar&appBar.dart';
class AboutUs extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Image(image: AssetImage("assets/nk.PNG"),
          height: 250,),
        Row(

          children: <Widget>[
            const SizedBox(width:12,height: 100.0),
            const Text(
              'We are Here',
              style: TextStyle(fontSize: 30.0),
            ),
            const SizedBox(width: 10.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.black
              ),
              child: AnimatedTextKit(
                  repeatForever: true,


                  animatedTexts: [
                    RotateAnimatedText('For You🛒'),
                    RotateAnimatedText('With You👜'),
                    RotateAnimatedText('By You❤'),
                  ]

              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              flex: 4,

              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      customLaunch("tel: +977 9854432532");
                    },
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.phone,
                          size: 25,),
                          onPressed: (){

                          },),
                        Text("9854432532",style: TextStyle(


                            fontSize: 25
                        ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      customLaunch("mailto:info@nayakoseli.com");
                    },
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.mail,
                          size: 25,),
                          onPressed: (){

                          },),
                        Text("info@nayakoseli.com",style: TextStyle(

color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 22
                        ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: ()async{

                      await customLaunch("fb://page/112140930586653");
                    },
                    child: Row(
                      children: [
                         IconButton(icon: Icon(Icons.facebook,
                         size: 25,),
                            onPressed: (){

                            },),
                           Text("Naya Koseli",style: TextStyle(


                              fontSize: 25
                          ),
                          ),
                      ],
                    ),
                  )

                ],
              ),
            ),

            
            Container(
              alignment: Alignment.center,
    padding: EdgeInsets.only(right:5),
    child: Image(
      height: 140,
    image: AssetImage("assets/ques.png"),
    fit: BoxFit.cover
    ),

              height: 140,
              width: 100,

              ),

            
          ],
        ),


      ],
    );
  }
}
