import 'package:elo/home/appbar/add_device/create_category.dart';
import 'package:elo/styles/global.dart';
import 'package:flutter/material.dart';

class CreateCategoryPage extends StatefulWidget {
  const CreateCategoryPage({super.key});

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: safeAreaModified(
            child: Column(
              children: [
                Stack(alignment: Alignment.center, children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: returnPage(context: context),
                  ),
                  titleInPages(title: "Criar ", subtitle: "Categoria"),
                ]),
                const SizedBox(
                  height: 30,
                ),
                const Expanded(
                  child: CreateCategory(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
