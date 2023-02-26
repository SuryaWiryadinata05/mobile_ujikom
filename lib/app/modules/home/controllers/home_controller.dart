import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';

import '../../dashboard/views/dashboard_view.dart';
import '../../login/views/login_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  late Timer _pindah;
  final authToken = GetStorage();
  // final count = 0.obs;
  @override
  void onInit() {
    _pindah = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => authToken.read('token') == null
            ? Get.off(
                () => const LoginView(),
                transition: Transition.leftToRight,
              )
            : Get.off(() => const DashboardView()));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pindah.cancel();
    super.onClose();
  }

  // void increment() => count.value++;
}
