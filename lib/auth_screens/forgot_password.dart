import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.orange,
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg:
            "Reset password link has sent your mail please use it to change the password.");
    Navigator.pop(context);
  }
}
