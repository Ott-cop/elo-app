import 'package:elo/home/menu_home/item_home/device_home_model.dart';
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
    Device banheiro =
        Device(icon: Icons.bathtub, name: 'Banheiro', state: true);
    Device abajur = Device(icon: Icons.lightbulb, name: 'Abajur', state: true);
    Device luzCozinha =
        Device(icon: Icons.wb_incandescent, name: 'Luz Cozinha', state: false);
    Device luzQuarto =
        Device(icon: Icons.wb_incandescent, name: 'Luz Quarto', state: true);
    Device luzSala =
        Device(icon: Icons.wb_incandescent, name: 'Luz Sala', state: false);
    Device garagem = Device(icon: Icons.garage, name: 'Garagem', state: false);
    Device televisao = Device(icon: Icons.tv, name: 'TV Sala', state: false);

    Device irrigador =
        Device(icon: Icons.shower, name: 'Irrigador Quintal', state: false);
    Device luzQuintal =
        Device(icon: Icons.wb_incandescent, name: 'Luz Quintal', state: false);

    general = [
      ItemHome(device: banheiro),
      ItemHome(device: abajur),
      ItemHome(device: luzCozinha),
      ItemHome(device: garagem),
      ItemHome(device: irrigador),
      ItemHome(device: luzQuintal),
      ItemHome(device: luzSala),
      ItemHome(device: televisao),
      ItemHome(device: luzQuarto),
    ];
    livingRoom = [
      ItemHome(device: luzSala),
      ItemHome(device: televisao),
    ];
    room = [
      ItemHome(device: luzQuarto),
      ItemHome(device: abajur),
    ];
    bathroom = [
      ItemHome(device: banheiro),
    ];
    yard = [
      ItemHome(device: luzQuintal),
      ItemHome(device: irrigador),
    ];
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
                    children: List.generate(general.length, (index) {
                      return general[index];
                    })),
              );
            } else if (tabController.index == 1) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(livingRoom.length, (index) {
                    return livingRoom[index];
                  }),
                ),
              );
            } else if (tabController.index == 2) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(room.length, (index) {
                    return room[index];
                  }),
                ),
              );
            } else if (tabController.index == 3) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(bathroom.length, (index) {
                    return bathroom[index];
                  }),
                ),
              );
            } else if (tabController.index == 4) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(yard.length, (index) {
                    return yard[index];
                  }),
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
      ],
    );
  }
}
