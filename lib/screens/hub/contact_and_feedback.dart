import 'package:onicent_wallet_app/widgets/group_item.dart';
import 'package:onicent_wallet_app/widgets/route_render.dart';
import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';
import 'package:onicent_wallet_app/widgets/item.dart';

class ContactAndFeedbackScreen extends StatefulWidget {
  const ContactAndFeedbackScreen({Key? key}) : super(key: key);

  @override
  _ContactAndFeedbackScreenState createState() => _ContactAndFeedbackScreenState();
}

class _ContactAndFeedbackScreenState extends State<ContactAndFeedbackScreen> {
  BoxDecoration borderBottom = BoxDecoration(
    border: Border(
      bottom: BorderSide(width: 1.0, color: Color(0xFFF5F8FD)),
    ),
  );
  Icon iconArrow = Icon(  Icons.arrow_forward_ios,  color: Color(0xFF8D8C8C),  size: 14,  );

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
        title: 'Liên hệ và phản hồi',
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      body: Column(
          children: [
            GroupItem(
              children: [
                Item(
                  borderBottom: true,
                  onTap: () {
                    Navigator.of(context).push(createRoute(const LiveChatScreen()));
                  },
                  title: 'Live chat',
                  decoration: borderBottom,
                ),
                Item(
                  borderBottom: true,
                  onTap: () {
                    Navigator.of(context).push(createRoute(const FeedbackScreen()));
                  },
                  title: 'Feedback',
                  decoration: borderBottom,
                ),
                Item(
                  title: 'Email',
                  trailing: Text(
                    'Cs@bitnet.asian',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({Key? key}) : super(key: key);

  @override
  _LiveChatScreenState createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(title: 'Live chat', body: Container());
  }
}


class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(title: 'Feedback', body: Container());
  }
}
