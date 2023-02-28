import 'package:dartz/dartz.dart';
import '../models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<String, List<MovieModel>>> getTopRated({int page = 1});
  Future<Either<String, List<MovieModel>>> getNowPlaying({int page = 1});
}
