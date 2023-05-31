import 'package:flutter/cupertino.dart';

class FadeRoute<T extends Widget> extends PageRouteBuilder<T> {
  FadeRoute(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, _, child) => FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(animation),
            child: child,
          ),
        );
  final Widget page;
}
