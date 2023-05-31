import 'package:flutter/cupertino.dart';

class SizeRoute<T extends Widget> extends PageRouteBuilder<T> {
  SizeRoute(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );

  final Widget page;
}
