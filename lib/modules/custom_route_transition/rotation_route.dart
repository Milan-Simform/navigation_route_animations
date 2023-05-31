import 'package:flutter/cupertino.dart';

class RotationRoute<T extends Widget> extends PageRouteBuilder<T> {
  RotationRoute(this.page, {super.settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              RotationTransition(
            turns: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.linear),
            ),
            child: child,
          ),
        );

  final Widget page;
}
