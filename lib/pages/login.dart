
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool buttonEffect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/loginpic.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Login $name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: EdgeInsets.all(13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: "Enter Username",
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 20.0,
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: EdgeInsets.all(13.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: "Enter Password",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is required";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 50.0,
                ),

                Material(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.circular(buttonEffect ? 65.0 : 20.0),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          buttonEffect = true;
                        });

                        await Future.delayed(Duration(seconds: 1));
                        await Navigator.pushNamed(context, MyRoutes.homeRoute);
                        setState(() {
                          buttonEffect = false;
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 40,
                      width: buttonEffect ? 43 : 200,
                      alignment: Alignment.center,
                      child: buttonEffect
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
