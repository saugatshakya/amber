import 'package:flutter/material.dart';
import 'package:amber/services/auth_service.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final AuthService _auth = AuthService();
  static final _formkey = new GlobalKey<FormState>();
  String _email, _password, _password2, error = "";
  bool loading = false, obscure1 = true, obscure2 = true;

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
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: new UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.orange)),
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
                      return 'Password needs to be Longer';
                    } else
                      return null;
                  },
                  onChanged: (input) => _password = input,
                  obscureText: obscure1,
                  decoration: new InputDecoration(
                      hintText: "Enter Password",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: new UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.orange),
                      suffixIcon: IconButton(
                          icon: Icon(obscure1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: obscure1 ? Colors.grey : Colors.orange,
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
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Password needs to be Longer';
                    } else if (input != _password) {
                      return 'password does not match';
                    } else
                      return null;
                  },
                  onChanged: (input) => _password2 = input,
                  obscureText: obscure2,
                  decoration: new InputDecoration(
                      border: new UnderlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.orange),
                      suffixIcon: IconButton(
                          icon: Icon(
                            obscure2 ? Icons.visibility : Icons.visibility_off,
                            color: obscure2 ? Colors.grey : Colors.orange,
                          ),
                          onPressed: () {
                            setState(() {
                              obscure2 ? obscure2 = false : obscure2 = true;
                            });
                          })),
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  child: FlatButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.createUserWithEmailAndPassword(
                                  _email, _password);
                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
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
                                  AlwaysStoppedAnimation(Colors.grey[800]))
                          : Text(
                              "SignUp",
                              style: TextStyle(fontSize: 20),
                            )))
            ],
          ),
        ),
      ),
    );
  }
}
