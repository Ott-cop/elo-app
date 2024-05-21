import 'package:elo/home/menu_home/item_home/item_home.dart';
import 'package:flutter/material.dart';

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
  List<ItemHome> lista = const [
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome(),
    ItemHome()
  ];

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
          dividerColor: Colors.transparent,
          controller: tabController,
          tabs: rooms,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          onTap: (value) {
            setState(() {});
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 10,
          child: Builder(builder: (_) {
            if (tabController.index == 0) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 15,
                    runSpacing: 15,
                    children: List.generate(lista.length, (index) {
                      return lista[index];
                    })),
              );
            } else if (tabController.index == 1) {
              return const Text('2');
            } else if (tabController.index == 2) {
              return const Text('3');
            } else if (tabController.index == 3) {
              return const Text('4');
            } else {
              return Container();
            }
          }),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
