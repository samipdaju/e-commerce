import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  String label;
  String heading;
  Function(String)? onChange;
  bool obscure;
  Icon prefixIcon;
  TextInputType inputType;
  String? Function(String?)? onValidate;

  TextFields({required this.heading,required this.inputType,required this.label,this.onChange,required this.obscure,required this.prefixIcon,required this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16,vertical: 10),
          child: Text(
            heading,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // color: Colors.white
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            validator: onValidate,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18
            ),
            keyboardType: inputType,
            obscureText: obscure ,
            onChanged: onChange,
            decoration: InputDecoration(
              labelText: label,
              labelStyle:TextStyle(fontSize: 18,


              ),

              prefixIcon: prefixIcon,
              border: OutlineInputBorder(),
            ),

          ),

        ),

      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  String label;
  String heading;
  Function(String)? onChange;
  String? Function(String?)? onValidate;
  bool obscure;
  Widget suffixIcon;


  PasswordField({required this.heading,required this.label,this.onChange,required this.obscure,required this.suffixIcon,required this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16,vertical: 10),
          child: Text(
            heading,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // color: Colors.white
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            validator: onValidate,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18
            ),
            obscureText: obscure ,



            onChanged: onChange,
            decoration: InputDecoration(
              labelText: label,
              labelStyle:TextStyle(fontSize: 18,


              ),

              suffixIcon: suffixIcon,
              prefixIcon: Icon(
    Icons.vpn_key,
    color: Colors.orange,
    ),
              border: OutlineInputBorder(),
            ),

          ),

        ),

      ],
    );
  }
}