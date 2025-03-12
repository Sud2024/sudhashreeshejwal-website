import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  final GlobalKey featuredAboutMeKey;
  const AboutMe({super.key, required this.featuredAboutMeKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF171717),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      key: featuredAboutMeKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About Me",
            style: GoogleFonts.nunito(
              color: const Color(0xFFFFFFFF),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: 5,
            color: const Color(0xFF2563EB),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCard(
                "Who I Am?",
                "I am a passionate and dedicated software developer with a strong focus on building innovative solutions and user-friendly applications. With experience in multiple programming languages, including Java, Kotlin, Flutter, and Android, I specialize in creating robust and scalable systems. I have a proven track record of working on diverse projects, ranging from mobile applications to backend development and cloud integrations. Currently, as a Product Manager at Pletox, I oversee product development, guiding teams to deliver high-quality products tailored to client needs. My expertise extends to working with cross-functional teams to deliver ERP, CRM, and HRM-based solutions that enhance business efficiency. Beyond my technical skills, I am constantly learning and challenging myself to stay ahead of industry trends. My aim is to continue creating impactful solutions that drive both user satisfaction and business growth.",
                cardColor: const Color(0xFF1E1E1E),
                borderColor: const Color(0xFF353535),
              ),
              const SizedBox(height: 20),
              _buildCard(
                "What I Do?",
                "I specialize in building innovative and scalable solutions for both mobile and web platforms. From crafting seamless user experiences with Flutter and Android to designing robust backend systems, I ensure that every aspect of a project works harmoniously. I have experience with APIs, cloud integrations, and developing custom solutions that meet business needs. Whether it's leading product development as a Product Manager or writing code as a Software Developer, I focus on delivering high-quality products.",
                cardColor: const Color(0xFF1E1E1E),
                borderColor: const Color(0xFF353535),
              ),
              const SizedBox(height: 20),
              _buildCardWithBullets(
                "My Approach",
                [
                  "I believe in a user-centered approach to development.",
                  "I begin by understanding the problems that users face, and then work collaboratively with teams to design, develop, and test solutions that solve these problems.",
                  "I emphasize clear communication, transparency, and iteration throughout the process to ensure that the end product aligns with the vision and delivers real value.",
                  "My technical expertise combined with a strong focus on user experience allows me to create intuitive, functional, and engaging applications.",
                ],
                cardColor: const Color(0xFF1E1E1E),
                borderColor: const Color(0xFF353535),
              ),
              const SizedBox(height: 20),
              _buildCard(
                "Current Focus",
                "Currently, I am focused on optimizing and scaling products at Pletox. As a Product Manager, I work closely with cross-functional teams to enhance our ERP, CRM, and HRM solutions. I am exploring new ways to leverage AI and automation to improve business processes and empower our users. In addition, I am always learning new tools and technologies to stay ahead of the curve and continue building solutions that drive innovation and business growth.",
                cardColor: const Color(0xFF1E1E1E),
                borderColor: const Color(0xFF353535),
              ),
            ],
          ),
          const SizedBox(height: 40),
          // Info Boxes (in a row, responsive)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: _buildInfoBox(
                  "Projects Completed",
                  "10+",
                  cardColor: const Color(0xFF1E1E1E),
                  borderColor: const Color(0xFF353535),
                  borderWidth: 3.0,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: _buildInfoBox(
                  "Years Experience",
                  "2+",
                  cardColor: const Color(0xFF1E1E1E),
                  borderColor: const Color(0xFF353535),
                  borderWidth: 2.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String description,
      {Color? cardColor, Color? borderColor}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor ?? Colors.black54,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              color: const Color(0xFF1E1E1E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.nunito(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardWithBullets(String title, List<String> bulletPoints,
      {Color? cardColor, Color? borderColor}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor ?? Colors.black54,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.nunito(
              color: const Color(0xFFCACACA),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bulletPoints
                .map(
                  (point) => Row(
                    children: [
                      const Icon(Icons.check,
                          color: Color(0xFF2563EB), size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          point,
                          style: GoogleFonts.nunito(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String label, String value,
      {Color? cardColor, Color? borderColor, double borderWidth = 2.0}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor ?? Colors.black54,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.nunito(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.nunito(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
