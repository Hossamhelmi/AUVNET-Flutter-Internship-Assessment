



import 'package:hive/hive.dart';
import 'package:nawel/features/home/data/model/resturant_moldel.dart';

class StorageService {
  static Box? _box;

  // Initialize storage
  static Future<void> init() async {
    _box = await Hive.openBox('app_storage');
  }

  // Save restaurants cache
  // Save restaurants cache
  static Future<void> saveRestaurants(List<ResturantMoldel> restaurants) async {
    // Convert to JSON list before saving
    final restaurantsJson = restaurants.map((r) => r.toJson()).toList();
    await _box?.put('restaurants', restaurantsJson);
    await _box?.put('restaurants_time', DateTime.now().millisecondsSinceEpoch);
  }

  // Get cached restaurants
  static List<Map<String, dynamic>>? getRestaurants() {
    final cached = _box?.get('restaurants');
    if (cached == null) return null;
    
    // Convert List<dynamic> to List<Map<String, dynamic>>
    return (cached as List<dynamic>)
        .map((item) => Map<String, dynamic>.from(item as Map))
        .toList();
  }

  // Check if cache is expired (1 hour)
  static bool isRestaurantCacheExpired() {
    final cachedTime = _box?.get('restaurants_time');
    if (cachedTime == null) return true;
    
    final cacheDate = DateTime.fromMillisecondsSinceEpoch(cachedTime);
    return DateTime.now().difference(cacheDate).inHours > 1;
  }

  // User Preferences
  static Future<void> saveTheme(String theme) async {
    await _box?.put('theme', theme);
  }

  static String getTheme() {
    return _box?.get('theme', defaultValue: 'light') ?? 'light';
  }




  static Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  static Future<void> clear() async {
    await _box?.clear();
  }
}