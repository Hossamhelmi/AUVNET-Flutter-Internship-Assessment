import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel/features/home/data/model/resturant_moldel.dart';
import 'package:nawel/features/home/domain/use_case/get_resturants_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetResturantsUsecase getResturantsUsecase;
  HomeBloc(this.getResturantsUsecase) : super(HomeState()) {
    on<GetResturantsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final resturants = await getResturantsUsecase(forceRefresh: event.forceRefresh);
        emit(state.copyWith(isLoading: false, restaurants: resturants));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}
