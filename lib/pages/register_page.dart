import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_17/routes/routes.dart';
import 'package:pas_mobile_11pplg2_17/widgets/widget_button.dart';
import 'package:pas_mobile_11pplg2_17/widgets/widget_textfield.dart';
import '../controllers/register_controller.dart';

class RegisterAPIPage extends StatelessWidget {
  RegisterAPIPage({super.key});

  final controller = Get.find<RegisterAPIController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Using API")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              textEditingController: controller.usernameC,
              labelText: "Username",
              labelColor: Colors.black87,
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 16),
            MyTextField(
              textEditingController: controller.passwordC,
              labelText: "Password",
              labelColor: Colors.black87,
              pass: true,
              isNumber: false,
            ),
            const SizedBox(height: 24),
            MyTextField(
              textEditingController: controller.fullnameC,
              labelText: "Full Name",
              labelColor: Colors.black87,
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 24),
            MyTextField(
              textEditingController: controller.emailC,
              labelText: "Email",
              labelColor: Colors.black87,
              pass: false,
              isNumber: false,
            ),
            const SizedBox(height: 24),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: "Register",
                    textColor: Colors.white,
                    backgroundColor: Colors.blue,
                    onPressed: controller.login,
                  )),
            const SizedBox(height: 24),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: "Login",
                    textColor: Colors.blue,
                    backgroundColor: Colors.white,
                    onPressed: controller.regist,
                  )),
          ],
        ),
      ),
    );
  }
}
