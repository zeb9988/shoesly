import 'package:flutter/material.dart';

class FilterTab extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;

  const FilterTab({
    Key? key,
    required this.iconData, // Pass the icon data
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5), // Customize the border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Customize the shadow color
            spreadRadius: 2, // Customize the shadow spread radius
            blurRadius: 4, // Customize the shadow blur radius
            offset: const Offset(0, 2), // Customize the shadow offset
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Icon(
              iconData, // Use the provided icon data
              size: 24, // Customize the icon size
              color: Colors.black, // Customize the icon color
            ),
          ),
        ),
      ),
    );
  }
}
