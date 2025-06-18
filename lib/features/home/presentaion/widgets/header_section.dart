import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff8900FE), Color(0xffFFDE59)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderTextSection(),
          CircleAvatar(
            radius: 45.r,
            backgroundImage: const AssetImage('assets/profile.png'),
          ),
        ],
      ),
    );
  }
}

class HeaderTextSection extends StatelessWidget {
  const HeaderTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Delivering to:",
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Al Satwa, 81A Street",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        Text(
          "Hi hepa!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}