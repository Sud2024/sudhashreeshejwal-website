import 'package:flutter/material.dart';

class TestimonialsPage extends StatelessWidget {
  const TestimonialsPage({super.key});

  Widget _buildDivider() {
    return Container(width: 120, height: 4, color: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xFF171717),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Client Testimonials",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            _buildDivider(),
            LayoutBuilder(
              builder: (context, constraints) {
                int columns = constraints.maxWidth > 900
                    ? 3
                    : constraints.maxWidth > 600
                        ? 2
                        : 1;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    childAspectRatio: screenWidth < 400 ? 1 : 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: testimonials.length,
                  itemBuilder: (context, index) {
                    return TestimonialCard(testimonial: testimonials[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;
  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blueAccent, // Border color
          width: 2, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color
            blurRadius: 8, // Softness of shadow
            spreadRadius: 2, // How much the shadow spreads
            offset: const Offset(2, 4), // Shadow position (X, Y)
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.format_quote,
            color: Colors.blue,
            size: 30,
          ),
          const SizedBox(height: 10),
          Text(
            testimonial.feedback,
            style: TextStyle(
              color: Colors.white70,
              fontSize: MediaQuery.of(context).size.width < 400 ? 14 : 18,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  testimonial.initials,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width < 400 ? 12 : 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize:
                          MediaQuery.of(context).size.width < 400 ? 14 : 16,
                    ),
                  ),
                  Text(
                    testimonial.position,
                    style: const TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Testimonial {
  final String name;
  final String position;
  final String feedback;
  final String initials;

  Testimonial({
    required this.name,
    required this.position,
    required this.feedback,
    required this.initials,
  });
}

List<Testimonial> testimonials = [
  Testimonial(
    name: "Deepak Patil",
    position: "SDE, StandardWings Technologies",
    feedback:
        "Working with you has been a great experience. Your confidence and clarity are truly impressive. With more real-world application, I have no doubt you'll reach even greater heights. Keep sharpening your skills—your success story is just getting started!",
    initials: "DP",
  ),
];
