import 'dart:math';
import 'package:flutter/material.dart';
import 'package:onicent_wallet_app/widgets/empty_screen.dart';

class FlipCardGame extends StatelessWidget {
  const FlipCardGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipAnimationApp();
  }
}


class FlipAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 200,
                child: WidgetFlipper(
                  frontWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green[200],
                    ),
                    child: Center(
                      child: Text(
                        "FRONT side.",
                      ),
                    ),
                  ),
                  backWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.yellow[200],
                    ),
                    child: Center(
                      child: Text(
                        "BACK side.",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                width: 100,
                height: 200,
                child: WidgetFlipper(
                  frontWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green[200],
                    ),
                    child: Center(
                      child: Text(
                        "FRONT side.",
                      ),
                    ),
                  ),
                  backWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.yellow[200],
                    ),
                    child: Center(
                      child: Text(
                        "BACK side.",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                width: 100,
                height: 200,
                child: WidgetFlipper(
                  frontWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green[200],
                    ),
                    child: Center(
                      child: Text(
                        "FRONT side.",
                      ),
                    ),
                  ),
                  backWidget: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.yellow[200],
                    ),
                    child: Center(
                      child: Text(
                        "BACK side.",
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class WidgetFlipper extends StatefulWidget {
  WidgetFlipper({
    Key? key,
    required this.frontWidget,
    required this.backWidget,
  }) : super(key: key);

  final Widget frontWidget;
  final Widget backWidget;

  @override
  _WidgetFlipperState createState() => _WidgetFlipperState();
}

class _WidgetFlipperState extends State<WidgetFlipper> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _frontRotation;
  late Animation<double> _backRotation;
  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2).chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0).chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedCard(
          animation: _backRotation,
          child: widget.backWidget,
        ),
        AnimatedCard(
          animation: _frontRotation,
          child: widget.frontWidget,
        ),
        _tapDetectionControls(),
      ],
    );
  }

  Widget _tapDetectionControls() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GestureDetector(
          onTap: _leftRotation,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topLeft,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        GestureDetector(
          onTap: _rightRotation,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 1.0,
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }

  void _leftRotation() {
    _toggleSide();
  }

  void _rightRotation() {
    _toggleSide();
  }

  void _toggleSide() {
    if (isFrontVisible) {
      controller.forward();
      isFrontVisible = false;
    } else {
      controller.reverse();
      isFrontVisible = true;
    }
  }
}

class AnimatedCard extends StatelessWidget {
  AnimatedCard({
    required this.child,
    required this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}

