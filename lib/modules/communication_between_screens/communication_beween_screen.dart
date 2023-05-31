import 'package:flutter/material.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/communication_provider.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/components/page1.dart';
import 'package:navigation_chap_6/modules/communication_between_screens/components/page2.dart';

class CommunicationBetweenScreen extends StatefulWidget {
  const CommunicationBetweenScreen({super.key});

  @override
  State<CommunicationBetweenScreen> createState() =>
      _CommunicationBetweenScreenState();
}

class _CommunicationBetweenScreenState extends State<CommunicationBetweenScreen>
    with TickerProviderStateMixin {
  final _keyChildOne = GlobalKey<Page1State>();
  String updateChildTitle = 'Old Title';
  String updateChild2Title = 'Old Title Child2';
  String parentTitle = 'Default Title';
  void updateParentTitle(String txt) {
    setState(() {
      parentTitle = txt;
    });
  }

  void updateChildTwoTitle(String txt) {
    setState(() {
      updateChild2Title = txt;
    });
  }

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return CommunicationProvider(
      title: updateChild2Title,
      tabController: controller,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Communication between screens $parentTitle'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    updateChildTitle = 'updated to new title';
                  });
                  // _KeyChildOne.currentState!.updateTitle('Milan Chabhadiya');
                },
                child: const Text('Action1'),
              ),
              TabBar(
                controller: controller,
                tabs: const [
                  Tab(
                    text: 'Page1',
                  ),
                  Tab(
                    text: 'Page2',
                  ),
                ],
                labelColor: Colors.blue,
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    Page1(
                      key: _keyChildOne,
                      // controller: controller,
                      // parentCallBack: updateChildTwoTitle,
                      // changeTab: () {
                      //   controller.index = 1;
                      // },
                    ),
                    const Page2(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
