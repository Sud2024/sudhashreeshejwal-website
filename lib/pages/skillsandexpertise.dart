import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Skillsandexpertise extends StatelessWidget {
  final GlobalKey featuredSkillsAndExpertiseKey;
  const Skillsandexpertise({super.key, required this.featuredSkillsAndExpertiseKey});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView( // Ensures scrolling if content overflows
      child: Container(
        color: const Color(0xFF171717), // Slightly lighter background for visibility
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          key: featuredSkillsAndExpertiseKey,
          children: [
            Text(
              "Skills and Expertise",
              style: GoogleFonts.nunito(
                color: const Color(0xFFFFFFFF),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Container(
              width: screenWidth * 0.2,
              height: 5,
              color: const Color(0xFF2563EB),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 500; // Lowered from 600
                  return isWideScreen
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSkillCard('Frameworks', {
                        'Android': 70,
                        'Flutter': 70,
                      }),
                      const SizedBox(width: 10),
                      buildSkillCard('Languages', {
                        'Java': 50,
                        'Advanced Java': 50,
                        'Dart': 65,
                      }),
                      const SizedBox(width: 10),
                      buildSkillCard('Databases & Version Control', {
                        'MySQL': 55,
                        'Git': 70,
                      }),
                    ],
                  )
                      : Column( // Removed Expanded inside Column
                    children: [
                      buildSkillCard('Frameworks', {
                        'Android': 70,
                        'Flutter': 70,
                      }),
                      const SizedBox(height: 10),
                      buildSkillCard('Languages', {
                        'Java': 50,
                        'Advanced Java': 50,
                        'Dart': 65,
                      }),
                      const SizedBox(height: 10),
                      buildSkillCard('Databases & Version Control', {
                        'MySQL': 55,
                        'Git': 70,
                      }),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                buildFeatureButton('Flutter Development'),
                buildFeatureButton('Android Development'),
                buildFeatureButton('UI/UX Design'),
                buildFeatureButton('State Management (Bloc, GetX, Provider)'),
                buildFeatureButton('Backend Integration'),
                buildFeatureButton('IoT & Embedded Systems'),
                buildFeatureButton('AI & Automation'),
                buildFeatureButton('Performance Optimization'),
                buildFeatureButton('Project Management'),
                buildFeatureButton('Deployment'),
                buildFeatureButton('Quality Assurance'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkillCard(String title, Map<String, double> skills) {
    return Container(
      width: 300, // Added a fixed width to prevent shrinking in mobile view
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF323232),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10), // Added border for visibility
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...skills.entries.map((entry) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.key,
                  style: const TextStyle(color: Color(0xFFCCCCCC), fontSize: 14),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: entry.value / 100,
                  color: const Color(0xFF2563EB),
                  backgroundColor: const Color(0xFF404040),
                ),
                const SizedBox(height: 4),
                Text(
                  "${entry.value.toInt()}%",
                  style: const TextStyle(color: Color(0xFF2563EB), fontSize: 12),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget buildFeatureButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF353535),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),
      ),
    );
  }
}