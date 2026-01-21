import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Hospital Services",
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
          Text(
            "Medical Utilities",
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildServiceTile(context,
            title: "Emergency Care",
            subtitle: "24/7 Rapid Response Unit",
            icon: Icons.emergency,
            iconColor: const Color(0xFFFF5252),
          ),
          const SizedBox(height: 12),
          
          _buildServiceTile(context,
            title: "Lab Reports",
            subtitle: "Download your blood work",
            icon: Icons.description,
            iconColor: const Color(0xFF7A54FF),
          ),
          const SizedBox(height: 12),
          
          _buildServiceTile(context,
            title: "Pharmacy",
            subtitle: "Order prescribed medicine",
            icon: Icons.local_pharmacy,
            iconColor: const Color(0xFF00C569),
          ),
          const SizedBox(height: 12),
          
          _buildServiceTile(context,
            title: "Ambulance",
            subtitle: "Book non-emergency transport",
            icon: Icons.minor_crash,
            iconColor: const Color(0xFF1976D2),
          ),
          const SizedBox(height: 24),

          Text(
            "Information",
            style: TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 16),

          _buildServiceTile(context,
            title: "Insurance Partners",
            subtitle: "View supported providers",
            icon: Icons.shield,
            iconColor: Colors.amber,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTile(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xF724262C) : Colors.grey[100], 
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
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
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark 
                        ? Colors.white.withValues(alpha: 0.5) 
                        : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward_ios, 
              size: 12, 
              color: isDark ? Colors.white54 : Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}