import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/common/portfoiliolisttile.dart';
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
  String _activeSection = "Home";

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

  void _scrollTo(GlobalKey key, String section) {
    setState(() => _activeSection = section);
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildBrand(double screenWidth) {
    final compact = screenWidth < 700;
    final logoSize = compact ? 44.0 : 58.0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: logoSize,
          height: logoSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(compact ? 14 : 18),
            border: Border.all(color: const Color(0xFF0EA5E9), width: 2),
            gradient: const LinearGradient(
              colors: [Color(0xFF07111F), Color(0xFF101B30)],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x330EA5E9),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(Icons.person_outline,
              color: Color(0xFF60A5FA), size: 30),
        ),
        SizedBox(width: compact ? 10 : 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Portfolio",
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: compact ? 18 : 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              "SUDHASHREE",
              style: GoogleFonts.plusJakartaSans(
                color: const Color(0xFF94A3B8),
                fontSize: compact ? 11 : 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.8,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon,
            size: 16,
            color: isActive ? const Color(0xFF60A5FA) : const Color(0xFF94A3B8)),
        label: Text(text),
        style: TextButton.styleFrom(
          foregroundColor:
              isActive ? const Color(0xFF60A5FA) : const Color(0xFFCBD5E1),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          backgroundColor:
              isActive ? const Color(0x1A3B82F6) : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isActive ? const Color(0x334B8DFF) : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConnectButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 8),
      child: OutlinedButton.icon(
        onPressed: () => _scrollTo(featuredLetsConnectKey, "Contact"),
        icon: const Icon(Icons.mail_outline, size: 16),
        label: const Text("Let's Connect"),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF22D3EE), width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        toolbarHeight: screenWidth < 700 ? 74 : 94,
        elevation: 0,
        backgroundColor: const Color(0xF20B0F19),
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xFFCBD5E1)),
        titleSpacing: 26,
        title: _buildBrand(screenWidth),
        actions: screenWidth > 800
            ? [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildNavButton(
                        text: "Home",
                        icon: Icons.home,
                        isActive: _activeSection == "Home",
                        onPressed: () => _scrollTo(featuredHomeKey, "Home"),
                      ),
                      _buildNavButton(
                        text: "About",
                        icon: Icons.info,
                        isActive: _activeSection == "About",
                        onPressed: () => _scrollTo(featuredAboutMeKey, "About"),
                      ),
                      _buildNavButton(
                        text: "Projects",
                        icon: Icons.business_center,
                        isActive: _activeSection == "Projects",
                        onPressed: () =>
                            _scrollTo(featuredProjectsKey, "Projects"),
                      ),
                      _buildNavButton(
                        text: "Skills",
                        icon: Icons.school_outlined,
                        isActive: _activeSection == "Skills",
                        onPressed: () => _scrollTo(
                            featuredSkillsAndExpertiseKey, "Skills"),
                      ),
                      _buildNavButton(
                        text: "Experience",
                        icon: Icons.history_edu,
                        isActive: _activeSection == "Experience",
                        onPressed: () =>
                            _scrollTo(featuredExperienceKey, "Experience"),
                      ),
                      _buildNavButton(
                        text: "Contact",
                        icon: Icons.mail_outline,
                        isActive: _activeSection == "Contact",
                        onPressed: () =>
                            _scrollTo(featuredLetsConnectKey, "Contact"),
                      ),
                    ],
                  ),
                ),
                _buildConnectButton(),
              ]
            : null,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0x1AFFFFFF)),
            ),
          ),
        ),
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
                      _scrollTo(featuredHomeKey, "Home");
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.info_outline,
                    title: "About",
                    onTap: () {
                      _scrollTo(featuredAboutMeKey, "About");
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.business_center,
                    title: "Projects",
                    onTap: () {
                      _scrollTo(featuredProjectsKey, "Projects");
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.school_outlined,
                    title: "Skills",
                    onTap: () {
                      _scrollTo(featuredSkillsAndExpertiseKey, "Skills");
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.history_edu,
                    title: "Experience",
                    onTap: () {
                      _scrollTo(featuredExperienceKey, "Experience");
                      Navigator.pop(context);
                    },
                  ),
                  PortfolioListTile(
                    icon: Icons.mail_outline,
                    title: "Contact",
                    onTap: () {
                      _scrollTo(featuredLetsConnectKey, "Contact");
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
