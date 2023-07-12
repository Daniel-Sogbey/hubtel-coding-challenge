import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class BottomNavigationBaseScreen extends StatefulWidget {
  const BottomNavigationBaseScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBaseScreen> createState() =>
      _BottomNavigationBaseScreenState();
}

class _BottomNavigationBaseScreenState
    extends State<BottomNavigationBaseScreen> {
  int _pageIndex = 0;

  final _pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black87,
        selectedIconTheme: const IconThemeData(color: Colors.black87, size: 20),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black54,
          size: 20,
        ),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
        ),
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: _pageIndex == 0 ? "" : "Home",
            icon: _pageIndex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pageIndex == 0
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.green[200]!,
                                ),
                                color: Colors.green[200],
                              ),
                              child: Icon(
                                Icons.home_outlined,
                                size: 30,
                                color: Colors.grey[800]!,
                              ),
                            )
                          : Icon(
                              Icons.home_outlined,
                              size: 50,
                              color: Colors.grey[800]!,
                            ),
                      const Text(
                        "|",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                  ),
          ),
          BottomNavigationBarItem(
            label: _pageIndex == 1 ? "" : "Send",
            icon: _pageIndex == 1
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _pageIndex == 1
                    ? Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.green[200]!,
                    ),
                    color: Colors.green[200],
                  ),
                  child: Icon(
                    Icons.send_time_extension_outlined,
                    size: 30,
                    color: Colors.grey[800]!,
                  ),
                )
                    : Icon(
                  Icons.send_time_extension_outlined,
                  size: 50,
                  color: Colors.grey[800]!,
                ),
                const Text(
                  "|",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
                : const Icon(
              Icons.send_time_extension_outlined,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: _pageIndex == 2 ? "" : "History",
            icon: _pageIndex == 2
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _pageIndex == 2
                    ? Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.green[200]!,
                    ),
                    color: Colors.green[200],
                  ),
                  child: Icon(
                    Icons.history,
                    size: 30,
                    color: Colors.grey[800]!,
                  ),
                )
                    : Icon(
                  Icons.history,
                  size: 50,
                  color: Colors.grey[800]!,
                ),
                const Text(
                  "|",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
                : const Icon(
              Icons.history,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: _pageIndex == 3 ? "" : "Scheduled",
            icon: _pageIndex == 3
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _pageIndex == 3
                    ? Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.green[200]!,
                    ),
                    color: Colors.green[200],
                  ),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 30,
                    color: Colors.grey[800]!,
                  ),
                )
                    : Icon(
                  Icons.calendar_today_outlined,
                  size: 50,
                  color: Colors.grey[800]!,
                ),
                const Text(
                  "|",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
                : const Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
