import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:netfix/view/downloadpage.dart';
import 'package:netfix/view/homescreen.dart';

import 'package:netfix/view/sreach.dart';

// 🔥 StateProvider for index
final bottomNavProvider = StateProvider<int>((ref) => 0);

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavProvider);

    final List<Widget> pages = [
      Homescreen(),
      Sreach(),
      DownloadPage(),
      
      const Center(child: Text("Movie Page")),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        onTap: (int index) {
          ref.read(bottomNavProvider.notifier).state = index;
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, color: Colors.white, size: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, color: Colors.white, size: 25),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download, color: Colors.white),
            label: 'download',
          ),
         
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
