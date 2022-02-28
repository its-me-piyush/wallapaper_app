import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wallapaper_app/constants.dart';
import 'package:wallapaper_app/screens/search/search_screen_widget.dart';
import 'package:wallapaper_app/size_config.dart';

import 'components/home_screen_main_widget.dart';


// ██╗░░██╗░█████╗░███╗░░░███╗███████╗
// ██║░░██║██╔══██╗████╗░████║██╔════╝
// ███████║██║░░██║██╔████╔██║█████╗░░
// ██╔══██║██║░░██║██║╚██╔╝██║██╔══╝░░
// ██║░░██║╚█████╔╝██║░╚═╝░██║███████╗
// ╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝╚══════╝

// ░██████╗░█████╗░██████╗░███████╗███████╗███╗░░██╗
// ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝████╗░██║
// ╚█████╗░██║░░╚═╝██████╔╝█████╗░░█████╗░░██╔██╗██║
// ░╚═══██╗██║░░██╗██╔══██╗██╔══╝░░██╔══╝░░██║╚████║
// ██████╔╝╚█████╔╝██║░░██║███████╗███████╗██║░╚███║
// ╚═════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░╚══╝

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: waBgColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                color: pageIndex == 0 ? waBluishColor : Colors.white,
                size: getProportionateScreenWidth(40),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.compass,
                color: pageIndex == 1 ? waBluishColor : Colors.white,
                size: getProportionateScreenWidth(40),
              ),
              label: '',
            ),
          ]),
      body: IndexedStack(
        children: const [
          HomeScreenMainWidget(),
          SearchScreenMainWidget(),
        ],
        index: pageIndex,
      ),
    );
  }
}
