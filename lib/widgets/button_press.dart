import 'package:flutter/material.dart';

class ButtonPress extends StatefulWidget {
  final String title;
  final Color? textColor;
  final Color? backgroundColor;
  final Function()? onPress;
  final double? height;
  final double? width;

  const ButtonPress({
    Key? key,
    this.title = '',
    this.textColor,
    this.backgroundColor,
    this.onPress,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<ButtonPress> createState() => _ButtonPressState();
}

class _ButtonPressState extends State<ButtonPress> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: FlatButton(
        child: Text(widget.title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
        color: Theme.of(context).buttonColor,
        textColor: Colors.white,

        onPressed: widget.onPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
