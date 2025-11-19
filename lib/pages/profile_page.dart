import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pas_mobile_11pplg2_17/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove("username"); // hapus username
  //   await prefs.remove("password"); // hapus pw
  //   Get.offAllNamed(AppRoutes.SplashscreenPage); // balik ke splash
    
  // }
  Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.remove("token");
  await prefs.remove("username");

  Get.offAllNamed(AppRoutes.splashScreenPage);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.teal),
            const SizedBox(height: 20),
            const Text("Username: admin"),
            const Text("Email: admin@example.com"),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: logout, child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:tes_flutter/controllers/auth_controller.dart';

// class ProfilePage extends StatelessWidget {
//   final User? user = FirebaseAuth.instance.currentUser;
//   final AuthController authController = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profil Saya"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               authController.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: user == null
//             ? const Text("Tidak ada data pengguna.")
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Foto profil
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: user!.photoURL != null
//                         ? NetworkImage(user!.photoURL!)
//                         : const AssetImage('assets/default_avatar.png')
//                             as ImageProvider,
//                   ),
//                   const SizedBox(height: 20),

//                   // Nama pengguna
//                   Text(
//                     user!.displayName ?? "Tanpa Nama",
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   ),

//                   // Email
//                   Text(
//                     user!.email ?? "Tidak ada email",
//                     style: const TextStyle(fontSize: 16, color: Colors.grey),
//                   ),

//                   const SizedBox(height: 40),
//                   ElevatedButton.icon(
//                     icon: const Icon(Icons.logout),
//                     label: const Text("Logout"),
//                     onPressed: () {
//                       authController.signOut();
//                     },
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
