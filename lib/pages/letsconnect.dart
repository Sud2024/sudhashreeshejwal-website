import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:confetti/confetti.dart';
import 'package:myportfolio/secrets.dart';
import 'package:url_launcher/url_launcher.dart';

class LetsConnect extends StatefulWidget {
  final GlobalKey featuredLetsConnectKey;
  const LetsConnect({super.key, required this.featuredLetsConnectKey});
  @override
  State<LetsConnect> createState() => _LetsConnectState();
}

class _LetsConnectState extends State<LetsConnect> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  late ConfettiController _controller;

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: Duration(seconds: 3));
    Future.delayed(Duration(milliseconds: 300), () {
      _controller.play(); // Ensure the animation starts after build
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> sendEmail(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController subjectController,
      TextEditingController messageController) async {
    final String recipientName = nameController.text.trim();
    final String recipientEmail = emailController.text.trim();
    final String subject = subjectController.text.trim();
    final String message = messageController.text.trim();

    // Check if fields are empty
    if (recipientName.isEmpty ||
        recipientEmail.isEmpty ||
        subject.isEmpty ||
        message.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("❌ All fields are required!")));
      return;
    }

    final url = Uri.parse('https://api.brevo.com/v3/smtp/email');
    final String apiKey =
        Secrets.sendinblueApiKey; // 🔥 Replace with actual API key

    // 📩 Email sent to YOU (Sudhashree)
    final Map<String, dynamic> bodyToMe = {
      "sender": {
        "name": "Your Website",
        "email": "shejwalsudhashree@gmail.com"
      },
      "to": [
        {"email": "shejwalsudhashree@gmail.com", "name": "Sudhashree Shejwal"}
      ],
      "subject": "New Contact Form Submission from $recipientName",
      "htmlContent": """
      <p><b>Name:</b> $recipientName</p>
      <p><b>Email:</b> $recipientEmail</p>
      <p><b>Subject:</b> $subject</p>
      <p><b>Message:</b> $message</p>
    """
    };

    // 📩 Email sent to the visitor
    final Map<String, dynamic> bodyToVisitor = {
      "sender": {
        "name": "Sudhashree Shejwal",
        "email": "shejwalsudhashree@gmail.com"
      },
      "to": [
        {"email": recipientEmail, "name": recipientName}
      ],
      "subject": "Thank You for Contacting Me!",
      "htmlContent": """
      <p>Dear $recipientName,</p>
      <p>Thank you for reaching out! Your message has been received, and I will get back to you as soon as possible. I appreciate your interest and look forward to assisting you. If your inquiry is urgent, please feel free to mention it, and I will prioritize my response accordingly.</p>
      <p>Best Regards,<br>Sudhashree Shejwal</p>
    """
    };

    // Sending the first email (To You)
    final responseToMe = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'api-key': apiKey,
      },
      body: jsonEncode(bodyToMe),
    );

    // Sending the second email (To Visitor)
    final responseToVisitor = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'api-key': apiKey,
      },
      body: jsonEncode(bodyToVisitor),
    );

    if (responseToMe.statusCode == 201 && responseToVisitor.statusCode == 201) {
      showSuccessDialog(context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text("✅ Message sent successfully!"))
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("❌ Failed to send message. Please try again.")));
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            _controller.play(); // Start confetti animation when dialog opens
            return Stack(
              alignment: Alignment.center,
              children: [
                AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: const Color(0xFF1E1E1E),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      Icon(Icons.email, color: Colors.blue, size: 50),
                      SizedBox(height: 10),
                      Text(
                        "A mail is sent successfully to you and Sudhashree Shejwal!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Return to Website',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                // Confetti widget placed outside the column to be fully visible
                ConfettiWidget(
                  confettiController: _controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: [
                    Colors.blue,
                    Colors.green,
                    Colors.red,
                    Colors.orange
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.featuredLetsConnectKey,
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Let's Connect",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(width: 120, height: 4, color: Colors.blue),
                const SizedBox(height: 20),
                // Form Fields
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color(0xFF171717),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFormTitle('Send Me a Message'),
                        const SizedBox(height: 16),
                        _buildInputField('Name', 'Your Name', nameController),
                        const SizedBox(height: 16),
                        _buildInputField(
                            'Email', 'your@email.com', emailController),
                        const SizedBox(height: 16),
                        _buildInputField(
                            'Subject', 'Subject', subjectController),
                        const SizedBox(height: 16),
                        _buildTextArea('Message', 'Your message here...',
                            messageController),
                        const SizedBox(height: 16),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              sendEmail(
                                context,
                                nameController,
                                emailController,
                                subjectController,
                                messageController,
                              );
                            },
                            child: Text(
                              'Send Message',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Contact Information
                isSmallScreen
                    ? Column(
                        children: [
                          _buildContactInfoCard(),
                          const SizedBox(height: 16),
                          _buildConnectWithMeCard(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildContactInfoCard()),
                          const SizedBox(width: 16),
                          Expanded(child: _buildConnectWithMeCard()),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFormTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _buildInputField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: const Color(0xFF949BA6)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white), // Border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Colors.grey), // Border color when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Colors.blue, width: 2), // Border color when focused
            ),
            filled: true,
            fillColor: const Color(0xFF2F2F2F),
          ),
        ),
      ],
    );
  }

  Widget _buildTextArea(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        TextField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: const Color(0xFF949BA6)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white), // Border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Colors.grey), // Border color when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Colors.blue, width: 2), // Border color when focused
            ),
            filled: true,
            fillColor: const Color(0xFF2F2F2F),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfoCard() {
    return _buildInfoCard(
      'Contact Information',
      [
        _buildInfoRow(
            Icons.mobile_friendly, 'Mobile:', '+918390653000', context),
        _buildInfoRow(Icons.email_rounded, 'Email:',
            'shejwalsudhashree@gmail.com', context),
        _buildInfoRow(Icons.location_on_outlined, 'Location:',
            'Nashik, Maharashtra', context),
      ],
    );
  }

  Widget _buildConnectWithMeCard() {
    return _buildInfoCard(
      'Connect With Me',
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildIconButton(FontAwesomeIcons.linkedin, () {
              _launchURL("https://www.linkedin.com/in/sudhashree-shejwal/");
            }, 'LinkedIn'),
            _buildIconButton(FontAwesomeIcons.github, () {
              _launchURL("https://github.com/Sud2024");
            }, 'GitHub'),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      IconData icon, String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blueAccent,
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: Colors.white70),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Copied to clipboard"),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        spacing: 5,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blueAccent,
            child: IconButton(
              icon: FaIcon(icon, color: Colors.white, size: 28),
              onPressed: onPressed,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
