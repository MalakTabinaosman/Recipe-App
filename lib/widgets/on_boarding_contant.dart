import 'package:flutter/material.dart';
import '../constants/constants.dart';

class OnboardingContent extends StatelessWidget {
  final String image, title, desc;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            desc,
            style: TextStyle(fontSize: 16, color: AppColors.textColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
