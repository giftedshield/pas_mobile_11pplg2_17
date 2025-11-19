import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/bookmodel.dart';
import 'package:pas_mobile_11pplg2_17/controllers/table_controller.dart';
import 'package:pas_mobile_11pplg2_17/controllers/bookmark_controller.dart'; 
import 'package:pas_mobile_11pplg2_17/pages/bookmark_page.dart'; 

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());
    final bookmarkController = Get.put(BookmarkController());

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
              final Welcome show = controller.tableStandings[index];

              final imageUrl = show.image.original;
              final ratingText = show.rating.average?.toString() ?? '-';
              final genresText = show.genres.map((g) => g.toString().split('.').last).join(', ');

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                        ? NetworkImage(imageUrl)
                        : null,
                  ),
                  title: Text(show.name),
                  subtitle: Text('Rating: $ratingText\n$genresText'),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.bookmark_add_outlined),
                    onPressed: () async {
                      // add to bookmarks and navigate to bookmark page
                      await bookmarkController.addBookmark(show);
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
