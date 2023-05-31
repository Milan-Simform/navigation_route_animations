import 'package:flutter/material.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/communication_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({
    // required this.changeTab,
    // required this.controller,
    // required this.parentCallBack,
    super.key,
  });
  // final VoidCallback changeTab;
  // final void Function(String) parentCallBack;
  // final TabController controller;
  @override
  State<Page1> createState() => Page1State();
}

class Page1State extends State<Page1> {
  // void updateTitle(String title) {
  //   setState(() {
  //     this.title = title;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    const title = 'Page1';

    return Scaffold(
      body: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          MaterialButton(
            child: const Text('Action 2'),
            onPressed: () {},
          ),
          MaterialButton(
            child: const Text('Action 3'),
            onPressed: () {
              // widget.parentCallBack('Title Updated From Child1');
            },
          ),
          MaterialButton(
            child: const Text('Action 4'),
            onPressed: () {
              // widget.controller.index = 1;
              // widget.changeTab();
              CommunicationProvider.of(context)!.tabController.index = 1;
            },
          ),
        ],
      ),
    );
  }
}
