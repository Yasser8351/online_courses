import 'package:flutter/material.dart';

import 'all_courses.dart';
import 'my_courses.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);
  static const routeName = "TabScreen";

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  DateTime timeBackPressed = DateTime.now();

  final List<Widget> _pages = [
    const AllCourses(),
    const MyCourses(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topCenter,
            child: WillPopScope(
              onWillPop: () async {
                final differenc = DateTime.now().difference(timeBackPressed);
                final exitApp = differenc >= Duration(seconds: 2);

                timeBackPressed = DateTime.now();

                if (exitApp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      duration: const Duration(seconds: 2),
                      content: const Text(
                        "اضغط مرة أخري للخروج",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                  return false;
                } else {
                  return true;
                }
              },
              child: Scaffold(
                body: _pages[_selectIndex],
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectIndex,
                  onTap: _navigateBottomBar,
                  items: const [
                    BottomNavigationBarItem(
                      backgroundColor: Color(0xff2A1B6E),
                      icon: Icon(Icons.video_camera_back),
                      label: 'All Course',
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Color(0xff2A1B6E),
                      icon: Icon(Icons.person),
                      label: 'Your Courses',
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
