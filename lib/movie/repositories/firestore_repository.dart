import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talent_pool_project/movie/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import 'movie_repository.dart';

//Single Responsability
abstract class Repository<T> {
  Future<T?> get(String id);
  Future<void> set(String id, T data);
  Future<void> update(String id, T data);
  Future<void> delete(String id);
}

class FirestoreRepository implements MovieRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'movie';

  @override
  Future<Either<String, List<MovieModel>>> getNowPlaying({int page = 1}) async {
    try {
      final querySnapshot = await _db.collection("getNowPlaying").get();

      final movies = querySnapshot.docs
          .map((doc) => MovieModel.fromMap(doc.data()))
          .toList();

      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MovieModel>>> getTopRated({int page = 1}) async {
    try {
      final querySnapshot = await _db.collection("getTopRated").get();

      final movies = querySnapshot.docs
          .map((doc) => MovieModel.fromMap(doc.data()))
          .toList();

      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

/*  @override
  Future<Movie?> get(String id) async {
    final docSnapshot = await _db.collection(_collectionName).doc(id).get();
    if (docSnapshot.exists) {
      return Movie.fromJson(docSnapshot.data()!);
    } else {
      return null;
    }
  }

  @override
  Future<void> set(String id, Movie data) async {
    final docRef = _db.collection(_collectionName).doc(id);
    final docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      throw Exception('Document already exists');
    } else {
      await docRef.set(data.toJson());
    }
  }

  @override
  Future<void> update(String id, Movie data) async {
    final docRef = _db.collection(_collectionName).doc(id);
    final docSnapshot = await docRef.get();
    if (!docSnapshot.exists) {
      throw Exception('Document does not exist');
    } else {
      await docRef.update(data.toJson());
    }
  }

  @override
  Future<void> delete(String id) async {
    final docRef = _db.collection(_collectionName).doc(id);
    final docSnapshot = await docRef.get();
    if (!docSnapshot.exists) {
      throw Exception('Document does not exist');
    } else {
      await docRef.delete();
    }
  }*/
}
