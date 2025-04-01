import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/common/portfoiliolisttile.dart';
import 'package:myportfolio/common/textbutton.dart';
import 'package:myportfolio/pages/aboutmepage.dart';
import 'package:myportfolio/pages/bottomline.dart';
import 'package:myportfolio/pages/educationbackground.dart';
import 'package:myportfolio/pages/experiencepage.dart';
import 'package:myportfolio/pages/featuredprojects.dart';
import 'package:myportfolio/pages/footer.dart';
import 'package:myportfolio/pages/homepage.dart';
import 'package:myportfolio/pages/letsconnect.dart';
import 'package:myportfolio/pages/skillsandexpertise.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final ScrollController _scrollController = ScrollController();
  var percentage = 0.0;

  final GlobalKey featuredProjectsKey = GlobalKey();
  final GlobalKey featuredHomeKey = GlobalKey();
  final GlobalKey featuredAboutMeKey = GlobalKey();
  final GlobalKey featuredSkillsAndExpertiseKey = GlobalKey();
  final GlobalKey featuredExperienceKey = GlobalKey();
  final GlobalKey featuredLetsConnectKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollProgress);
  }

  void _updateScrollProgress() {
    if (!_scrollController.hasClients ||
        _scrollController.position.maxScrollExtent == 0) {
      setState(() {
        percentage = 0.0;
      });
      return;
    }
    setState(() {
      percentage = _scrollController.position.pixels /
          _scrollController.position.maxScrollExtent;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollProgress);
    _scrollController.dispose(); // Dispose controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 2),
              Text(
                "My Portfolio",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: screenWidth > 800
            ? [
                // Show the buttons in the app bar for larger screens
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    spacing: 5,
                    children: [
                      CustomTextButton(
                          text: "Home",
                          icon: Icons.home_outlined,
                          onPressed: () {
                            Scrollable.ensureVisible(
                              featuredHomeKey.currentContext!,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          }),
                      CustomTextButton(
                          text: "About",
                          icon: Icons.info_outline,
                          onPressed: () {
                            Scrollable.ensureVisible(
                              featuredAboutMeKey.currentContext!,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          }),
                      CustomTextButton(
                        text: "Projects",
                        icon: Icons.business_center,
                        onPressed: () {
                          Scrollable.ensureVisible(
                            featuredProjectsKey.currentContext!,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      CustomTextButton(
                        text: "Skills",
                        icon: Icons.school_outlined,
                        onPressed: () {
                          Scrollable.ensureVisible(
                            featuredSkillsAndExpertiseKey.currentContext!,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      CustomTextButton(
                        text: "Experience",
                        icon: Icons.history_edu,
                        onPressed: () {
                          Scrollable.ensureVisible(
                            featuredExperienceKey.currentContext!,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      CustomTextButton(
                        text: "Contact",
                        icon: Icons.mail_outline,
                        onPressed: () {
                          Scrollable.ensureVisible(
                            featuredLetsConnectKey.currentContext!,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ]
            : null,
      ),
      drawer: screenWidth <= 800
          ? Drawer(
              backgroundColor: Colors.black45,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  PortfolioListTile(
                    icon: Icons.home_outlined,
                    title: "Home",
                    onTap: () {
                      // Handle navigation
                      Scrollable.ensureVisible(
                        featuredHomeKey.currentContext!,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.info_outline,
                    title: "About",
                    onTap: () {
                      // Handle navigation
                      Scrollable.ensureVisible(
                        featuredAboutMeKey.currentContext!,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.business_center,
                    title: "Projects",
                    onTap: () {
                      // Handle navigation
                      Scrollable.ensureVisible(
                        featuredProjectsKey.currentContext!,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.school_outlined,
                    title: "Skills",
                    onTap: () {
                      Scrollable.ensureVisible(
                        featuredSkillsAndExpertiseKey.currentContext!,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.history_edu,
                    title: "Experience",
                    onTap: () {
                      Scrollable.ensureVisible(
                        featuredExperienceKey.currentContext!,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.mail_outline,
                    title: "Contact",
                    onTap: () {
                      // Handle navigation
                      Scrollable.ensureVisible(
                        featuredLetsConnectKey.currentContext!,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Stack(
        children: [
          // Theme with Scrollbar
          Theme(
            data: Theme.of(context).copyWith(
              scrollbarTheme: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(
                    Colors.blueAccent), // Scrollbar color
                trackColor: WidgetStateProperty.all(
                    Colors.grey[800]), // Background track color
                thickness: WidgetStateProperty.all(8), // Scrollbar width
                radius: Radius.circular(10), // Rounded scrollbar edges
              ),
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 8,
              radius: Radius.circular(10),
              interactive: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Divider(
                      color: const Color(0xFF363636),
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    HomePageWidget(
                      featuredHomeKey: featuredHomeKey,
                      featuredLetsConnectKey: featuredLetsConnectKey,
                      featuredProjectsKey: featuredProjectsKey,
                    ),
                    AboutMe(featuredAboutMeKey: featuredAboutMeKey),
                    FeaturedProjects(featuredProjectsKey: featuredProjectsKey),
                    Skillsandexpertise(
                        featuredSkillsAndExpertiseKey:
                            featuredSkillsAndExpertiseKey),
                    Experience(featuredExperienceKey: featuredExperienceKey),
                    EducationBackground(),
                    // TestimonialsPage(),
                    // BlogsAndInsights(),
                    LetsConnect(featuredLetsConnectKey: featuredLetsConnectKey),
                    FooterSection(
                      featuredAboutMeKey: featuredAboutMeKey,
                      featuredProjectsKey: featuredProjectsKey,
                      featuredSkillsAndExpertiseKey:
                          featuredSkillsAndExpertiseKey,
                    ),
                    Bottomline(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: const Color(0xFF353535),
              color: const Color(0xFF2563EB),
              minHeight: 3, // Adjust height as needed
            ),
          ),
        ],
      ),
    );
  }
}
