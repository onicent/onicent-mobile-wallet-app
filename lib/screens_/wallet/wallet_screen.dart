import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _setSwitch = false;

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      iconBack: false,
      // title: 'Ví của tôi',
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      tabBarAction: [
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.menu,
                    ),
                    SizedBox(width: 15.0),
                    Icon(
                      Icons.account_balance_wallet,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'WALLET',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Badge(
                      badgeContent: Text('3', style: TextStyle(fontSize: 12.0, color: Colors.white)),
                      child: Icon(Icons.notifications),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
      padding: EdgeInsets.symmetric(horizontal: 10.0),

      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            () {
              print('hello');
            },
          );
        },
        child: ListView(
          children: [
            SizedBox(height: 10.0),
            // Row(
            //   children: const [
            //     Text(
            //       'Dashboard',
            //       style: TextStyle(
            //         fontWeight: FontWeight.w600,
            //         fontSize: 22.0,
            //         color: Color(0xFF181e7b),
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  Container(
                    height: 180.0,
                    width: MediaQuery.of(context).size.width,
                    padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0),
                        ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/cover_large.jpg'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          // padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(width: 2.0, color: Colors.blue),
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Ước',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Tính',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        const Text(
                          '3.325.000 VNDT',
                          style: TextStyle(
                            fontSize: 25.0,
                            // color: Color(0xFF0F1F5C),
                            color: Color(0xFF234C93),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Item(
                          borderBottom: true,
                          leading: Image.asset('assets/icons/depos.png', width: 40.0),
                          title: 'Nạp',
                          subTitle: 'Cho phép nhận coin từ các ví khác.',
                        ),
                        Item(
                          borderBottom: true,
                          leading: Image.asset('assets/icons/withdraw.png', width: 40.0),
                          title: 'Chuyển',
                          subTitle: 'Chuyển tới địa chỉ ví khác.',
                        ),
                        Item(
                          borderBottom: true,

                          leading: Icon(Icons.swap_horizontal_circle_outlined, size: 40.0, color: Color(0xFF181e7b)),
                          title: 'Quy đổi',
                          subTitle: 'Chuyển tới địa chỉ ví khác.',
                        ),
                        // MenuItem(
                        //   leading: Icon(Icons.credit_card, size: 40.0, color: Color(0xFF181e7b)),
                        //   title: 'Rút về ngân hàng',
                        //   subTitle: 'Chuyển tới địa chỉ ví khác.',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            GroupItem(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Coin Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            color: Color(0xFF181e7b),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: _setSwitch,
                          onChanged: (bool newValue) {
                            setState(() {
                              _setSwitch = newValue;
                            });
                          },
                          activeColor: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
                Item(
                  height: 70,
                  title: 'VNDT',
                  subTitle: 'Prax',
                  leading: Image.asset('assets/icons/crypto/NEO-icon.png', width: 40),
                  trailing: Text('25000000.02',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color(0xFF181e7b),
                    ),
                  ),
                  borderBottom: true,
                ),
                Item(
                  height: 70,
                  title: 'OIC',
                  subTitle: 'Onicent coin',
                  leading: Image.asset('assets/icons/crypto/Ripple-icon.png', width: 40),
                  trailing: Text('2950.02',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color(0xFF181e7b),
                    ),
                  ),
                  borderBottom: true,
                ),
                Item(
                  height: 70,
                  title: 'ETH',
                  subTitle: 'Etherium',
                  leading: Image.asset('assets/icons/crypto/Ethereum-icon.png', width: 40),
                  trailing: Text('12.02',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color(0xFF181e7b),
                    ),
                  ),
                  borderBottom: true,
                ),
                Item(
                  height: 70,
                  title: 'BTC',
                  subTitle: 'Bitcoin',
                  leading: Image.asset('assets/icons/crypto/Bitcoin-icon.png', width: 40),
                  trailing: Text('0.02005',
                    style: const TextStyle(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color(0xFF181e7b),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),

          ],
        ),
      ),
    );
  }

  Widget _cryptoItem({
    String icon = '',
    String cryptoName = '',
    String cryptoShortName = '',
    double cryptoAmount = 0.0,
    bool isBorder = false,
  }) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 18.0),
      height: 85.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0,color: isBorder? Color(0xFFe7e7e7) : Color(0xFFFFFFFF)),
        ),
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 40.0),
          SizedBox(width: 15.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cryptoName,
                style: const TextStyle(
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Color(0xFF3e3e3e),
                ),
              ),
              Text(
                cryptoShortName,
                style: const TextStyle(
                  height: 1.3,
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                '$cryptoAmount',
                style: const TextStyle(
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Color(0xFF181e7b),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _itemCard({
    Widget? icon,
    String? title,
    Function()? onTap,
  }) {
    return Container(
      // margin: const EdgeInsets.only(right: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(6.0),
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                Container(child: icon),
                Text(
                  '$title',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listCryptoItem({
    String? icon,
    double amount = 0,
    String? walletAddress,
    String? cryptoName,
    String? cryptoShortName,
    Widget? child,
    Function()? deposit,
    Function()? withdraw,
    BoxDecoration? decoration,
  }) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(createRoute(CryptoScreen()));
      },
      child: Ink(
        padding:
            const EdgeInsets.only(left: 15, right: 5.0, top: 8.0, bottom: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              width: 0.2,
              color: Color(0xFFE8E8E8),
            ),
            bottom: BorderSide(
              width: 0.2,
              color: Color(0xFFE8E8E8),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              icon!,
              width: 40,
              height: 55,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$cryptoName',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    height: 7.0,
                  ),
                  Text(
                    '$amount $cryptoShortName',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_drop_down_circle, size: 16.0),
            SizedBox(
              width: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
// child: PopupMenuButton<int>(
// onSelected: (result) {
// if (result == 0) {
// Navigator.of(context).push(createRoute(DepositWalletScreen(
// cryptoName: cryptoName!, address: walletAddress!)));
// } else if (result == 1) {
// Navigator.of(context)
//     .push(createRoute(const WithdrawWalletScreen()));
// } else if (result == 2) {
// Navigator.of(context)
//     .push(createRoute(const SwapScreen()));
// } else if (result == 3) {
// Navigator.of(context)
//     .push(createRoute(const TransactionHistoryScreen()));
// }
// },
// itemBuilder: (context) => [
// const PopupMenuItem(
// child: Text('Deposit'),
// value: 0,
// ),
// const PopupMenuItem(
// child: Text('Withdraw'),
// value: 1,
// ),
// const PopupMenuItem(
// child: Text('Swap'),
// value: 2,
// ),
// const PopupMenuItem(
// child: Text('Lịch sử giao dịch'),
// value: 3,
// ),
// ],
// icon: const Icon(Icons.more_vert),
// ),
// ),
