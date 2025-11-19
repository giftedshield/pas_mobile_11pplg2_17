import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/controllers/table_controller.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());

    return Scaffold(
      appBar: AppBar(title: const Text("Shows")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchAPITablePremiere(); 
          },
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), 
            itemCount: controller.tableStandings.length,
            itemBuilder: (context, index) {
              final show = controller.tableStandings[index];
              return Card(
                 child:
          ListTile(
          leading: CircleAvatar(
          // backgroundImage: Image(show.image),
              ),
             title: Text(show.name),
             subtitle: Text(show.summary),
            )

              );
            },
          ),
        );
      }),
    );
  }
}
