import 'package:elo/home/appbar/add_device/add_device_button_model.dart';
import 'package:elo/home/menu_home/item_home/create_category_page/create_category_page.dart';
import 'package:elo/home/menu_home/item_home/device_home_model.dart';
import 'package:elo/home/menu_home/item_home/item_home.dart';
import 'package:elo/repositories/categories_home_provider/categories_home_provider.dart';
import 'package:elo/repositories/item_home_repositories/item_home_repositories.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuHomeWidget extends StatefulWidget {
  const MenuHomeWidget({super.key});

  @override
  State<MenuHomeWidget> createState() => _MenuHomeWidgetState();
}

class _MenuHomeWidgetState extends State<MenuHomeWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final itemHomeRepository = Provider.of<ItemHomeRepositories>(context);

    final categoryHome = Provider.of<CategoriesHomeProvider>(context);

    final List<Tab> rooms =
        List.generate(categoryHome.listCategory.length, (index) {
      return Tab(
        text: categoryHome.listCategory[index].name,
      );
    });

    final list = itemHomeRepository.listItems;

    return Scaffold(
      backgroundColor: Global().backgroundColor,
      body: DefaultTabController(
        length: rooms.length,
        initialIndex: 0,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabBar(
                    tabs: rooms,
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton.filled(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CreateCategoryPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(children: [
                ...List.generate(rooms.length, growable: false, (index) {
                  var items = list.toList();
                  List<Device> tabItems = items.where((item) {
                    return item.categoryId ==
                        categoryHome.listCategory[index].id;
                  }).toList();
                  if (index == 0) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          direction: Axis.horizontal,
                          spacing: 15,
                          runSpacing: 15,
                          children: [
                            const AddDeviceButtonModel(),
                            ...List.generate(items.length, growable: false,
                                (item) {
                              // debugPrint("Encontrei!");
                              return ItemHome(
                                  device: Device(
                                id: items[item].id,
                                categoryId: items[item].categoryId,
                                icon: items[item].icon,
                                name: items[item].name,
                                port: items[item].port,
                                state: items[item].state,
                              ));
                            })
                          ],
                        ),
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        direction: Axis.horizontal,
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          const AddDeviceButtonModel(),
                          ...List.generate(tabItems.length, growable: false,
                              (item) {
                            debugPrint("Encontrei!");
                            return ItemHome(
                                device: Device(
                              id: tabItems[item].id,
                              categoryId: tabItems[item].categoryId,
                              icon: tabItems[item].icon,
                              name: tabItems[item].name,
                              port: tabItems[item].port,
                              state: tabItems[item].state,
                            ));
                          })
                        ],
                      ),
                    ),
                  );
                })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
