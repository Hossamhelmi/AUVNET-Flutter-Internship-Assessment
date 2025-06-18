import 'package:nawel/features/home/data/model/resturant_moldel.dart';

abstract class HomeRepo {
  Future<List<ResturantMoldel>> getResturants();
}
