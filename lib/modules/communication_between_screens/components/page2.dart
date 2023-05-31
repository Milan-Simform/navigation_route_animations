import 'package:flutter/material.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/communication_provider.dart';
import 'dart:math' as math;

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Page 2 ${CommunicationProvider.of(context)?.title ?? ''}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          MaterialButton(
            child: const Text('Page 2 - Action - 5'),
            onPressed: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Hero(
                            tag: 'flutter-logo',

                            // flightShuttleBuilder: (
                            //   BuildContext flightContext,
                            //   Animation<double> animation,
                            //   HeroFlightDirection flightDirection,
                            //   BuildContext fromHeroContext,
                            //   BuildContext toHeroContext,
                            // ) {
                            //   return RotationTransition(
                            //     turns: Tween<double>(begin: 0, end: 1)
                            //         .animate(animation),
                            //     child: Image.network(
                            //       'https://media.istockphoto.com/id/643843462/photo/impatiens-hawkeri-is-native-to-png-and-the-solomon-islands.jpg?s=612x612&w=is&k=20&c=vldQ0Xpr-4oGCk4Us85rB6H930AVHJaIkOIdAUML1vM=',
                            //       width: 100,
                            //       fit: BoxFit.cover,
                            //     ),
                            //   );
                            // },
                            placeholderBuilder: (context, size, child) {
                              return Opacity(opacity: 1, child: child);
                            },
                            transitionOnUserGestures: true,
                            // createRectTween: (a, b) {
                            //   return Tween<Rect>(
                            //     end: Rect.zero,
                            //     begin: Rect.fromCenter(
                            //       center: const Offset(10, 10),
                            //       width: 10,
                            //       height: 10,
                            //     ),
                            //   );
                            // },
                            child: Image.network(
                              'https://media.istockphoto.com/id/643843462/photo/impatiens-hawkeri-is-native-to-png-and-the-solomon-islands.jpg?s=612x612&w=is&k=20&c=vldQ0Xpr-4oGCk4Us85rB6H930AVHJaIkOIdAUML1vM=',
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Hero(
            tag: 'flutter-logo',
            child: Image.network(
              'https://media.istockphoto.com/id/643843462/photo/impatiens-hawkeri-is-native-to-png-and-the-solomon-islands.jpg?s=612x612&w=is&k=20&c=vldQ0Xpr-4oGCk4Us85rB6H930AVHJaIkOIdAUML1vM=',
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class QuadraticOffsetTween extends Tween<Offset> {
  QuadraticOffsetTween({
    required Offset begin,
    required Offset end,
  }) : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    if (t == 0.0) return begin!;
    if (t == 1.0) return end!;
    final x = -11 * begin!.dx * math.pow(t, 2) +
        (end!.dx + 10 * begin!.dx) * t +
        begin!.dx;
    final y = -2 * begin!.dy * math.pow(t, 2) +
        (end!.dy + 1 * begin!.dy) * t +
        begin!.dy;
    return Offset(x, y);
  }
}
