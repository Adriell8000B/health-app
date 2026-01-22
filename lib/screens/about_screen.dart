import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "About",
          style: TextStyle(color: isDark ? Colors.white : Colors.black87),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: isDark ? Colors.white : Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          _buildSectionHeader("App Information", isDark),
          _buildInfoTile(
            isDark,
            title: "App Name",
            subtitle: "Health",
            icon: Icons.health_and_safety,
            iconColor: Colors.blueAccent,
          ),

          const SizedBox(height: 12,),
          _buildInfoTile(
            isDark,
            title: "Version",
            subtitle: "1.0.0",
            icon: Icons.info_outline,
            iconColor: Colors.greenAccent,
          ),

          const SizedBox(height: 32),

          _buildSectionHeader("Team", isDark),
          _buildInfoTile(
            isDark,
            title: "Developed by",
            subtitle: "Adriell8000B",
            icon: Icons.group,
            iconColor: Colors.orangeAccent,
          ),
          const SizedBox(height: 32),

          _buildSectionHeader("Description", isDark),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "Health is designed to help you manage your health records efficiently, ensuring you and your loved ones are always up-to-date.",
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white70 : Colors.black54,
        ),
      ),
    );
  }

  Widget _buildInfoTile(bool isDark, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xF724262C) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: Colors.grey[200]!),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          _buildIconBubble(icon, iconColor),
          const SizedBox(width: 16),
          Expanded(child: _buildTileText(title, subtitle, isDark)),
        ],
      ),
    );
  }

  Widget _buildIconBubble(IconData icon, Color color) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  Widget _buildTileText(String title, String subtitle, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
      ],
    );
  }
}
