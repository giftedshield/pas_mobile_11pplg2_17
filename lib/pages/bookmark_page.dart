import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookmarkController());

    return Scaffold(
      appBar: AppBar(title: const Text("Bookmarks")),
      body: Obx(() {
        if (controller.bookmarks.isEmpty) {
          return const Center(child: Text("Belum ada bookmark"));
        }

        return ListView.builder(
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            final item = controller.bookmarks[index];

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item['badge']),
                ),
                title: Text(item['teamName']),
                subtitle: Text(item['stadium']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteBookmark(item['id']);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
