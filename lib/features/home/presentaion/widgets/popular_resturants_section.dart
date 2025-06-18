import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/home/data/model/resturant_moldel.dart';
import 'package:nawel/features/home/presentaion/bloc/bloc/home_bloc.dart';

class PopularRestaurantsSection extends StatelessWidget {
  const PopularRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Restaurants nearby',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        10.verticalSpace,
        SizedBox(
          height: 160.h,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.error != null) {
                return Center(
                  child: Text(
                    'Error: ${state.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state.restaurants.isEmpty) {
                return const Center(child: Text('No restaurants found'));
              }
              final itemCount =
                  state.restaurants.length > 4 ? 4 : state.restaurants.length;

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    index: index,
                    restaurant:
                        state.restaurants[index], // Pass the restaurant data
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final int index;
  final ResturantMoldel restaurant; // Add restaurant parameter

  const RestaurantCard({
    super.key,
    required this.index,
    required this.restaurant, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 80.w,
            margin: EdgeInsets.only(bottom: 10.h),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(width: 1, color: const Color(0xffD9D9D9)),
            ),
            child: Image.asset('assets/d${index + 1}.png', fit: BoxFit.contain),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              restaurant.name ??
                  'Restaurant ${index + 1}', // Use passed restaurant
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time,
                  color: const Color(0xff1E1E1E),
                  size: 12.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  '${restaurant.time ?? 0} min', // Use passed restaurant
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: const Color(0xff1E1E1E).withValues(alpha: 0.58),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
