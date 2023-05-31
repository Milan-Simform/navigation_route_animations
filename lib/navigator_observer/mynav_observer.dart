import 'dart:developer';

import 'package:flutter/cupertino.dart';

class MyNavObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    // TODO: implement didPush
    log('MyNavObserver--------Route: $route & PreviousRoute: $previousRoute');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    log('MyNavObserver--------Route: $route & PreviousRoute: $previousRoute');
  }
}
