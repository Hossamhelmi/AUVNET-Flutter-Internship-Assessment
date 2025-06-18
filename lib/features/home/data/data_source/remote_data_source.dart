import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel/features/home/data/model/resturant_moldel.dart';

class HomeRemoteDataSource {
  final FirebaseFirestore firestore;

  HomeRemoteDataSource(this.firestore);

  Future<List<ResturantMoldel>> getResturants() async {
    final snapshot = await firestore.collection('resturant').get();

    return snapshot.docs
        .map((doc) => ResturantMoldel.fromJson(doc.data()))
        .toList();
  }
}
