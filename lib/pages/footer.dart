import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final GlobalKey featuredAboutMeKey;
  final GlobalKey featuredSkillsAndExpertiseKey;
  final GlobalKey featuredProjectsKey;
  const FooterSection({
    super.key,
    required this.featuredAboutMeKey,
    required this.featuredSkillsAndExpertiseKey,
    required this.featuredProjectsKey,
  });

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
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      color: Color(0xFF171717),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(color: Color(0xFF2F2F2F)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Footer Content
                  isSmallScreen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPortfolioSection(),
                            const SizedBox(height: 20),
                            _buildQuickLinksSection(),
                            const SizedBox(height: 20),
                            _buildContactInfoSection(),
                            const SizedBox(height: 20),
                            // _buildNewsletterSection(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: _buildPortfolioSection()),
                            Expanded(child: _buildQuickLinksSection()),
                            Expanded(child: _buildContactInfoSection()),
                            // Expanded(child: _buildNewsletterSection()),
                          ],
                        ),

                  // Bottom Section
                  const SizedBox(height: 20),
                  Divider(color: Color(0xFF2F2F2F)),
                  const SizedBox(height: 10),
                  isSmallScreen
                      ? Column(
                          children: [
                            Text(
                              "© 2024 Sudhashree Shejwal. All rights reserved.",
                              style: TextStyle(
                                  color: Color(0xFF9E9E9E), fontSize: 12),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     FooterLink(
                            //       text: "Privacy Policy",
                            //       onTap: () {
                            //         print("Privacy Policy Clicked");
                            //       },
                            //     ),
                            //     SizedBox(width: 10),
                            //     FooterLink(
                            //       text: "Terms of Service",
                            //       onTap: () {
                            //         print("Privacy Policy Clicked");
                            //       },
                            //     ),
                            //     SizedBox(width: 10),
                            //     FooterLink(
                            //       text: "Cookies Policy",
                            //       onTap: () {
                            //         print("Privacy Policy Clicked");
                            //       },
                            //     ),
                            //   ],
                            // ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "© 2024 Sudhashree Shejwal. All rights reserved.",
                              style: TextStyle(
                                  color: Color(0xFF9E9E9E), fontSize: 12),
                            ),
                            // Row(
                            //   children: [
                            //     FooterLink(
                            //       text: "Privacy Policy",
                            //       onTap: () {
                            //         print("Privacy Policy Clicked");
                            //       },
                            //     ),
                            //     SizedBox(width: 10),
                            //     FooterLink(
                            //       text: "Terms of Service",
                            //       onTap: () {
                            //         print("Terms and Conditions Clicked");
                            //       },
                            //     ),
                            //     SizedBox(width: 10),
                            //     FooterLink(
                            //       text: "Cookies Policy",
                            //       onTap: () {
                            //         print("Cookies Policy Clicked");
                            //       },
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Portfolio",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Building digital experiences with passion and purpose.",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF9E9E9E),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            IconButton(
              onPressed: () {
                _launchURL("https://www.linkedin.com/in/sudhashree-shejwal/");
              },
              icon: FaIcon(
                FontAwesomeIcons.linkedin,
                color: Color(0xFF9E9E9E),
              ),
            ),
            IconButton(
              onPressed: () {
                _launchURL("https://github.com/Sud2024");
              },
              icon: FaIcon(FontAwesomeIcons.github, color: Color(0xFF9E9E9E)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 10),
        FooterLink(
          text: "About Me",
          onTap: () {
            Scrollable.ensureVisible(
              featuredAboutMeKey.currentContext!,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
        FooterLink(
          text: "Projects",
          onTap: () {
            Scrollable.ensureVisible(
              featuredProjectsKey.currentContext!,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
        FooterLink(
          text: "Skills",
          onTap: () {
            Scrollable.ensureVisible(
              featuredSkillsAndExpertiseKey.currentContext!,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
        ),
        // Bottomline()
      ],
    );
  }

  Widget _buildContactInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Info",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "shejwalsudhashree@gmail.com",
          style: TextStyle(color: Color(0xFF9E9E9E)),
        ),
        const SizedBox(height: 5),
        Text(
          "+918390653000",
          style: TextStyle(color: Color(0xFF9E9E9E)),
        ),
        const SizedBox(height: 5),
        Text(
          "Nashik, Maharashtra",
          style: TextStyle(color: Color(0xFF9E9E9E)),
        ),
      ],
    );
  }

  // Widget _buildNewsletterSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Newsletter",
  //         style: TextStyle(
  //           fontSize: 16,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.white,
  //         ),
  //       ),
  //       const SizedBox(height: 10),
  //       Text(
  //         "Subscribe to my newsletter for updates",
  //         style: TextStyle(color: Colors.white70),
  //       ),
  //       const SizedBox(height: 8),
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white10,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: TextField(
  //           style: TextStyle(color: Colors.white),
  //           decoration: InputDecoration(
  //             hintText: "Enter your email",
  //             hintStyle: TextStyle(color: Colors.white54),
  //             border: InputBorder.none,
  //             contentPadding:
  //             EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //           ),
  //         ),
  //       ),
  //       const SizedBox(height: 10),
  //       ElevatedButton(
  //         onPressed: () {},
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.blue,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //         ),
  //         child: Text("Subscribe"),
  //       ),
  //     ],
  //   );
  // }
}

class FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const FooterLink({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Call the function when tapped
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
        ),
      ),
    );
  }
}
