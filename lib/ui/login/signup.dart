import 'package:flutter/material.dart';
import 'package:nayakoseli/StateManagementModel/LogInModel.dart';
import 'package:nayakoseli/commonwidgets/textfields.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {

  final _form = GlobalKey<FormState>();


  String ?name;
 bool passwordShow = true;
  late String password;
bool confirmPasswordShow = true;
  late String confirmPassword;
  @override
  Widget build(BuildContext context) {

    _saveForm() {
      final isValid = _form.currentState!.validate();
      if (isValid) {
        Navigator.pushReplacementNamed(context, "logIn");

      }
    }
    return  Consumer<LogInModel>(builder: (context,signUp,child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Register",
            style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "logIn");
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
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

            child: Center(
              child: Form(
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      TextFields(
                        onValidate: (text) {
                          if (text!.length > 3 && text.isNotEmpty) {
                            return null;
                          } else {
                            return "Please Enter a valid Name with at least 4 letters";
                          }
                        },
                        inputType: TextInputType.text,
                        heading: "Name",
                        label: "Enter Your Name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.orange,
                        ),
                        obscure: false,
                        onChange: (value) {},
                      ),
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
                        prefixIcon: Icon(Icons.email, color: Colors.orange,),
                        obscure: false,
                        onChange: (value) {},
                      ),
                      TextFields(
                        onValidate: (text) {
                          if (text!.length == 10 && text.isNotEmpty) {
                            return null;
                          } else {
                            return "Please Enter valid phone number";
                          }
                        },
                        inputType: TextInputType.number,
                        heading: "Phone",
                        label: "Enter Your number",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.orange,
                        ),
                        obscure: false,
                        onChange: (value) {},
                      ),
                      PasswordField(
                        onValidate: (text) {
                          if ((text!.length > 5)) {
                            return null;
                          }
                          else {
                            return "Enter password with 6 or more characters";
                          }
                        },

                        heading: "Password",
                        label: "Enter password",
                        suffixIcon:
                        GestureDetector(

                          onTap: () {
                            signUp.onTapSignUpPassword();

                          },


                          child: Icon(
                           signUp.showPasswordSignUp == true ? Icons.visibility : Icons
                                .visibility_off,
                            color: Colors.orange,
                          ),
                        ),


                        obscure: signUp.showPasswordSignUp,
                        onChange: (value) {
                          password = value;
                        },
                      ),

                      PasswordField(

                        onValidate: (text) {
                          if ((text!.length > 5) && text.isNotEmpty &&
                              text == password) {
                            return null;
                          }
                          else {
                            return "Match a valid password";
                          }
                        },

                        heading: "Confirm Password",
                        label: "Enter password again",
                        suffixIcon:
                        GestureDetector(

                          onTap: () {
                            signUp.onTapConfirmPassword();
                          },


                          child: Icon(
                            signUp.showConfirmPassword == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.orange,
                          ),
                        ),


                        obscure: signUp.showConfirmPassword,
                        onChange: (value) {

                        },
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 30, 16, 15),
                        child: Row(
                          children: [
                            Text("Already have an account?",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black
                                  // color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "logIn");
                              },
                              child: Text(
                                "Log In ",
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
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),

                    ],
                  ),
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
