import 'package:elo/home/menu_home/item_home/item_home.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    Tab(text: 'Banheiro'),
    Tab(text: 'Quintal')
  ];
  late TabController tabController;
  late List<ItemHome> general;
  late List<ItemHome> livingRoom;
  late List<ItemHome> room;
  late List<ItemHome> bathroom;
  late List<ItemHome> yard;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: rooms.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final itemHomeRepository = Provider.of<ItemHomeRepositories>(context);
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Wrap(
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: 15,
                      runSpacing: 15,
                      children: List.generate(
                          itemHomeRepository.listItems.length, (index) {
                        return ItemHome(
                            device: itemHomeRepository.listItems[index]);
                      })),
                ),
              );
            } // else if (tabController.index == 1) {
            //   return SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Wrap(
            //       alignment: WrapAlignment.center,
            //       direction: Axis.horizontal,
            //       spacing: 15,
            //       runSpacing: 15,
            //       children: List.generate(livingRoom.length, (index) {
            //         return livingRoom[index];
            //       }),
            //     ),
            //   );
            // } else if (tabController.index == 2) {
            //   return SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Wrap(
            //       direction: Axis.horizontal,
            //       spacing: 15,
            //       runSpacing: 15,
            //       children: List.generate(room.length, (index) {
            //         return room[index];
            //       }),
            //     ),
            //   );
            // } else if (tabController.index == 3) {
            //   return SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Wrap(
            //       direction: Axis.horizontal,
            //       spacing: 15,
            //       runSpacing: 15,
            //       children: List.generate(bathroom.length, (index) {
            //         return bathroom[index];
            //       }),
            //     ),
            //   );
            // } else if (tabController.index == 4) {
            //   return SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: Wrap(
            //       direction: Axis.horizontal,
            //       spacing: 15,
            //       runSpacing: 15,
            //       children: List.generate(yard.length, (index) {
            //         return yard[index];
            //       }),
            //     ),
            //   );
            // }
            else {
              return Container();
            }
          }),
        ),
      ],
    );
  }
}
