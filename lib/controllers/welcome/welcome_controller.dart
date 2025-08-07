import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';

class WelcomeController extends GetxController {
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;

  Future<void> handleStartPressed(BuildContext context) async {
    isLoading.value = true;

    try {
      // Simular una carga
      await Future.delayed(const Duration(milliseconds: 1500));

      // Navegar a la página de login usando rutas
      Get.offAllNamed(Routes.login);
    } catch (error) {
      isLoading.value = false;
      hasError.value = true;
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void resetError() {
    hasError.value = false;
    errorMessage.value = '';
  }
}
