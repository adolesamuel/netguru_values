import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:netguru_values/core/helpers/json_checker.dart';
import 'package:netguru_values/core/network_info/network_info.dart';

//Calling this GetIt.Instance sl i.e Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //Blocs
  //Gallery Bloc
  // sl.registerFactory(() => GalleryBloc(
  //       getPhotos: sl(),
  //     ));

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [USECASES]
  ///////////////////////////////////////////////////////////////////////////////////
  //Gallery Usecases
  // sl.registerLazySingleton(() => GetPhotos(sl()));

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [REPOSITORIES]
  ///////////////////////////////////////////////////////////////////////////////////
  //Gallery Application repositories
  // sl.registerLazySingleton<GalleryRepository>(
  //     () => GalleryRepositoryImpl(sl(), sl(), sl()));

  ///////////////////////////////////////////////////////////////////////////////////
  ///Application [DATA_SOURCES]
  ///////////////////////////////////////////////////////////////////////////////////

  // Gallery Data Sources
  // sl.registerLazySingleton<GalleryRemoteDataSource>(
  //     () => GalleryRemoteDataSourceImpl(sl(), sl()));
  // sl.registerLazySingleton<GalleryLocalDataSource>(
  //     () => GalleryLocalDataSourceImpl());

  ///////////////////////////////////////////////////////////////////////////////////

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<JsonChecker>(() => JsonCheckerImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => json);
}
