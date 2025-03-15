import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key, required this.featuredHomeKey, required this.featuredLetsConnectKey, required this.featuredProjectsKey });
  final GlobalKey featuredHomeKey;
  final GlobalKey featuredLetsConnectKey;
  final GlobalKey featuredProjectsKey;
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  final GlobalKey featuredLetsConnectKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Dynamic Sizing
    double titleFontSize = screenWidth > 800
        ? 36
        : screenWidth > 600
            ? 28
            : 24;
    double subtitleFontSize = screenWidth > 800
        ? 24
        : screenWidth > 600
            ? 20
            : 18;
    double buttonFontSize = screenWidth > 800
        ? 16
        : screenWidth > 600
            ? 14
            : 12;
    double buttonPaddingHorizontal = screenWidth > 800
        ? 40
        : screenWidth > 600
            ? 30
            : 20;
    double buttonPaddingVertical = screenWidth > 800
        ? 20
        : screenWidth > 600
            ? 15
            : 12;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 800;

            return Column(
              key: widget.featuredHomeKey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                if (!isWideScreen) // Show image at the top on small screens
                  Column(
                    children: [
                      Container(
                        width: screenWidth * 0.4, // Adjust size for mobile
                        height: screenWidth * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/myself.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                // Layout for large screens
                isWideScreen
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Left Side (Text Content)
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, I'm Sudhashree Shejwal",
                                  style: GoogleFonts.nunito(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Animated Subtitle
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      "Product Manager | Frontend Engineer",
                                      textStyle: GoogleFonts.nunito(
                                        color: const Color(0xFFFAFAFA),
                                        fontSize: subtitleFontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      speed: const Duration(milliseconds: 80),
                                    ),
                                  ],
                                  repeatForever: true,
                                ),

                                const SizedBox(height: 20),

                                // Buttons
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 12,
                                  alignment: WrapAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                          if (widget.featuredLetsConnectKey.currentContext != null) {
                                            Scrollable.ensureVisible(
                                              widget.featuredLetsConnectKey.currentContext!,
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                          } else {
                                            debugPrint("❌ Error: featuredLetsConnectKey context is null");
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF2563EB),
                                        foregroundColor:  const Color(0xFFFFFFFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        textStyle: GoogleFonts.nunito(
                                          fontSize: buttonFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: buttonPaddingHorizontal,
                                          vertical: buttonPaddingVertical,
                                        ),
                                      ),
                                      child: const Text("Get in Touch"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        WidgetsBinding.instance.addPostFrameCallback((_) {
                                          if (widget.featuredProjectsKey.currentContext != null) {
                                            Scrollable.ensureVisible(
                                              widget.featuredProjectsKey.currentContext!,
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeInOut,
                                            );
                                          } else {
                                            debugPrint("❌ Error: featuredProjectsKey context is null");
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF1E1E1E),
                                        foregroundColor: const Color(0xFFFFFFFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: const BorderSide(
                                              color: Color(0xFF4B4B4B), width: 2),
                                        ),
                                        textStyle: GoogleFonts.nunito(
                                          fontSize: buttonFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: buttonPaddingHorizontal,
                                          vertical: buttonPaddingVertical,
                                        ),
                                      ),
                                      child: const Text("View Projects"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Right Side (Image)
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: screenWidth * 0.15,
                                  height: screenWidth * 0.15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/myself.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hello, I'm Sudhashree Shejwal",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Animated Subtitle
                          AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                "Product Manager | Frontend Engineer",
                                textStyle: GoogleFonts.montserrat(
                                  color: Colors.white70,
                                  fontSize: subtitleFontSize,
                                  fontWeight: FontWeight.w400,
                                ),
                                speed: const Duration(milliseconds: 80),
                              ),
                            ],
                            repeatForever: true,
                          ),

                          const SizedBox(height: 20),

                          // Buttons
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            alignment: WrapAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  textStyle: GoogleFonts.montserrat(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: buttonPaddingHorizontal,
                                    vertical: buttonPaddingVertical,
                                  ),
                                ),
                                child: const Text("Get in Touch"),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        color: Colors.white, width: 1),
                                  ),
                                  textStyle: GoogleFonts.montserrat(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: buttonPaddingHorizontal,
                                    vertical: buttonPaddingVertical,
                                  ),
                                ),
                                child: const Text("View Projects"),
                              ),
                            ],
                          ),
                        ],
                      ),
                const SizedBox(height: 150),
              ],
            );
          },
        ),
      ),
    );
  }
}
