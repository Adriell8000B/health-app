import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WDrawer extends StatelessWidget {
  const WDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      backgroundColor: isDark ? const Color(0xFF181A20) : Colors.white,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xF724262C)
                    : const Color(0xFFF0F4F8),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color(0xFF1976D2),
                backgroundImage: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%2Fid%2FOIP.AQcNdjwU5teB-FHbX4TBxwHaFj%3Fpid%3DApi&f=1&ipt=6fcd297adc2ca68b3e39c7dd87285bd145d69ef5223acc23c170a22a1d067b8e&ipo=images",
                ),
              ),
              accountName: Text(
                user?.displayName ?? "Hospital Patient",
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              accountEmail: Text(
                user?.email ?? "No email found",
                style: TextStyle(
                  color: isDark ? Colors.grey : Colors.black54,
                  fontSize: 13,
                ),
              ),
            ),

            _buildDrawerItem(
              context,
              icon: Icons.medical_services,
              title: "Services",
              route: "/services",
              isDark: isDark,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.schedule,
              title: "Schedule Exam",
              route: "/register",
              isDark: isDark,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.assignment_turned_in,
              title: "Scheduled exams",
              route: "/records",
              isDark: isDark,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              title: "Settings",
              route: "/settings",
              isDark: isDark,
            ),
            _buildDrawerItem(
              context,
              icon: Icons.info,
              title: "About",
              route: "/about",
              isDark: isDark,
            ),

            Divider(color: isDark ? Colors.white10 : Colors.black12),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    required bool isDark,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1976D2)),
      title: Text(
        title,
        style: TextStyle(color: isDark ? Colors.white : Colors.black87),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
