import 'package:elo/profile/widgets/iconUser.dart';
import 'package:elo/profile/widgets/userInformation.dart';
import 'package:elo/profile/widgets/tabBar.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  var tabs = [
    const Tab(
      text: 'Dados',
    ),
    const Tab(
      text: 'Faturas',
    ),
    const Tab(
      text: 'Perguntas Frequentes',
    )
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Global().backgroundColor,
      body: safeAreaModified(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: Column(children: [
          Expanded(
            child: TabBarView(controller: tabController, children: const [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: IconUser(),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: UserInformation(),
                    ),
                  ],
                ),
              ),
              Text('tela 2', style: TextStyle(fontSize: 50)),
              Text('tela 3', style: TextStyle(fontSize: 50)),
            ]),
          ),
          TabBar(
            tabs: tabs,
            controller: tabController,
          ),
        ]),
      )),
    );
  }
}
