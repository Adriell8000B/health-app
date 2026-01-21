import 'package:flutter/material.dart';
import 'package:health/widgets/wappbar.dart';
import 'package:health/widgets/wdrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _categoryScrollController;

  @override
  void initState() {
    super.initState();
    _categoryScrollController = ScrollController(initialScrollOffset: 60.0);
  }

  @override
  void dispose() {
    _categoryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const WAppBar(),
      drawer: const WDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(isDark),
              const SizedBox(height: 24),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87, // Dynamic Title
                ),
              ),
              const SizedBox(height: 12),
              _buildCategoryList(),
              const SizedBox(height: 32),
              Text(
                "Doctors",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87, // Dynamic Title
                ),
              ),
              const SizedBox(height: 12),
              _buildDoctorTile(
                isDark,
                name: "Dr. Peter Parker",
                specialty: "Spider Specialist",
                themeColor: const Color(0xFF1976D2),
                imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
              ),
              const SizedBox(height: 12),
              _buildDoctorTile(
                isDark,
                name: "Dr. Stephen Strange",
                specialty: "Neurologist",
                themeColor: const Color(0xFFFF5252),
                imageUrl: "https://randomuser.me/api/portraits/men/2.jpg",
              ),
              const SizedBox(height: 12),
              _buildDoctorTile(
                isDark,
                name: "Dr. Conors",
                specialty: "Lizard Specialist",
                themeColor: const Color(0xFFFF5252),
                imageUrl: "https://randomuser.me/api/portraits/men/3.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return TextField(
      style: TextStyle(color: isDark ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: isDark ? const Color(0xF724262C) : Colors.grey[200],
        filled: true,
        suffixIcon: const Icon(Icons.search, color: Colors.grey),
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      controller: _categoryScrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryCard(
            color: const Color(0xFF1976D2),
            icon: Icons.coronavirus,
            title: "Covid-19\nSpecialist",
          ),
          const SizedBox(width: 12),
          _buildCategoryCard(
            color: const Color(0xFF00C569),
            icon: Icons.local_pharmacy,
            title: "Chemist &\nDrugist",
          ),
          const SizedBox(width: 12),
          _buildCategoryCard(
            color: const Color(0xFF7A54FF),
            icon: Icons.biotech,
            title: "General\nSurgeon",
          ),
          const SizedBox(width: 12),
          _buildCategoryCard(
            color: const Color(0xFFFF5252),
            icon: Icons.emergency,
            title: "Emergency\nUnit",
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorTile(bool isDark, {
    required String name,
    required String specialty,
    required Color themeColor,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xF724262C) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isDark ? [] : [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 70, width: 70,
            decoration: BoxDecoration(
              color: themeColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.person, size: 35, color: themeColor),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  specialty,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white54 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: isDark ? Colors.white24 : Colors.black26,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required Color color,
    required IconData icon,
    required String title,
  }) {
    return Container(
      height: 120, width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              top: -20, left: -20,
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                radius: 40,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.white, size: 26),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}