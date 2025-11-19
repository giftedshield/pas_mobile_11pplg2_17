import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg2_17/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove("token");
    await prefs.remove("username");

    Get.offAllNamed(AppRoutes.splashScreenPage);
  }

  Future<String> _getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("username") ?? "Tidak ada username";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: FutureBuilder<String>(
          future: _getUsername(),
          builder: (context, snapshot) {
            final usernameText = snapshot.connectionState == ConnectionState.waiting
                ? "Loading..."
                : (snapshot.data ?? "Tidak ada username");

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, size: 100, color: Colors.teal),
                const SizedBox(height: 20),
                Text("Username: $usernameText"),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: logout, child: const Text("Logout")),
              ],
            );
          },
        ),
      ),
    );
  }
}
