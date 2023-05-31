import 'package:flutter/material.dart';

class CommunicationProvider extends InheritedWidget {
  const CommunicationProvider({
    required this.title,
    required this.tabController,
    required super.child,
    super.key,
  });
  final TabController tabController;
  final String title;

  @override
  bool updateShouldNotify(CommunicationProvider oldWidget) {
    return title != oldWidget.title;
  }

  static CommunicationProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CommunicationProvider>()!;
}
