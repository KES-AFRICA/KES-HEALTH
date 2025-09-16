import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kes_health/core/components/custom_toast.dart';
import 'package:kes_health/core/constants/colors.dart';
import 'package:kes_health/pages/sante/data.dart';
import 'package:kes_health/pages/sante/historique-sante/components/cardlist.dart';

@RoutePage()
class RappelsSanteListPage extends StatefulWidget {
  const RappelsSanteListPage({super.key});

  @override
  State<RappelsSanteListPage> createState() => _RappelsSanteListPageState();
}

class _RappelsSanteListPageState extends State<RappelsSanteListPage> {
  final ScrollController _scrollController = ScrollController();

  void _showNotAvailableToast(BuildContext context) {
    CustomToast.warning(
      context: context,
      title: 'Non disponible',
      description: 'Fonctionnalité en cours de développement.',
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'Tous mes rappels santé',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        foregroundColor: AppColors.white,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final reminder = healthReminders[index];
                  return Column(
                    children: [
                      _buildAnimatedReminderItem(reminder, index, context),
                      // Séparateur gris entre les éléments
                      if (index < healthReminders.length - 1)
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                    ],
                  );
                },
                childCount: healthReminders.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedReminderItem(Map<String, String> reminder, int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: 8,
      ),
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 300 + (index * 100)),
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeOut,
        builder: (context, double value, child) {
          return Transform.translate(
            offset: Offset(0, (1 - value) * 20),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: ReminderCard(
          title: reminder['title']!,
          description: reminder['description']!,
          imagePath: reminder['image']!,
          onTap: () => _showNotAvailableToast(context),
          onAppointmentPressed: () => _showNotAvailableToast(context),
        ),
      ),
    );
  }
}