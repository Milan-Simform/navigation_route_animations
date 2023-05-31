import 'package:flutter/cupertino.dart';

class ScaleRotateRoute<T extends Widget> extends PageRouteBuilder<T> {
  ScaleRotateRoute(this.page, {super.settings})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(animation),
            child: RotationTransition(
              turns: Tween<double>(begin: 0, end: 1).animate(animation),
              child: child,
            ),
          ),
        );

  final Widget page;
}
