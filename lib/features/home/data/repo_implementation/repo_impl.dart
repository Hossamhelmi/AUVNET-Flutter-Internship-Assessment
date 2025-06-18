import 'package:nawel/features/home/data/data_source/remote_data_source.dart';
import 'package:nawel/features/home/data/model/resturant_moldel.dart';
import 'package:nawel/features/home/domain/repo/home_repo.dart';

class RepoImpl extends HomeRepo {

  final  HomeRemoteDataSource _remoteDataSource;

  RepoImpl({required HomeRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<List<ResturantMoldel>> getResturants() {
    return _remoteDataSource.getResturants();
  }

}