import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedProjects extends StatelessWidget {
  final GlobalKey featuredProjectsKey;
  const FeaturedProjects({super.key, required this.featuredProjectsKey});

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF171717),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      key: featuredProjectsKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: const Text(
              "Featured Projects",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(width: 120, height: 4, color: Colors.blue),
          const SizedBox(height: 40),

          // Responsive Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 800 ? 3 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: projectList.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: projectList[index]);
                },
              );
            },
          ),

          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => _launchURL("https://github.com/Sud2024"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            ),
            child: const Text(
              "View All Projects",
              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        color: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Preview (Local Asset Image)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: project.imagePath == null
                      ? const Center(
                          child: Icon(Icons.auto_awesome,
                              color: Colors.blueAccent, size: 72),
                        )
                      : Image.asset(project.imagePath!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity),
                ),
              ),
              const SizedBox(height: 12),
              // Selectable Project Title
              SelectableText(
                project.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),

              // Selectable Project Description
              SelectableText(
                project.description,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 8),

              // Selectable Technology Chips
              Wrap(
                spacing: 8,
                children: project.technologies
                    .map((tech) => Chip(
                          label: SelectableText(tech),
                          backgroundColor: Colors.blue.shade800,
                          labelStyle: const TextStyle(color: Colors.white),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 12),

              // View Project Button and External Icon (only if hasAccess is true)
              if (project.hasAccess)
                Row(
                  children: [
                    TextButton(
                      onPressed: () => _launchURL(project.projectUrl),
                      child: const Text(
                        "View Project",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => _launchURL(project.projectUrl),
                      icon: const Icon(Icons.open_in_new, color: Colors.blue),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Function to launch URL
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }
}

// Project Model (Updated with imagePath)
class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final bool hasAccess;
  final String projectUrl;
  final String? imagePath;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.hasAccess,
    required this.projectUrl,
    this.imagePath,
  });
}

// Product and product-management assignments.
const List<Project> projectList = [
  Project(
    title: "My Portfolio",
    description:
        "The My Portfolio website showcases your skills, experience, and projects, providing a professional online presence to highlight your expertise and work.",
    technologies: ["Framework: Flutter", "Language: Dart"],
    hasAccess: true,
    projectUrl: "https://github.com/Sud2024/sudhashreeshejwal-website",
    imagePath: "assets/myportfolio.webp",
  ),
  Project(
    title: "Zomato: Engagement & Retention Strategy",
    description: "A Tier-1 city strategy using OKRs, a retained-ordering north-star metric, funnel analysis, personalization, frictionless checkout, delivery reliability, and loyalty initiatives.",
    technologies: ["Product Strategy", "OKRs", "Funnel Analysis"],
    hasAccess: false,
    projectUrl: "",
  ),
  Project(
    title: "Swiggy: Scheduled Orders Adoption",
    description: "A first-principles and JTBD analysis of why users prefer instant ordering, with product improvements that combine certainty, flexibility, progress visibility, and on-time assurance.",
    technologies: ["First Principles", "JTBD", "UX Research"],
    hasAccess: false,
    projectUrl: "",
  ),
  Project(
    title: "Zepto: Increasing Average Order Value",
    description: "A segmentation and root-cause analysis of basket growth, followed by bundle purchases, tier rewards, personalized recommendations, smart refills, and RICE prioritization.",
    technologies: ["Segmentation", "RICE", "Growth Strategy"],
    hasAccess: false,
    projectUrl: "",
  ),
  Project(
    title: "WhatsApp: Local Service Discovery",
    description: "A product discovery and market research study exploring trusted, community-driven local service discovery within WhatsApp groups and neighborhood networks.",
    technologies: ["Market Research", "Competitor Analysis", "User Interviews"],
    hasAccess: false,
    projectUrl: "",
  ),
  Project(
    title: "Smart Weekly Meal Planner",
    description: "A functional prototype for busy professionals that generates personalized weekly meal plans, supports meal swapping, and creates grocery lists from available ingredients.",
    technologies: ["User Flows", "Prototype", "Usability Feedback"],
    hasAccess: true,
    projectUrl: "https://meal-spark-pro.lovable.app/",
  ),
  Project(
    title: "VitaFit Engage+",
    description: "An engagement and retention initiative combining streaks, XP, rewards, community challenges, and social motivation for working professionals and Gen Z users.",
    technologies: ["Engagement", "Retention", "Execution Plan"],
    hasAccess: false,
    projectUrl: "",
  ),
  Project(
    title: "ConnectEU: Product Requirements & System Design",
    description: "An MVP specification for a privacy-first EU social platform covering functional requirements, GDPR, data models, APIs, architecture, security, and scalability.",
    technologies: ["PRD", "System Design", "GDPR"],
    hasAccess: false,
    projectUrl: "",
  ),
];
