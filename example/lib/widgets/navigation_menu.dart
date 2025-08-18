import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/apps_screen.dart';
import '../screens/remotes_screen.dart';
import '../screens/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    
    return Scaffold(
      bottomNavigationBar: Obx(
       () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.apps), label: 'Apps'),
          NavigationDestination(icon: Icon(Iconsax.cloud), label: 'Remotes'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const AppsScreen(),
    const RemotesScreen(),
    const ProfileScreen(),
  ];
}