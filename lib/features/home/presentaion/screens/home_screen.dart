import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/home/data/data_source/remote_data_source.dart';
import 'package:nawel/features/home/data/repo_implementation/repo_impl.dart';
import 'package:nawel/features/home/domain/use_case/get_resturants_usecase.dart';
import 'package:nawel/features/home/presentaion/bloc/bloc/home_bloc.dart';
import 'package:nawel/features/home/presentaion/widgets/banner_section.dart';
import 'package:nawel/features/home/presentaion/widgets/header_section.dart';
import 'package:nawel/features/home/presentaion/widgets/popular_resturants_section.dart';
import 'package:nawel/features/home/presentaion/widgets/promo_code_card.dart';
import 'package:nawel/features/home/presentaion/widgets/services_section.dart';
import 'package:nawel/features/home/presentaion/widgets/shortcuts_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeBloc(
            GetResturantsUsecase(
              RepoImpl(
                remoteDataSource: HomeRemoteDataSource(
                  FirebaseFirestore.instance,
                ),
              ),
            ),
          )..add(GetResturantsEvent(forceRefresh: false)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ServicesSection(),
                  26.verticalSpace,
                  PromoCodeCard(),
                  20.verticalSpace,
                  ShortcutsSection(),
                  12.verticalSpace,
                  BannerSection(),
                  30.verticalSpace,
                  PopularRestaurantsSection(),
                  100.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
