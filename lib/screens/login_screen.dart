import 'package:badges/badges.dart';
import 'package:onicent_wallet_app/screens/forgot_password_screen.dart';
import 'package:onicent_wallet_app/screens/register_screen.dart';
import 'package:onicent_wallet_app/screens/main_container.dart';
import 'package:onicent_wallet_app/widgets/route_render.dart';
import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';
import 'package:onicent_wallet_app/widgets/testWidget.dart';
import 'package:onicent_wallet_app/widgets/widgets.dart';
import '../utilities/locales/flutter_locales.dart';

import 'package:http/http.dart';

import '../widgets/text_field_input.dart';
import '../widgets/button_press.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoggedIn = false;

  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch('email');

  final String _FlagVI = 'assets/icons/flag/VI.png';
  final String _FlagEN = 'assets/icons/flag/EN.png';
  bool _lang = true;

  void Login(){
  }

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      iconBack: false,
      title: 'Đăng nhập',
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GroupItem(
              children: [
                const SizedBox(height: 35.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Locales.string(context, 'sign_in'),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  icon: const Icon(Icons.person, size: 25.0),
                  title: Locales.string(context, 'email_or_phone'),
                  controller: _userController,
                ),
                const SizedBox(height: 20.0),
                TextFieldInput(
                  icon: const Icon(Icons.lock, size: 25.0),
                  title: Locales.string(context, 'password'),
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(createRoute(const ForgotPasswordScreen()));
                    },
                    child: Text(
                      Locales.string(context, 'forgot_password'),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF2566C1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                ButtonPress(
                  onPress: () {
                    Navigator.of(context).push(createRoute(MainContainer()));
                  },
                  title: Locales.string(context, 'sign_in'),
                ),
                const SizedBox(height: 30.0),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Locales.change(context, 'vi');
                      },
                      child: Badge(
                        padding: EdgeInsets.all(2.0),
                        position: BadgePosition.topEnd(top: -4,end: -4),
                        badgeColor: Colors.white,
                        badgeContent: Icon(
                          Icons.done,
                          size: 13.0,
                        ),
                        child: CircleAvatar(
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            height: 37.0,
                            width: 37.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/flag/VI.png'),
                                  fit: BoxFit.cover,
                                  scale: 1
                              ),
                            ),
                            child: null /* add child content here */,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      onTap: () {
                        Locales.change(context, 'en');
                      },
                      child: Badge(
                        showBadge: false,
                        padding: EdgeInsets.all(2.0),
                        position: BadgePosition.topEnd(top: -4,end: -4),
                        badgeColor: Colors.white,
                        badgeContent: Icon(
                          Icons.done,
                          size: 13.0,
                        ),
                        child: CircleAvatar(
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            height: 37.0,
                            width: 37.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('assets/icons/flag/EN.png'),
                                  fit: BoxFit.cover,
                                  scale: 1
                              ),
                            ),
                            child: null /* add child content here */,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Locales.string(context, 'Dont_have_an_account'),
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(createRoute(const RegisterScreen()));
                      },
                      child: Text(
                        Locales.string(context, 'sign_up'),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF2566C1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
