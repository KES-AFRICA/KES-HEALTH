import 'package:flutter/material.dart';
import 'package:kes_health/pages/accueil/accueil.dart';
import 'package:kes_health/pages/compte/compte.dart';
import 'package:kes_health/pages/messages/messages.dart';
import 'package:kes_health/pages/navigations/components/buildnavItem.dart';
import 'package:kes_health/pages/rendezvous/rendezvous.dart';
import 'package:kes_health/pages/sante/sante.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const RendezVousPage(),
    const SantePage(),
    const MessagesPage(),
    const ComptePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: buildNavItem(Icons.home, "Accueil", 0,_selectedIndex),
             label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(Icons.calendar_today, "Rendez-vous", 1,_selectedIndex),
             label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(Icons.local_hospital, "Santé", 2,_selectedIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(Icons.mail, "Messages", 3,_selectedIndex),
             label: '',
          ),
          BottomNavigationBarItem(
            icon: buildNavItem(Icons.person, "Compte", 4,_selectedIndex),
            label: '',
          ),
        ],
      ),
    );
  }
}
