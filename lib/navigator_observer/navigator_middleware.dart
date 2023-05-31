import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navigation_chap_6/main.dart';

typedef OnRouteChange<R extends Route<dynamic>> = void Function(
    R route, R previousRoute);

class NavigatorMiddleware<R extends Route<dynamic>> extends NavigatorObserver {
  NavigatorMiddleware({
    this.enableLogger = true,
    this.onPush,
  }) : _stack = [];
  final List<Route<dynamic>> _stack;

  final bool enableLogger;
  final OnRouteChange<R>? onPush;

  List<R> get stack => List<R>.from(_stack);

  @override
  void didPop(Route route, Route? previousRoute) {
    _logget('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _logget('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route);
    _logStack();
    // bool loginBool = false;
    // if(!loginBool){
    //   navigatorKey.currentState!.pushNamed('routeName');
    // }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _logget('{didRemove} \n route: $route \n previousRoute: $previousRoute');
    stack.remove(route);
    _logStack();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _logget('{didReplace} \n newRoute: $newRoute \n oldRoute: $oldRoute');
    if (_stack.indexOf(oldRoute!) >= 0) {
      final oldItemIndex = _stack.indexOf(oldRoute!);
      _stack[oldItemIndex] = newRoute!;
    }
    _logStack();
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    _logget(
      '{didStartUserGesture} \n route: $route \n previousRoute: $previousRoute',
    );
  }

  @override
  void didStopUserGesture() {
    _logget('{didStopUserGesture}');
  }

  void _logStack() {
    final mappedStack =
        _stack.map((Route route) => route.settings.name).toList();

    _logget('Navigator stack: $mappedStack');
  }

  void _logget(String content) {
    if (enableLogger) {
      debugPrint(content);
    }
  }
}
