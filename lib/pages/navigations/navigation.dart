import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kes_health/pages/accueil/accueil.dart';
import 'package:kes_health/pages/compte/compte.dart';
import 'package:kes_health/pages/messages/messages.dart';
import 'package:kes_health/pages/rendezvous/rendezvous.dart';
import 'package:kes_health/pages/sante/sante.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

@RoutePage()
class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const RendezVousPage(),
    const SantePage(),
    const MessagesPage(),
    const ComptePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
  child: SingleChildScrollView( // Ajout du scroll horizontal
    scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: GNav(
              haptic: true, // feedback haptique
              tabBorderRadius: 35,
              curve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 300),
              gap: 2,
              color: AppColors.darkBlue, // couleur des icônes inactives
              activeColor: Colors.white, // couleur des icônes et texte actifs
              iconSize: 24,
              tabBackgroundColor: AppColors.darkBlue, // fond des onglets actifs
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Accueil',
                ),
                GButton(
                  icon: Icons.calendar_today,
                  text: 'Rendez-vous',
                ),
                GButton(
                  icon: Icons.local_hospital,
                  text: 'Santé',
                ),
                GButton(
                  icon: Icons.mail,
                  text: 'Messages',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Compte',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}