
import 'package:flutter/material.dart';
import 'package:minafarma/service/model/UserModel.dart';
import 'package:minafarma/service/utils/CardBox.dart';

import 'package:minafarma/service/utils/Validation.dart';
import 'package:minafarma/service/utils/styles/colors.dart';
import 'package:minafarma/ui/home/HomePage.dart';
import 'package:provider/provider.dart';

import '../../service/core/cache/UserCache.dart';
import 'RegisterModel.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {

  var formkey=GlobalKey<FormState>();
  var validation = Validation();
  TextEditingController nameController     = new TextEditingController();
  TextEditingController emailController    = new TextEditingController();
  TextEditingController phoneController    = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
        create: (context) => RegisterModel(),
        child: Consumer<RegisterModel>(builder: (context, model, __) {

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text("Register")
                  ,backgroundColor: AppColors.yellow),
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: 100),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: CardBox(
                        AppColors.primaryBackground,
                        10,
                        Form(
                            key: formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Your name';
                                    }

                                    return null;
                                  },
                                  controller: nameController,
                                  decoration: new InputDecoration(
                                    hintText: 'Name',
                                    prefixIcon: Icon(Icons.account_circle_sharp),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Your email';
                                    }
                                    if (!validation.isEmail(value)) {
                                      return "invalid email";
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  decoration: new InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Your Mobile';
                                    }
                                    // if (!validation.validateStructure(value)) {
                                    //   return "invalid Mobile";
                                    // }
                                    return null;
                                  },
                                  controller: phoneController,
                                  decoration: new InputDecoration(
                                    hintText: 'Mobile',
                                    prefixIcon: Icon(Icons.phone_android),
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  obscureText: true,
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter Your password';
                                    }

                                    return null;
                                  },
                                  controller: passwordController,
                                  decoration: new InputDecoration(
                                    hintText: 'password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 55,
                                  margin: EdgeInsets.only(right: 10, left: 10, top: 20),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    onPressed: () async {
                                      // Validate returns true if the form is valid, otherwise false.
                                      if (formkey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.


                                    // UserModel model =UserModel(email: emailController.text,password: passwordController.text);
                                     Map<String, dynamic> user =
                                     {'email':emailController.text,'password':passwordController.text};
                                     UserCache.instance.setUser(UserModel.fromJson(user));
                                     Navigator.pushReplacement(
                                         context,
                                         MaterialPageRoute(builder: (context) => HomePage()));

                                      }
                                    },
                                    child: Text('Sign Up'),
                                    color: AppColors.yellow,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );

        }));
  }
}

