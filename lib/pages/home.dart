import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:kml/components/filter.dart';
import 'package:kml/components/job_offer.dart';
import 'package:kml/components/profile_tag.dart';
import 'package:kml/components/search.dart';
import 'package:kml/pages/emp_profile.dart';
import 'package:kml/pages/home_content.dart';
import 'package:kml/pages/inbox.dart';
import 'package:kml/pages/job_offer.dart';
import 'package:kml/theme/borders.dart';
import 'package:kml/theme/colors.dart';
import 'package:kml/theme/fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(subborder)),
          height: 50,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: BottomAppBar(
            child: FlashyTabBar(
              selectedIndex: _selectedIndex,
              showElevation: true,
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                FlashyTabBarItem(
                  icon: Icon(
                    Icons.person,
                    color: maincolor,
                  ),
                  title: Text(
                    'Profile',
                    style: submain,
                  ),
                ),
                FlashyTabBarItem(
                  icon: Icon(
                    Icons.home,
                    color: maincolor,
                  ),
                  title: Text('Home', style: submain),
                ),
                FlashyTabBarItem(
                  icon: Icon(
                    Icons.mail,
                    color: maincolor,
                  ),
                  title: Text('Inbox', style: submain),
                ),
              ],
            ),
          ),
        ),
        body: _selectedIndex == 1
            ? HomeContent()
            : _selectedIndex == 0
                ? EmpProfile()
                : Inbox(),
      ),
    );
  }
}
