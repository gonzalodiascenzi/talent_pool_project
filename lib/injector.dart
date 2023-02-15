import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talent_pool_project/movie/providers/movie_get_now_playing_provider.dart';
import 'package:talent_pool_project/movie/providers/movie_get_top_rated_provider.dart';

import 'package:talent_pool_project/movie/repositories/movie_repository.dart';
import 'package:talent_pool_project/movie/repositories/movie_repository_impl.dart';

import 'app_constants.dart';

final sl = GetIt.instance;

void setup() {
  // Register Provider

  sl.registerFactory<MovieGetTopRatedProvider>(
        () => MovieGetTopRatedProvider(sl()),
  );
  sl.registerFactory<MovieGetNowPlayingProvider>(
        () => MovieGetNowPlayingProvider(sl()),
  );


  // Register Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Register Http Client (DIO)
  sl.registerLazySingleton<Dio>(
        () => Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        queryParameters: {'api_key': AppConstants.apiKey},
      ),
    ),
  );
}
