import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/cart/presentaion/screens/cart_screen.dart';
import 'package:nawel/features/categories/presentaion/screens/categories_screen.dart';
import 'package:nawel/features/deliver/presentaion/screens/deliver_screen.dart';
import 'package:nawel/features/home/presentaion/screens/home_screen.dart';
import 'package:nawel/features/profile/presentaion/screens/profile_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const DeliverScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xff8900FE),
        unselectedItemColor: const Color(0xff677294),
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _buildNavItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    final navItems = [
      {'icon': 'assets/home_icon.png', 'label': 'Home'},
      {'icon': 'assets/categories_icon.png', 'label': 'categories'},
      {'icon': 'assets/deliver_icon.png', 'label': 'deliver'},
      {'icon': 'assets/cart_icon.png', 'label': 'cart'},
      {'icon': 'assets/profile_icon.png', 'label': 'Profile'},
    ];

    return navItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return BottomNavigationBarItem(
        icon: _buildNavIcon(
          iconPath: item['icon']!,
          isSelected: _currentIndex == index,
        ),
        label: item['label'],
      );
    }).toList();
  }

  Widget _buildNavIcon({
    required String iconPath,
    required bool isSelected,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 8.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xff8900FE)
                : Colors.transparent,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r),bottomLeft: Radius.circular(10.r)),
          ),
        ),
        15.verticalSpace,
        SizedBox(
          width: 32.w,
          height: 32.h,
          child: Image.asset(
            iconPath,
            color: isSelected
                ? const Color(0xff8900FE)
                : const Color(0xff677294),
            fit: BoxFit.contain,
          ),
        ),
        5.verticalSpace,

      ],
    );
  }
}