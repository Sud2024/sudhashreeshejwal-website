import 'package:flutter/material.dart';

class PortfolioListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding; // Padding parameter

  const PortfolioListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding, // Apply padding to the tile
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onTap: onTap,
        tileColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}
