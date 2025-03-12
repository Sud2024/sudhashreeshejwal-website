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
                  child: Image.asset(
                    project.imagePath, // Load from local assets
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          "Image Not Found",
                          style: TextStyle(color: Colors.white54),
                        ),
                      );
                    },
                  ),
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
  final String imagePath; // New field for local images

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.hasAccess,
    required this.projectUrl,
    required this.imagePath,
  });
}

// Example Projects with Local Image Paths
const List<Project> projectList = [
  Project(
    title: "National Health Mission",
    description: "The National Health Mission (NHM) Project aimed to enhance healthcare accessibility by digitizing patient records, tracking immunization, and improving service efficiency through a mobile/web application.",
    technologies: ["Framework: Flutter", "Language: Dart"],
    hasAccess: false,
    projectUrl: "",
    imagePath: "assets/nhm.png", // Local image path
  ),
  Project(
    title: "LockBand",
    description:
        "The Lockband Project focused on developing a secure, smart wearable device for authentication and access control, enhancing security through seamless digital verification.",
    technologies: ["Framework: Android", "Language: Java"],
    hasAccess: false,
    projectUrl: "",
    imagePath: "assets/lockband.png",
  ),
  Project(
    title: "My Portfolio",
    description:
        "The My Portfolio website showcases your skills, experience, and projects, providing a professional online presence to highlight your expertise and work.",
    technologies: ["Framework: Flutter", "Language: Dart"],
    hasAccess: true,
    projectUrl: "https://github.com/Sud2024/CRUD-Operations",
    imagePath: "assets/myportfolio.webp",
  ),
];
