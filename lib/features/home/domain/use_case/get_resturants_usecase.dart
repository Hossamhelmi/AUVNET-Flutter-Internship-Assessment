import 'package:nawel/features/home/data/data_source/local_data_source.dart';
import 'package:nawel/features/home/data/model/resturant_moldel.dart';
import 'package:nawel/features/home/domain/repo/home_repo.dart';

class GetResturantsUsecase {
  final HomeRepo _getResturantsRepository;
  
  GetResturantsUsecase(this._getResturantsRepository);
  
  Future<List<ResturantMoldel>> call({bool forceRefresh = false}) async {
    // Check cache first (unless forcing refresh)
    if (!forceRefresh && !StorageService.isRestaurantCacheExpired()) {
      final cachedData = StorageService.getRestaurants();
      if (cachedData != null) {
        print('📦 Loading from cache');
        return cachedData.map((json) => ResturantMoldel.fromJson(json)).toList();
      }
    }
    
    try {
      // Fetch from API
      print('🌐 Fetching from API');
      final resturants = await _getResturantsRepository.getResturants();
      
      // Save to cache
      await StorageService.saveRestaurants(resturants);
      
      return resturants;
    } catch (e) {
      // If API fails, try to return cached data as fallback
      final cachedData = StorageService.getRestaurants();
      if (cachedData != null) {
        print('⚠️ API failed, using cached data');
        return cachedData.map((json) => ResturantMoldel.fromJson(json)).toList();
      }
      rethrow; // Re-throw if no cache available
    }
  }
}