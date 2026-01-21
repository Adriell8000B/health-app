import 'package:flutter/material.dart';
import 'package:health/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _faceIdEnabled = false;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Settings", 
          style: TextStyle(color: isDark ? Colors.white : Colors.black87)
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: isDark ? Colors.white : Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          _buildSectionHeader("Account", isDark),
          _buildSettingsTile(
            isDark,
            title: "Profile Information",
            subtitle: "Name, Email, and Medical ID",
            icon: Icons.person_outline,
            iconColor: Colors.blueAccent,
          ),
          const SizedBox(height: 12),
          _buildSettingsTile(
            isDark,
            title: "Insurance Card",
            subtitle: "Digital copy of your health card",
            icon: Icons.badge_outlined,
            iconColor: Colors.orangeAccent,
          ),

          const SizedBox(height: 32),
          _buildSectionHeader("Preferences", isDark),

          _buildToggleTile(
            isDark,
            title: "Dark Theme",
            subtitle: "Switch between light and dark mode",
            icon: Icons.dark_mode_outlined,
            iconColor: Colors.purpleAccent,
            value: ThemeManager.themeModeNotifier.value == ThemeMode.dark,
            onChanged: (isDarkToggle) {
              setState(() {
                ThemeManager.themeModeNotifier.value = isDarkToggle
                    ? ThemeMode.dark
                    : ThemeMode.light;
              });
            },
          ),
          const SizedBox(height: 12),

          _buildToggleTile(
            isDark,
            title: "Biometric Login",
            subtitle: "Secure app with Face ID/Fingerprint",
            icon: Icons.fingerprint,
            iconColor: Colors.cyanAccent,
            value: _faceIdEnabled,
            onChanged: (val) => setState(() => _faceIdEnabled = val),
          ),

          const SizedBox(height: 32),
          _buildSectionHeader("Support", isDark),
          _buildSettingsTile(
            isDark,
            title: "Help Center",
            subtitle: "FAQ and Contact Support",
            icon: Icons.help_outline,
            iconColor: Colors.greenAccent,
          ),
          const SizedBox(height: 12),
          _buildSettingsTile(
            isDark,
            title: "Privacy Policy",
            subtitle: "How we protect your medical data",
            icon: Icons.lock_outline,
            iconColor: Colors.grey,
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

  Widget _buildSettingsTile(bool isDark, {
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
          Icon(Icons.arrow_forward_ios, size: 14, color: isDark ? Colors.white24 : Colors.black26),
        ],
      ),
    );
  }

  Widget _buildToggleTile(bool isDark, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required bool value,
    required ValueChanged<bool> onChanged,
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: iconColor.withValues(alpha: 0.3),
            activeThumbColor: iconColor,
          ),
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