import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';
import 'package:onicent_wallet_app/widgets/group_item.dart';
import 'package:onicent_wallet_app/widgets/item.dart';

class BaseCurrency extends StatefulWidget {
  const BaseCurrency({Key? key}) : super(key: key);

  @override
  State<BaseCurrency> createState() => _BaseCurrencyState();
}

class _BaseCurrencyState extends State<BaseCurrency> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: 'Đồng tiền cơ sở',
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      body: ListView(
        children: [

          InkWell(
            child: GroupItem(
              children: [
                Item(
                  borderBottom: true,
                  leading: Image.asset('assets/icons/crypto/Ripple-icon.png', width: 38.0),
                  title: 'VNDT',
                  titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                  subTitle: 'Prax VNDT',
                  arrow: false,
                  trailing: Icon(Icons.done, size: 30.0, color: Colors.green),
                ),

                Item(
                  leading: Image.asset('assets/icons/crypto/Ripple-icon.png', width: 38.0),
                  title: 'USDT',
                  titleStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                  subTitle: 'Tether USDT',
                  arrow: false,
                  trailing: Icon(Icons.done, size: 30.0, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
