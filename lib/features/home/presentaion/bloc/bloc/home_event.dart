part of 'home_bloc.dart';

sealed class HomeEvent {}
class GetResturantsEvent extends HomeEvent {
  final bool forceRefresh ;
  GetResturantsEvent({ this.forceRefresh = false });
}
