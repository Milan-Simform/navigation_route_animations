import 'package:flutter/cupertino.dart';

class EnterExitRoute<T extends Widget> extends PageRouteBuilder<T> {
  EnterExitRoute(this.enterPage, this.exitPage)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionsBuilder: (_, animation, secondaryAnimation, child) =>
              Stack(
            children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(-1, 0),
                ).animate(animation),
                child: enterPage,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: exitPage,
              ),
            ],
          ),
        );

  final Widget enterPage;
  final Widget exitPage;
}
