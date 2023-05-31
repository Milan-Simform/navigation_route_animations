import 'package:flutter/material.dart';
import 'package:navigation_chap_6/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {
    // TODO: implement didPop
    debugPrint(
        'HOMEPAGE: ------------------------------------------------------didPop');
  }

  @override
  void didPopNext() {
    debugPrint(
        'HOMEPAGE: ------------------------------------------------------didPopNext');
    // TODO: implement didPopNext
  }

  @override
  void didPush() {
    debugPrint(
        'HOMEPAGE: ------------------------------------------------------didPush');
    // TODO: implement didPush
  }

  @override
  void didPushNext() {
    debugPrint(
        'HOMEPAGE: ------------------------------------------------------didPushNext');
    // TODO: implement didPushNext
  }

  //
  // @override
  // void didPush() {
  //   final route = ModalRoute.of(context)?.settings;
  //   print('didPush route: $route');
  // }
  //
  // @override
  // void didPopNext() {
  //   final route = ModalRoute.of(context)!.settings.name;
  //   print('didPopNext route: $route');
  // }
  //
  // @override
  // void didPushNext() {
  //   final route = ModalRoute.of(context)!.settings.name;
  //   print('didPushNext route: $route');
  // }
  //
  // @override
  // void didPop() {
  //   final route = ModalRoute.of(context)!.settings.name;
  //   print('didPop route: $route');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).pushNamed(
                      '/secondPage',
                      arguments: const RouteSettings(
                        arguments: 'Hello. this is ping from home page.',
                        name: '/secondPage',
                      ),
                    );
                    debugPrint('RESULT: $result');
                  },
                  child: const Text('SecondPage'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // final result = await Navigator.of(context).pushNamed(
                    //   '/communicationBetweenWidgets',
                    //   arguments: const RouteSettings(
                    //     arguments: 'Communication Secret',
                    //   ),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   SlideRightRoute(const CommunicationBetweenScreen()),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   ScaleRoute(const CommunicationBetweenScreen()),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   RotationRoute(const CommunicationBetweenScreen()),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   SizeRoute(const CommunicationBetweenScreen()),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   FadeRoute(const CommunicationBetweenScreen()),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   EnterExitRoute(
                    //     const CommunicationBetweenScreen(),
                    //     this,
                    //   ),
                    // );
                    // debugPrint(result.toString());
                    // final result = await Navigator.push(
                    //   context,
                    //   ScaleRotateRoute(
                    //     const CommunicationBetweenScreen(),
                    //   ),
                    // );
                    // debugPrint(result.toString());

                    await Navigator.pushNamed(
                      context,
                      '/communicationBetweenWidgets',
                    );
                  },
                  child: const Text('Communication Between Widgets'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  child: const Text('MayBePop'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
