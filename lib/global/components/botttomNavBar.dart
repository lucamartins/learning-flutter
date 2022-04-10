import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/router_provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        currentIndex: context.watch<RouterProvider>().curIndex,
        backgroundColor: Colors.blue,
        fixedColor: Colors.amber,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fire_extinguisher_rounded),
            label: 'Chuck Norris',
          ),
        ],
        onTap: (index) => context.read<RouterProvider>().changePage(index),
      ),
    );
  }
}
