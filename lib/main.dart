import 'package:flutter/material.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/communication_beween_screen.dart';
import 'package:navigation_chap_6/modules/homepage/homepage.dart';
import 'package:navigation_chap_6/navigator_observer/mynav_observer.dart';
import 'package:navigation_chap_6/navigator_observer/navigator_middleware.dart';
import 'package:navigation_chap_6/modules/secondpage/secondpage.dart';
import 'package:navigation_chap_6/route_generator.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
NavigatorMiddleware<PageRoute> middleware = NavigatorMiddleware<PageRoute>(
  onPush: (route, previousRoute) {
    debugPrint('we have push event');

    ///if route is Y we should have some API call
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // onGenerateInitialRoutes: (routeName) {
      //   // debugPrint('OnGenerateInitialRoutes: $routeName');
      //   // return [
      //   //   // if (routeName == '/secondPage/secondPage')
      //   //   MaterialPageRoute(builder: (_) => const HomePage()),
      //   //   MaterialPageRoute(builder: (_) => const SecondPage()),
      //   // ];
      // },
      navigatorKey: navigatorKey,
      onGenerateTitle: (_) => "Milan's Navigation",
      // onUnknownRoute: (routeSettings) {
      //   return MaterialPageRoute(
      //     settings: routeSettings,
      //     builder: (_) => const Scaffold(
      //       body: Center(
      //         child: Text('UnKnownRoute'),
      //       ),
      //     ),
      //   );
      // },
      // onGenerateRoute: RouteGenerator.generateRoute,
      navigatorObservers: <NavigatorObserver>[
        routeObserver,
        // MyNavObserver(),
        middleware
      ],
      // onGenerateRoute: RouteGenerator.generateRoute,
      // onGenerateRoute: (settings) {},
      routes: {
        '/': (context) => const HomePage(),
        '/secondPage': (context) => const SecondPage(),
        '/last': (_) => Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/final_last');
                      },
                      child: const Text('Go to Final Last'),
                    ),
                  ),
                );
              },
            ),
        '/communicationBetweenWidgets': (_) =>
            const CommunicationBetweenScreen(),
        '/final_last': (_) => Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          ModalRoute.withName('/secondPage'),
                        );
                      },
                      child: const Text('Back to Second Page'),
                    ),
                  ),
                );
              },
            ),
      },
    );
  }
}
