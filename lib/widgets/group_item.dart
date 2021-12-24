import 'package:flutter/material.dart';

class GroupItem extends StatefulWidget {
  List<Widget> children;
  EdgeInsets? padding;
  GroupItem({Key? key, required this.children, this.padding}) : super(key: key);

  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        children: widget.children,
      ),
    );
  }
}
