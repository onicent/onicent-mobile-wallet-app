import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'package:onicent_wallet_app/theming/theme_manager.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';
import 'package:onicent_wallet_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'main_container.dart';

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
  bool isDarkMode = true;

  void Login(){
  }

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<ThemeNotifier>(context);
    var brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;
    bool isLightMode = brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isDarkMode = !isDarkMode;
              });
              isDarkMode? thmode.setLightMode() : thmode.setDarkMode();
            },
            icon: Icon(
              isDarkMode? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GroupItem(
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      'Log In',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldInput(
                      icon: const Icon(Icons.person, size: 25.0),
                      title: 'Email or Phone',
                      controller: _userController,
                    ),
                    const SizedBox(height: 20.0),
                    TextFieldInput(
                      icon: const Icon(Icons.lock, size: 25.0),
                      title: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(createRoute(ForgotPasswordScreen()));
                        },
                        child: Text(
                          'Forgot password ?',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF2566C1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    ButtonPress(title: 'Log In',
                    onPress: () {
                      Navigator.of(context).push(createRoute(MainContainer()));
                    },
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),

              ],
            ),


            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        'vi';
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
                      'Don\'t have an account? ',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).push(createRoute(const RegisterScreen()));
                      },
                      child: Text(
                        'Registor.',
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
