import 'package:amber/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _auth = AuthService();
  static final _formkey = GlobalKey<FormState>();
  String _email, _password;
  String error = "";
  bool loading = false, obscure1 = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[800],
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide an email';
                    } else
                      return null;
                  },
                  onChanged: (input) => _email = input,
                  decoration: new InputDecoration(
                      hintText: "Enter Email",
                      border: new UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.email, color: Color(0xfff4a925))),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Password must be 6 digits long';
                    } else
                      return null;
                  },
                  onChanged: (input) => _password = input,
                  obscureText: obscure1,
                  decoration: new InputDecoration(
                      hintText: "Enter Password",
                      fillColor: Colors.grey[200],
                      border: new UnderlineInputBorder(),
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Color(0xfff4a925)),
                      suffixIcon: IconButton(
                          icon: Icon(obscure1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: obscure1 ? Colors.grey : Color(0xfff4a925),
                          onPressed: () {
                            setState(() {
                              obscure1 ? obscure1 = false : obscure1 = true;
                            });
                          })),
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Color(0xfff4a925),
                      borderRadius: BorderRadius.circular(15)),
                  child: FlatButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(_email, _password);
                          if (result == null) {
                            setState(() {
                              error =
                                  'could not sign in with the email and password';
                              loading = false;
                            });
                          } else {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                'Wrapper', (Route<dynamic> route) => false);
                          }
                        }
                      },
                      child: loading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Colors.grey[800]),
                            )
                          : Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            )))
            ],
          ),
        ),
      ),
    );
  }
}
