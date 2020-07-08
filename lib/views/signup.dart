import 'package:flutter/material.dart';
import 'package:flutter_chat/services/auth.dart';
import 'package:flutter_chat/views/chatroom_screen.dart';
import 'package:flutter_chat/widgets/widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthMethods authMethods = new AuthMethods();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController userNametxteditctrl = new TextEditingController();
  TextEditingController emailtxteditctrl = new TextEditingController();
  TextEditingController passwordtxteditctrl = new TextEditingController();
  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(
              emailtxteditctrl.text, passwordtxteditctrl.text)
              .then((val) => print("${val.uid}"));
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ChatRoom()
                   ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 50.0,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) {
                                return val.isEmpty || val.length < 3
                                    ? "Enter Username 3+ characters"
                                    : null;
                              },
                              controller: userNametxteditctrl,
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration("Username"),
                            ),
                            TextFormField(
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Enter correct email";
                              },
                              controller: emailtxteditctrl,
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration("email"),
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                return value.length < 6
                                    ? "Enter Password 6+ characters"
                                    : null;
                              },
                              controller: passwordtxteditctrl,
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration("password"),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            "Forget Password",
                            style: simpleTextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          //ToDo
                          signMeUp();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                              ])),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Sign Up",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sign Up with Google",
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have account? ",
                            style: mediumTextStyle(),
                          ),
                          Text(
                            "SignIn Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
