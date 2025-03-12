import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EducationBackground extends StatelessWidget {
  const EducationBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Certification> certifications = [
      Certification(title: 'AI Tools Workshop', provider: 'be10x', year: '2025'),
      Certification(title: 'Certified Flutter Development Course', provider: 'Udemy', year: '2023'),
      Certification(title: 'Certified Java Full Stack Development', provider: 'Profound Edutech', year: '2022'),
      Certification(title: 'iOS Beginner Training', provider: 'Code with Chris (Youtuber)', year: '2020'),
      Certification(title: 'Certified ASP.NET developer using C#', provider: 'IANT Institute ', year: '2019'),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: const Color(0xFF171717),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: constraints.maxWidth > 600 ? 32 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildTitle("Education Background"),
                      _buildDivider(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildEducationSection(constraints.maxWidth),
              const SizedBox(height: 20),
              _buildTitle("Additional Certifications"),
              const SizedBox(height: 20),
              _buildCertificationsGrid(constraints.maxWidth, certifications),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(width: 120, height: 4, color: Colors.blue);
  }

  Widget _buildEducationSection(double maxWidth) {
    bool isWideScreen = maxWidth > 800;
    List<Widget> educationCards = _buildEducationCards();

    return isWideScreen
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: educationCards.map((card) => Expanded(child: card)).toList(),
    )
        : Column(children: educationCards);
  }

  List<Widget> _buildEducationCards() {
    return [
      _buildEducationCard(
        title: "Master of Science in Computer Science",
        institution: "Savitribai Phule Pune University",
        duration: "2019 - 2021",
        description: "Gained advanced knowledge in algorithms, AI, distributed systems, cloud computing, and research methodologies.",
        details: ["GPA: 3.32/4.0", "Interned at Engeniuspark Technologies Pvt Ltd", "Developed a project to help COVID patients monitor their temperature."],
        icon: FontAwesomeIcons.graduationCap,
      ),
      _buildEducationCard(
        title: "Bachelor of Science in Computer Science",
        institution: "Savitribai Phule Pune University",
        duration: "2016 - 2019",
        description: "Built a strong foundation in programming, data structures, databases, operating systems, and computer networks.",
        details: ["GPA: 3.0/4.0", "Built a system for students to download receipts after clerks process their forms."],
        icon: FontAwesomeIcons.buildingColumns,
      ),
    ];
  }

  Widget _buildEducationCard({
    required String title,
    required String institution,
    required String duration,
    required String description,
    required List<String> details,
    required IconData icon,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFF353535), width: 2),),
      color: const Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [FaIcon(icon, color: const Color(0xFF3B82F6), size: 28), Text(duration, style: const TextStyle(color: Colors.white54))],
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(institution, style: const TextStyle(color:  Color(0xFF3B82F6), fontSize: 16)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(color:  Color(0xFFCACACA))),
            const SizedBox(height: 8),
            ...details.map((detail) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text("• $detail", style: const TextStyle(color:  Color(0xFF9A9A9A))),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationsGrid(double maxWidth, List<Certification> certifications) {
    int crossAxisCount = maxWidth > 900 ? 4 : maxWidth > 700 ? 3 : maxWidth > 500 ? 2 : 1;
    double childAspectRatio = maxWidth > 800 ? 2.5 : maxWidth > 600 ? 2.0 : 1.8;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: certifications.length,
      itemBuilder: (context, index) {
        return CertificationTile(certification: certifications[index]);
      },
    );
  }
}

class Certification {
  final String title;
  final String provider;
  final String year;

  const Certification({required this.title, required this.provider, required this.year});
}

class CertificationTile extends StatelessWidget {
  final Certification certification;

  const CertificationTile({super.key, required this.certification});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF353535), width: 2),),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: const Color(0xFF1E1E1E),
      child: ListTile(
        title: Text(certification.title, style: const TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(certification.provider, style: const TextStyle(color: Color(0xFFD4D4D4))),
            const SizedBox(height: 4.0),
            Text(certification.year, style: const TextStyle(color:  Color(0xFF3B82F6))),
          ],
        ),
      ),
    );
  }
}
