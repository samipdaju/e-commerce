import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nayakoseli/StateManagementModel/LogInModel.dart';
import 'package:nayakoseli/commonwidgets/textfields.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:http/http.dart'as http;

class LogInPage extends StatelessWidget {

  final _form = GlobalKey<FormState>();

//
// signInWithFacebook()async{
// final auth = FirebaseAuth.instance;
//   final facebookSignIn = FacebookLogin();
//   final result = await facebookSignIn.logIn();
//   final token = result.accessToken!.token;
//   final url = Uri.parse( 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
//   final graphResponse = await http.get(url);
//   final profile = jsonDecode(graphResponse.body);
//
//   if (result.status == FacebookLoginStatus.success){
//     final credential = FacebookAuthProvider.credential(token);
//     auth.signInWithCredential(credential);
//
//   }
// }
  static final FacebookLogin facebookSignIn = new FacebookLogin();



  @override
  Widget build(BuildContext context) {
    login() async {
      final FacebookLoginResult result =
      await facebookSignIn.logIn(customPermissions: ['email']);

      switch (result.status) {
        case FacebookLoginStatus.success:
          final FacebookAccessToken? accessToken = result.accessToken;
          print('''
         Logged in!
         
         Token: ${accessToken!.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
          await Navigator.pushReplacementNamed(context, "home");

          break;
        case FacebookLoginStatus.cancel:
          print('Login cancelled by the user.');
          break;
        case FacebookLoginStatus.error:
          print('Something went wrong with the login process.\n'
              'Here\'s the error Facebook gave us: ${result.error}');
          break;
      }
    }

    _saveForm() {
      final isValid = _form.currentState!.validate();
      if (isValid) {
        Navigator.pushReplacementNamed(context, "home");
      }
    }

    return Consumer<LogInModel>(builder: (context,logIn,child){
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme
                      .of(context)
                      .scaffoldBackgroundColor,
                  Colors.white,
                  Theme
                      .of(context)
                      .scaffoldBackgroundColor
                ]),
          ),
          child: SafeArea(
            child: Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/nk.PNG"),
                      height: 140,
                    ),
                    Text("Sign In",
                        style: TextStyle(
                          // color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                    TextFields(
                      onValidate: (text) {
                        if (text!.contains('@') && text.length > 10 &&
                            text.contains('.com')) {
                          return null;
                        } else {
                          return "Please Enter a valid E-mail Address";
                        }
                      },
                      inputType: TextInputType.text,
                      heading: "Email",
                      label: "Enter email",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.orange,
                      ),
                      obscure: false,
                      onChange: (value) {

                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PasswordField(
                      onValidate: (text) {
                        if ((text!.length > 5) && text.isNotEmpty) {
                          return null;
                        } else {
                          return "Enter password with 6 or more characters";
                        }
                      },
                      heading: "Password",
                      label: "Enter password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                         logIn.onTapPassword();
                        },
                        child: Icon(
                          logIn.showPassword==true?
                          Icons.visibility:Icons.visibility_off,
                          color: Colors.orange,
                        ),
                      ),
                      obscure: logIn.showPassword,
                      onChange: (value) {

                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 30),
                      child: Row(
                        children: [
                          Text("Don't have an account yet?",
                              style: TextStyle(fontSize: 20, color: Colors.black
                                // color: Colors.white,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "signup");
                            },
                            child: Text(
                              "Sign up ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _saveForm();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.brown,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Or Log In with",
                            style: TextStyle(color: Colors.brown, fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.brown,
                          ),
                        ),
                      ]),
                    ),
                    SignInButton(
                      Buttons.Facebook,
                      text: "Sign in with Facebook",
                      onPressed: ()async {
                       // await  signInWithFacebook();
                        await login();
                      },
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    );
  }
}
