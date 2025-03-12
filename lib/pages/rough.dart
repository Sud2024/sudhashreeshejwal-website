import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contact Information Card
        Card(
          elevation: 6, // Adds shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Circular edges
          ),
          color: Colors.black54, // Background color
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                _buildInfoRow('Phone', '+1 234 567 890'),
                const SizedBox(height: 16),
                _buildInfoRow('Email', 'contact@example.com'),
                const SizedBox(height: 16),
                _buildInfoRow('Location', 'San Francisco, CA'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Connect With Me Card
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connect With Me',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildIconButton(Icons.link, () {
                      // Handle LinkedIn link
                    }),
                    _buildIconButton(Icons.code, () {
                      // Handle GitHub link
                    }),
                    _buildIconButton(Icons.message, () {
                      // Handle Twitter link
                    }),
                    _buildIconButton(Icons.camera_alt, () {
                      // Handle Instagram link
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to create information rows
  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  // Helper method to create circular icon buttons
  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white24,
        radius: 28,
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 28),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
