import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/controllers/mainmenu_controller.dart';


class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});

  // MainmenuController mainmenuController = Get.put(MainmenuController());
  final mainmenuController = Get.find<MainmenuController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text("TV Maze Shows")),
        body: mainmenuController.pages[mainmenuController.selectedIndex.value],
bottomNavigationBar: BottomNavigationBar(
  
  onTap: mainmenuController.changePage,
  currentIndex: mainmenuController.selectedIndex.value,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.table_chart_outlined),
      label: "Table",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: "Bookmarks",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: "Profile",
    ),
  ],
),

      ),
    );
  }
}