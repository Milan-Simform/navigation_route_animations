import 'package:flutter/material.dart';
import 'package:navigation_chap_6/modules/homepage/homepage.dart';
import 'package:navigation_chap_6/modules/secondpage/secondpage.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).removeRoute(
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text('removeRoute'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).removeRouteBelow(
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
                // Navigator.pushReplacement(context, newRoute)
              },
              child: const Text('removeRouteBelow'),
            ),
          ],
        ),
      ),
    );
  }
}
