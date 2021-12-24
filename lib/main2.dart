import 'package:onicent_wallet_app/screens_/login_screen.dart';

import './screens/splash_screen.dart';
import 'package:flutter/material.dart';
import './utilities/locales/flutter_locales.dart';

import 'services/shared_service.dart';
import 'utilities/connectionStatusSingleton.dart';


import './theming/theme_manager.dart';
import 'package:provider/provider.dart';

import 'package:day_night_switcher/day_night_switcher.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Locales.init(['en', 'vi']); // get last saved language
//   // remove await async (to get system language as default)
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Get result of the login function.
//
//
//   ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
//   connectionStatus.initialize();
//   runApp(MyApp());
// }






void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Whether dark mode is enabled.
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day / night switcher example',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text('Day / night switcher example')),
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: onStateChanged,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: DayNightSwitcherIcon(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Dark mode is ' +
                    (isDarkModeEnabled ? 'enabled' : 'disabled') +
                    '.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Called when the state (day / night) has changed.
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }
}






class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        title: 'Onicent',
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Typography',
          colorScheme: colorScheme,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 66.0, fontStyle: FontStyle.italic),
            headline3: TextStyle(fontSize: 56.0, fontStyle: FontStyle.italic),
            headline4: TextStyle(fontSize: 46.0, fontStyle: FontStyle.italic),
            headline5: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            headline6: TextStyle(fontSize: 36.0),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

const ColorScheme colorScheme = ColorScheme(
  primary: Color(0xFF303e9f), // Appbar Background
  onPrimary: Colors.white, // Appbar text color
  primaryVariant: Color(0xFF117378),
  secondary: Color(0xFF3771D5),
  secondaryVariant: Color(0xFFFAFBFB),
  background: Colors.white,
  surface: Color(0xFF808080),
  onBackground: Colors.white,
  error: Colors.redAccent,
  onError: Colors.redAccent,
  onSecondary: Color(0xFF221F26), //body color
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light, // Body background color
);