import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/screens_/login_screen.dart';
import './theming/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
          theme: theme.getTheme(),
          home: LoginScreen(),
        ));
  }
}