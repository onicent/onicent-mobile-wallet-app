import 'package:flutter/material.dart';

class GroupItem extends StatefulWidget {
  List<Widget> children;
  GroupItem({Key? key, required this.children}) : super(key: key);

  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Column(
        children: widget.children,
      ),
    );
  }
}
