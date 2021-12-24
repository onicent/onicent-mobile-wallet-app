import 'package:flutter/cupertino.dart';
import 'package:onicent_wallet_app/widgets/button_press.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/group_item.dart';
import 'package:onicent_wallet_app/widgets/text_field_input.dart';
// import '../utilities/locales/flutter_locales.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        // height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter your number phone or email to reset your password.',
              style: TextStyle(
                  fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Phone or Email'.toUpperCase(),
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15.0),
            TextFieldInput(title: 'Enter the phone or email'),
            SizedBox(height: 30.0),
            ButtonPress(
              title: 'Forgot Password',
            ),

          ],
        ),
      ),
    );
  }
}
