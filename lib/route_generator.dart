import 'package:flutter/material.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/communication_beween_screen.dart';
import 'package:navigation_chap_6/modules/custom_route_transition/rotation_route.dart';
import 'package:navigation_chap_6/modules/custom_route_transition/scale_rotate_route.dart';
import 'package:navigation_chap_6/modules/homepage/homepage.dart';
import 'package:navigation_chap_6/modules/secondpage/secondpage.dart';
import 'package:navigation_chap_6/modules/thirdpage/thirdpage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return ScaleRotateRoute(const HomePage(), settings: settings);
      // return PageRouteBuilder(
      //   pageBuilder: (context, start, end) {
      //     return const HomePage();
      //   },
      //   transitionsBuilder: (
      //     context,
      //     animation,
      //     secondaryAnimation,
      //     Widget child,
      //   ) {
      //     // print(animation);
      //     // print(secondaryAnimation);
      //     return SlideTransition(
      //       position: Tween<Offset>(
      //         begin: const Offset(-1, 0),
      //         end: Offset.zero,
      //       ).animate(animation),
      //       child: child,
      //     );
      //   },
      // );
      // return MaterialPageRoute(
      //   builder: (_) => const HomePage(),
      //   maintainState: false,
      // );
      case '/secondPage':
        debugPrint(args.toString());
        if (args is String) {
          // return MaterialPageRoute(
          //   builder: (_) => const SecondPage(),
          //   settings: RouteSettings(arguments: args),
          //   // title: 'Go',
          //   maintainState: false,
          //   allowSnapshotting: false,
          // );
          return RotationRoute(
            const SecondPage(),
            settings: settings,
          );
        }
        if (args is RouteSettings) {
          // return MaterialPageRoute(
          //   builder: (_) => const SecondPage(),
          //   settings: RouteSettings(arguments: args),
          //   // title: 'Go',
          //   maintainState: false,
          //   allowSnapshotting: false,
          // );
          return RotationRoute(
            const SecondPage(),
            settings: settings,
          );
        }
        return _errorRoute(settings);
      case '/communicationBetweenWidgets':
        // return MaterialPageRoute(
        //   builder: (context) => const CommunicationBetweenScreen(),
        //   settings: RouteSettings(arguments: args),
        // );
        // return ScaleRotateRoute(const CommunicationBetweenScreen());
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CommunicationBetweenScreen(),
          // transitionDuration: Duration(seconds: 5),
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
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdPage(),
          settings: settings,
        );
      case '/last':
        return MaterialPageRoute(
          builder: (_) => const ThirdPage(),
          settings: settings,
        );
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings? settings) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error'),
          ),
        );
      },
      settings: settings,
    );
  }
}
