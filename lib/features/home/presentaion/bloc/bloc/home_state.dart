part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<ResturantMoldel> restaurants; // Fixed typo
  final bool isLoading;
  final String? error;

  const HomeState({
    this.restaurants = const [],
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    List<ResturantMoldel>? restaurants,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      restaurants: restaurants ?? this.restaurants, 
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [restaurants, isLoading, error]; 
}