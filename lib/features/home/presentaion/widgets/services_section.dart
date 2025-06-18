import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services:',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        15.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceCard(
              imagePath: 'assets/b1.png',
              badgeText: ' Up to 50% ',
              title: 'Food',
            ),
            ServiceCard(
              imagePath: 'assets/b2.png',
              badgeText: ' 20mins ',
              title: 'Health &\nwellness',
            ),
            ServiceCard(
              imagePath: 'assets/b3.png',
              badgeText: ' 15 mins ',
              title: 'Groceries',
            ),
          ],
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String badgeText;
  final String title;

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.badgeText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 105.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Image.asset(imagePath, fit: BoxFit.none, scale: 3.5),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff8900FE),
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Text(
            badgeText,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
