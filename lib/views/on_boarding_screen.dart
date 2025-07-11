import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'home/home_screen.dart';
import '../widgets/on_boarding_contant.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) => setState(() => isLastPage = index == 1),
              children: const [
                OnboardingContent(
                  image:
                      'assets/pngtree.png',
                  title: AppConstants.onboardingTitle1,
                  desc: AppConstants.onboardingDesc1,
                ),
                OnboardingContent(
                  image: 'assets/vecteezy_fast-food-meal-with_25065315.png',
                  title: AppConstants.onboardingTitle2,
                  desc: AppConstants.onboardingDesc2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (isLastPage) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text(
                isLastPage ? 'Get Started' : 'Next',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
