import 'package:flutter/material.dart';
import 'package:tugas_4_tpm_2/pages/helppage.dart';
import 'package:tugas_4_tpm_2/pages/menupage.dart';

const Color _firstColor = Color(0xff77aca2);
const Color _secondColor = Color(0xff031926);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> pages = const [
    MenuPage(),
    HelpPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _mainBody(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        '123200120 - Tugas 4',
        selectionColor: _firstColor,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: _secondColor,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          height: 45,
          width: 45,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5),
        ),
      ),
      actions: const [
        Icon(
          Icons.search,
          color: _firstColor,
        ),
        SizedBox(
          width: 15,
        ),
      ],
      leading: const Icon(
        Icons.menu_sharp,
        color: _firstColor,
      ),
    );
  }

  Widget _mainBody() {
    return SafeArea(
      child: Container(
        color: _firstColor,
        alignment: Alignment.topLeft,
        child: pages[_currentIndex],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: _firstColor,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            color: _firstColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        indicatorShape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: NavigationBar(
        height: 90,
        backgroundColor: _secondColor,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: _secondColor,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: _firstColor,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.help,
              color: _secondColor,
            ),
            icon: Icon(
              Icons.help_outline,
              color: _firstColor,
            ),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
