import 'package:onicent_wallet_app/screens/hub/contact_and_feedback.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/widgets.dart';
import 'flip_card_game.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Trang chủ',
      iconBack: false,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      body: ListView(
        children: [
          Material(
            child: ButtonPress(
              onPress: (){
                Navigator.of(context).push(createRoute(const FlipCardGame()));
              },
              title: 'game',
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemApp({
    double height = 90,
    String? icon,
    String? title,
    Function()? ontap,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () => ontap,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: const Color(0xFFeaeaef)),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white,
              ),
              child: Container(
                height: height,
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      '$icon',
                      width: 45,
                      height: 45,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '$title',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
