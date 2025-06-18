import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/core/helper/shared_preference_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentStep = 0;

  void nextStep() {
    if (currentStep < onboardingSteps.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      finishOnboarding();
    }
  }

  void skip() {
    finishOnboarding();
  }

  Future<void> finishOnboarding() async {
    SharedPreferencesHelper.saveBool('isFirstTime', false);
   context.go('/login');
    
  }

  @override
  Widget build(BuildContext context) {
    final data = onboardingSteps[currentStep];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
            child: Image.asset(
              "assets/onboarding.png",
              fit: BoxFit.cover,
              height: 500.h,
              width: double.infinity,
            ),
          ),
          Spacer(),
          Text(
            data.title,
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Text(
              data.description,
              style: TextStyle(fontSize: 14.sp, color: const Color(0xff677294)),
              textAlign: TextAlign.center,
            ),
          ),
          120.verticalSpace,
          Column(
            children: [
              Container(
                width: 350.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xff8900FE),
                ),
                child: TextButton(
                  onPressed: skip,
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: nextStep,
                child: Text("Next", style: TextStyle(fontSize: 16.sp)),
              ),
            ],
          ),
          50.verticalSpace,
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;

  OnboardingData({required this.title, required this.description});
}

final List<OnboardingData> onboardingSteps = [
  OnboardingData(
    title: 'All-in-One Delivery',
    description: 'Order groceries, medicines, and meals delivered straight to your door',
  ),
  OnboardingData(
    title: 'User-to-User Delivery',
    description: 'Send or receive items from other users quickly and easily',
  ),
  OnboardingData(
    title: 'Sales & Discounts',
    description: 'Discover exclusive sales and deals every day',
  ),
];