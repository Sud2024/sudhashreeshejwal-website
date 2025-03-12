import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class Experience extends StatefulWidget {
  final GlobalKey featuredExperienceKey;
  const Experience({super.key, required this.featuredExperienceKey});
  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  void downloadResume() {
    final String url = 'assets/resume.pdf';
    html.AnchorElement(href: url)
      ..setAttribute('download', 'CV_Sudhashree Shejwal.pdf')
      ..click();  // ✅ Triggers the download
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Container(
      color: const Color(0xFF171717),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      key: widget.featuredExperienceKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Professional Experience",
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 120,
            height: 4,
            color: const Color(0xFF2563EB),
          ),
          const SizedBox(height: 40),

          Stack(
            children: [
              if (!isMobile)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: screenWidth / 2 - 1,
                  child: Container(width: 2, color: Color(0xFF2F2F2F)),
                ),
              Column(
                children: [
                  buildTimelineCard(
                    "Product Manager | Flutter Developer", "Pletox", "October 2024 - Present",
                    [
                      "Transitioned from Software Developer to Product Manager, streamlining product development and customization.",
                      "Defined product roadmaps to enhance ERP, CRM, and HRM solutions in alignment with client needs.",
                      "Spearheaded cross-functional collaboration, ensuring smooth coordination between development, design, and deployment teams.",
                      "Reduced time-to-market for product updates by optimizing workflow efficiency and team communication.",
                      "Designed Flutter app interfaces to improve UI/UX, boosting user engagement and retention.",
                      "Conducted usability testing and gathered client feedback to drive data-driven product enhancements.",
                      "Led efforts to improve software scalability, ensuring seamless deployment across multiple clients.",
                      "Implemented Agile methodologies for sprint planning, backlog management, and continuous product iteration.",
                    ],
                    isLeftAligned: true, showDot: !isMobile,
                  ),
                  buildTimelineCard(
                    "Software Developer", "StandardWings Technologies", "January 2023 - May 2024",
                    [
                      "Developed a mobile app displaying real-time bed availability for indigent and weaker sections, improving accessibility.",
                      "Implemented SigFox-based sewage level monitoring alerts for African authorities, aiding in public health initiatives.",
                      "Designed and integrated Flutter apps with backend data, leveraging state management libraries (Bloc, GetX, etc.).",
                      "Engineered an IoT-based child monitoring system with geofencing for enhanced parental control.",
                      "Designed an intuitive UI for device setup and geofence management, simplifying user adoption.",
                      "Integrated a robust push notification system for instant alerts on child location updates.",
                      "Conducted R&D on Firebase CLI and push notification integration for mobile and Windows applications.",
                      "Optimized app performance by researching and implementing lightweight libraries for fitness data tracking.",
                      "Ensured seamless hardware-software integration by collaborating closely with IoT and backend teams.",
                    ],
                    isLeftAligned: false, showDot: !isMobile,
                  ),
                  buildTimelineCard(
                    "IT Operations Executive", "Shreeyash Agro", "October 2021 - December 2022",
                    [
                      "Streamlined business operations by optimizing product, delivery, inventory, and sales management",
                      "Reduced time consumption by 30% through automation and process improvement strategies",
                      "Customized and enhanced the front end of the website and Android app to improve customer experience.",
                      "Provided strategic IT solutions to increase operational efficiency and minimize manual workload.",
                    ],
                    isLeftAligned: true, showDot: !isMobile,
                  ),
                  buildTimelineCard(
                    "Junior Developer", "Engeniuspark Technologies LLP", "February 2021 - August 2021",
                    [
                      "Developed the front end of a toy-selling website for children, integrating Google Fonts for better visual appeal.",
                      "Helped increase revenue by over 5% through UI improvements and optimized user flows.",
                      "Leveraged Angular to enhance website performance and scalability.",
                      "Ensured responsive design and seamless user experience across multiple devices.",
                    ],
                    isLeftAligned: false, showDot: !isMobile,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF262626),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Color(0xFF3C3C3C), width: 2),
              ),
            ),
            onPressed: downloadResume,
            child: const Text(
              "Download Resume",
              style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimelineCard(
      String title, String company, String duration, List<String> descriptions,
      {required bool isLeftAligned, required bool showDot}) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double cardWidth = isMobile ? screenWidth * 0.9 : 350;
    double linePosition = screenWidth / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : (isLeftAligned ? MainAxisAlignment.start : MainAxisAlignment.end),
            children: [
              if (!isMobile && isLeftAligned) SizedBox(width: linePosition - cardWidth - 30),
              Container(
                width: cardWidth,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(company, style: TextStyle(color: const Color(0xFF3B81F5), fontSize: 14)),
                    const SizedBox(height: 8),
                    Text(duration, style: const TextStyle(color: Color(0xFFA3A3A3), fontSize: 12)),
                    const SizedBox(height: 16),
                    ...descriptions.map((desc) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• ", style: TextStyle(color: Color(0xFFD4D4D4))),
                          Expanded(child: Text(desc, style: const TextStyle(color: Color(0xFFCFCFCF)))),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              if (!isMobile && !isLeftAligned) SizedBox(width: linePosition - cardWidth - 60),
            ],
          ),
          if (showDot)
            Positioned(
              left: linePosition - 5,
              child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF2563EB), shape: BoxShape.circle)),
            ),
        ],
      ),
    );
  }
}
