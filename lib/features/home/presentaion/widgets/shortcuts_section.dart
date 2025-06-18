import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shortcuts:',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 160.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              ShortcutCard(
                icon: Image.asset('assets/c0.png', scale: 3),
                label: 'Past Orders',
              ),
              ShortcutCard(
                icon: Image.asset('assets/c1.png', scale: 3),
                label: 'Super Saver',
              ),
              ShortcutCard(
                icon: Image.asset('assets/c2.png', scale: 3),
                label: 'Must Tries',
              ),
              ShortcutCard(
                icon: Image.asset('assets/c3.png', scale: 3),
                label: 'Give Back',
              ),
              ShortcutCard(
                icon: Image.asset('assets/c4.png', scale: 3),
                label: 'Best Sellers',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShortcutCard extends StatelessWidget {
  final Widget icon;
  final String label;

  const ShortcutCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0, left: 6, right: 6, top: 6),
          child: Container(
            width: 80.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: Color(0xffFFEEE6),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: icon,
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
