import 'package:flutter/material.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect if the app is in dark mode
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // This is where your API data will eventually go
    final List<Map<String, String>> exams = [
      {
        "title": "Blood Count Test",
        "hospital": "Central Hospital • Room 302",
        "time": "Today, 08:30 AM"
      },
      {
        "title": "Chest X-Ray",
        "hospital": "Diagnostic Center • 2nd Floor",
        "time": "Friday, 10:00 AM"
      },
      {
        "title": "General Checkup",
        "hospital": "Family Clinic • Wing A",
        "time": "Feb 12, 09:00 AM"
      },
    ];

    return Scaffold(
      // Subtle background color difference for a clean look
      backgroundColor: isDark ? const Color(0xFF18191D) : const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Scheduled Exams",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              "UPCOMING EXAMS",
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white38 : Colors.black38,
              ),
            ),
          ),
          // Dynamic List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return _buildExamBubble(
                  isDark,
                  title: exam["title"]!,
                  subtitle: exam["hospital"]!,
                  time: exam["time"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExamBubble(
    bool isDark, {
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        // Material wrapper provides the Inkwell ripple effect
        color: isDark ? const Color(0xFF24262C) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Action when the user taps the exam bubble
            print("Tapped on $title");
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[200]!,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white54 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                // Time "Pill" Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.blueAccent.withOpacity(0.1)
                        : const Color(0xFFF0F7FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.blueAccent[100] : Colors.blueAccent[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}