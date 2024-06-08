import 'package:flutter/material.dart';
import 'package:flutter_diagnosa_penyakit/view/profile/profile_page.dart';

import '../config/app_color.dart';
import '../config/pref.dart';
import 'auth/login_page.dart';
import 'home/home_page.dart';


class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  int _selectedIndex = 0;
  final Session _session = Session();
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
  };

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ProfilePage(),
  ];


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Session().getUserToken(),
      builder: (_, snapshot) {
        String? token = snapshot.data;
        if (token == null) {
          return const LoginPage();
        } else {
          return Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                selectedLabelStyle: fontTextStyle.copyWith(
                    color: AppColor.colorPrimaryBlue,
                    fontWeight: FontWeight.w600),
                unselectedLabelStyle: fontTextStyle.copyWith(
                    color: const Color(0xFF878E97),
                    fontWeight: FontWeight.w600),
                selectedItemColor: AppColor.colorPrimaryBlue,
                unselectedItemColor: const Color(0xFF878E97),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: _selectedIndex == 0
                        ? Image.asset(
                      "assets/ic_home_active.png",
                      width: 27,
                    )
                        : Image.asset(
                      "assets/ic_home_inactive.png",
                      width: 27,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: _selectedIndex == 4
                        ? Image.asset(
                      "assets/ic_profile_active.png",
                      width: 27,
                    )
                        : Image.asset(
                      "assets/ic_profile_inactive.png",
                      width: 27,
                    ),
                    label: "Profile",
                  ),
                ],
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
              ),
            ),
          );
        }
      },
    );

    /*return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: fontTextStyle.copyWith(
              color: AppColor.colorPrimaryBlue,
              fontWeight: FontWeight.w600),
          unselectedLabelStyle: fontTextStyle.copyWith(
              color: const Color(0xFF878E97),
              fontWeight: FontWeight.w600),
          selectedItemColor: AppColor.colorPrimaryBlue,
          unselectedItemColor: const Color(0xFF878E97),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Image.asset(
                "assets/ic_home_active.png",
                width: 27,
              )
                  : Image.asset(
                "assets/ic_home_inactive.png",
                width: 27,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset(
                "assets/ic_profile_active.png",
                width: 27,
              )
                  : Image.asset(
                "assets/ic_profile_inactive.png",
                width: 27,
              ),
              label: "Profile",
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );*/


  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _widgetOptions.elementAt(_selectedIndex));
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
