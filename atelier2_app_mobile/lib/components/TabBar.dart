// ignore_for_file: file_names

import 'package:atelier2_app_mobile/model/User.dart';
import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key? key}) : super(key: key);
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> {
  int _selectedIndex = 0; //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        ///tpm remove in prod
        //User u = User("","","");
        //u.connectDefault();
        
        Navigator.pushNamed(context, '/events');
        break;
      case 1:
        Navigator.pushNamed(context, '/join');
        break;
      case 2:
        Navigator.pushNamed(context, '/connect');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note_rounded),
          label: 'My Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group_add_rounded),
          label: 'Rejoindre un événement',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.visibility_outlined),
          label: 'connect',
        ),
      ],
      currentIndex: _selectedIndex, //New
      onTap: _onItemTapped, //New
    );
  }
}
