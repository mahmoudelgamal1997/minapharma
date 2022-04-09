

import 'package:flutter/material.dart';
import 'package:minafarma/service/core/cache/UserCache.dart';
import 'package:minafarma/service/utils/CardBox.dart';
import 'package:minafarma/service/utils/Validation.dart';
import 'package:minafarma/service/utils/styles/colors.dart';
import 'package:minafarma/ui/home/HomePage.dart';
import 'package:provider/provider.dart';

import 'LoginModel.dart';
import 'Register.dart';


class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {

  var formkey=GlobalKey<FormState>();
  var validation = Validation();

  TextEditingController emailController    = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController errorMessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
        create: (context) => LoginModel(),
        child: Consumer<LoginModel>(builder: (context, model, __) {
           errorMessageController.text = "";
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.yellow,
                title:Text("Mina pharma"),
              ),
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                     children: [
                      Container(
                        padding: EdgeInsets.only(top: 100),
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
                                        return 'Please enter Your email';
                                      }
                                      if (!validation.isEmail(value)) {
                                        return "invalid email";
                                      }
                                      if (UserCache.instance.getUser()==null){
                                        return 'user not found';
                                      }else if (value!=UserCache.instance.getUser()!.email){
                                        return 'user not found';
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
                                      alignment: Alignment.topLeft,
                                      child: Text(errorMessageController.text,style: TextStyle(color: AppColors.primary1),)),
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



                                           //Login successfull
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => HomePage()),
                                          );
                                        }
                                      },
                                      child: Text('Sign In',style: TextStyle(color: AppColors.primaryBackground),),
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  GestureDetector(child:
                                    Text("Register now",style: TextStyle(fontSize: 18,color: AppColors.yellow)),
                                    onTap: ()=>{
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterPage()))
                                    }
                                    ,),
                                  SizedBox(height: 10)
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );

        }));
  }
}