import 'package:flutter/material.dart';
import 'package:nmit_hacks2/screens/explore.dart';
import 'package:nmit_hacks2/screens/home.dart';
import 'package:nmit_hacks2/screens/profile.dart';
import 'package:nmit_hacks2/screens/show_map.dart';
import 'package:nmit_hacks2/screens/upload.dart';

import '../values/colors.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({Key? key}) : super(key: key);

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

class _HomeBaseState extends State<HomeBase> {

  int _selectedIndex = 0;
  final PageController pageController = PageController();

  void selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg_img.png"),
                  fit: BoxFit.cover,
                ),
              ),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: selectPage,
              controller: pageController,
              children: const [
                Home(),
                Explore(),
                ShowMap(),
                Upload(),
                Profile(uid: '123abc',),
              ],
            ),
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: selectPage,
        selectedItemColor: Colors.indigo[500],
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: bgColor,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Icon(Icons.home_outlined, color: Colors.black, size: 25,),
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.local_fire_department_outlined),
              activeIcon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Icon(Icons.local_fire_department_outlined, color: Colors.black, size: 25,),
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.location_on_outlined),
              activeIcon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Icon(Icons.location_on_outlined, color: Colors.black, size: 25,),
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add_circle_outline),
              activeIcon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Icon(Icons.add_circle_outline, color: Colors.black, size: 25,),
              ),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_sharp),
              activeIcon: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: const Icon(Icons.person_outline_sharp, color: Colors.black, size: 25,),
              ),
              label: ""
          ),
        ],
      ),
    );
  }
}
