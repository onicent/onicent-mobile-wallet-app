import 'package:flutter/material.dart';
// import 'home/home_screen.dart';
// import 'wallet/wallet_screen.dart';
// import 'hub/hub.dart';
import 'package:badges/badges.dart';
import 'package:onicent_wallet_app/screens_/hub/hub.dart';
import 'package:onicent_wallet_app/screens_/wallet/wallet_screen.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainer createState() => _MainContainer();
}

class _MainContainer extends State<MainContainer> {
  int _currentIndex = 0;
  // int _selectedIndex = 0;

  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Scaffold(),
    WalletScreen(),
    HubScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: Color(0xFFF5F8FD),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          // selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          // selectedLabelStyle: textTheme.caption,
          // unselectedLabelStyle: textTheme.caption,

          selectedItemColor: Color(0xFF303e9f),
          unselectedLabelStyle: const TextStyle(
            height: 1.3,
            fontWeight: FontWeight.w400,
          ),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          selectedFontSize: 13.0,
          unselectedFontSize: 13.0,
          iconSize: 26,

          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Trang chủ',
              icon: Icon(Icons.home_max_outlined, size: 25.0,),
              activeIcon: Icon(Icons.home_max, size: 25.0,),
            ),
            BottomNavigationBarItem(
              label: 'Ví của tôi',
              icon: Icon(Icons.account_balance_wallet_outlined, size: 25.0,),
              activeIcon: Icon(Icons.account_balance_wallet, size: 25.0,),
            ),
            BottomNavigationBarItem(
              label: 'Cá nhân',

              icon: Badge(
                badgeContent: Text('3', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                child: Icon(Icons.person_outlined),
              ),
              activeIcon: Badge(
                badgeContent: Text('3', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge({
    int count = 9,
  }) {
    return Stack(
      children: <Widget>[
        const Icon(Icons.settings_outlined),
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: count == 0 ? Colors.transparent : Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              count == 0 ? '' : '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
