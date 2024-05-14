import 'package:elo/home/menu_home/item_home/item_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuHomeWidget extends StatefulWidget {
  const MenuHomeWidget({super.key});

  @override
  State<MenuHomeWidget> createState() => _MenuHomeWidgetState();
}

class _MenuHomeWidgetState extends State<MenuHomeWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> rooms = <Tab>[
    Tab(text: 'Geral'),
    Tab(text: 'Sala'),
    Tab(text: 'Quarto'),
    Tab(text: 'Banheiro')
  ];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: rooms.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: rooms,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: TabBarView(
            controller: tabController,
            children: const [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemHome(),
                      SizedBox(
                        width: 20,
                      ),
                      ItemHome(),
                    ],
                  ),
                ],
              ),
              Text('HELLO2'),
              Text('HELLO3'),
              Text('HELLO4'),
            ],
          ),
        )
      ],
    );
  }
}
