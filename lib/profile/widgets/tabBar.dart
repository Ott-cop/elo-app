import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class TabBarProfile extends StatefulWidget {
  const TabBarProfile({super.key});

  @override
  State<TabBarProfile> createState() => _TabBarProfileState();
}

class _TabBarProfileState extends State<TabBarProfile>
    with SingleTickerProviderStateMixin {
  var tabs = [
    Tab(
      text: 'Dados',
    ),
    Tab(
      text: 'Faturas',
    ),
    Tab(
      text: 'Perguntas Frequentes',
    )
  ];

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: safeAreaModified(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(controller: tabController, children: [
                Text('tela 1', style: TextStyle(fontSize: 50)),
                Text('tela 2', style: TextStyle(fontSize: 50)),
                Text('tela 3', style: TextStyle(fontSize: 50)),
              ]),
            ),
            TabBar(
              tabs: tabs,
              controller: tabController,
            ),
          ],
        ),
      ),
    );
  }
}
