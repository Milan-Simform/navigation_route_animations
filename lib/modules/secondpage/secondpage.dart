import 'package:flutter/material.dart';
import 'package:navigation_chap_6/main.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RouteAware {
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
  void didPop() async {
    // TODO: implement didPop
    await Future.delayed(Duration(seconds: 5));
    debugPrint(
        'SECONDPAGE: ------------------------------------------------------didPop');
  }

  @override
  void didPopNext() {
    debugPrint(
        'SECONDPAGE: ------------------------------------------------------didPopNext');
    // TODO: implement didPopNext
  }

  @override
  void didPush() {
    debugPrint(
        'SECONDPAGE: ------------------------------------------------------didPush');
    // TODO: implement didPush
  }

  @override
  void didPushNext() {
    debugPrint(
        'SECONDPAGE: ------------------------------------------------------didPushNext');
    // TODO: implement didPushNext
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(ModalRoute.of(context)!.settings.name);
    // debugPrint('new_screen');
    final msg = (ModalRoute.of(context)!.settings.arguments as RouteSettings?)!
        .arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text('$msg'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message: $msg'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop('Boom');
              },
              child: const Text('Return Boom to Previous Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState!.pop('Zoom');
                // Navigator.of(context).pop('Zoom');
              },
              child: const Text('Return Zoom to Previous Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute<Widget>(
                //     builder: (_) => const SecondPage(),
                //     settings: RouteSettings(
                //       arguments: RouteSettings(
                //         arguments: 'Hello. this is ping from home page.',
                //       ),
                //     ),
                //   ),
                // );

                Navigator.of(context).pushNamed(
                  '/secondPage',
                  arguments: const RouteSettings(
                    arguments: 'Hello. Again',
                  ),
                );

                //   '/secondPage',
                //   arguments: const RouteSettings(
                //     arguments: 'Hello. Again',
                //   ),
                // );
                // Navigator.of(context).pushNamed(
                //   '/secondPage',
                //   arguments: const RouteSettings(
                //     arguments: 'Hello. Again',
                //   ),
                // );
              },
              child: const Text('Push TO Self'),
            ),
            ElevatedButton(
              onPressed: () {
                // print('_______________$currentRoute');
                // Navigator.popUntil(context, ModalRoute.withName('/secondPage'));

                Navigator.maybePop(context);
              },
              child: const Text('popUntil(predicate)'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.popUntil(
                //   context,
                //   // (route) => !Navigator.canPop(context),
                //   (route) => route.isFirst,
                // );
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/secondPage'),
                );

                // Navigator.popUntil(context, (route) {
                //   print(ModalRoute.of(context)?.settings.name ?? 'null');
                //   return ModalRoute.of(context)?.settings.name ==
                //       ModalRoute.withName('/secondPage');
                // });
              },
              child: const Text('Goto FirstPage'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Navigator.of(context).removeRoute();
              },
              child: const Text('Remove Route'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).removeRoute();
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('ThirdPage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/last');
                // Navigator.pushReplacementNamed(context, '/last');
              },
              child: const Text('new screen'),
            ),
          ],
        ),
      ),
    );
  }
}
