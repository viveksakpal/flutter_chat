import 'package:flutter/material.dart';
import 'package:flutter_chat/widgets/widget.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50.0,
          alignment: Alignment.bottomCenter,
                child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              TextField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration("email"),
              ),
               TextField(
                style: simpleTextStyle(),
                decoration: textFieldInputDecoration("password"),
              ),
              SizedBox(height: 8.0,),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                    child: Text("Forget Password",style: simpleTextStyle(),),
                  ),
              ),
              SizedBox(height: 8.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: 
                  [ const Color(0xff007EF4),
                    const Color(0xff2A75BC)
                  ]
                  )
                ),
                width: MediaQuery.of(context).size.width,
                  child: Text("Sign In",style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0
                    ),
                    textAlign: TextAlign.center,
                    ),
              ),
               SizedBox(height: 16.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                  child: Text("Sign In with Google",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0),
                      textAlign: TextAlign.center,
                    ),
              ),
               SizedBox(height: 16.0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Dont't have account? ",style: mediumTextStyle(),),
                   Text("Register Now",
                   style: TextStyle(
                     color: Colors.white,
                      fontSize: 17.0,
                      decoration: TextDecoration.underline),),
                 ],
               ),
                 SizedBox(height: 50.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}