import 'package:flutter/material.dart';

class SlideRightRoute<T extends Widget> extends PageRouteBuilder<T> {
  SlideRightRoute(this.page, {super.settings})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                    .animate(animation),
            // Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            //     .animate(animation),
            child: child,
          ),
        );
  final Widget page;
}
