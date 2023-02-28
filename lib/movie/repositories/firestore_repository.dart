
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talent_pool_project/movie/models/movie.dart';

abstract class Repository<T> {
  Future<T?> get(String id);
  Future<void> set(String id, T data);
  Future<void> update(String id, T data);
  Future<void> delete(String id);
}

class FirestoreRepository implements Repository<Movie> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collectionName = 'movie';

  @override
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
  }
}
