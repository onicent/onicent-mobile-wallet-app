import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';

class AccountVerificationScreen extends StatefulWidget {
  const AccountVerificationScreen({Key? key}) : super(key: key);

  @override
  _AccountVerificationScreenState createState() => _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(title: "verify account", body: Container());
  }
}
