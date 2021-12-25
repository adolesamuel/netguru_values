import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:netguru_values/core/helpers/json_checker.dart';
import 'package:netguru_values/core/network_info/network_info.dart';
import 'package:netguru_values/features/bloc/setting_bloc.dart';
import 'package:netguru_values/features/netguru/app/bloc/netguru_bloc.dart';
import 'package:netguru_values/features/netguru/data/repository_impl/ng_value_repository_impl.dart';
import 'package:netguru_values/features/netguru/data/sources/ng_local_data_source.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';
import 'package:netguru_values/features/netguru/domain/usecases/add_to_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/add_to_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_my_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/get_theme.dart';
import 'package:netguru_values/features/netguru/domain/usecases/remove_from_favorites.dart';
import 'package:netguru_values/features/netguru/domain/usecases/remove_from_values.dart';
import 'package:netguru_values/features/netguru/domain/usecases/save_theme.dart';

//Calling this GetIt.Instance sl i.e Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //Blocs
  //Netguru bloc
  sl.registerFactory(() => NetguruBloc(
        addToFavourites: sl(),
        addToValues: sl(),
        getFavourites: sl(),
        getMyValues: sl(),
        removeFromFavourites: sl(),
        removeFromValues: sl(),
      ));

  //Settings Bloc
  sl.registerLazySingleton(() => SettingBloc(
        saveTheme: sl(),
        getTheme: sl(),
      ));

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [USECASES]
  ///////////////////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton(() => AddToFavourites(sl()));
  sl.registerLazySingleton(() => AddToValues(sl()));
  sl.registerLazySingleton(() => GetFavourites(sl()));
  sl.registerLazySingleton(() => GetMyValues(sl()));
  sl.registerLazySingleton(() => RemoveFromFavourites(sl()));
  sl.registerLazySingleton(() => RemoveFromValues(sl()));
  sl.registerLazySingleton(() => SaveTheme(sl()));
  sl.registerLazySingleton(() => GetTheme(sl()));

  ///////////////////////////////////////////////////////////////////////////////////
  /// Application [REPOSITORIES]
  ///////////////////////////////////////////////////////////////////////////////////
  sl.registerLazySingleton<NGValueRepository>(
      () => NGValueRepositoryImplementation(sl()));

  ///////////////////////////////////////////////////////////////////////////////////
  ///Application [DATA_SOURCES]
  ///////////////////////////////////////////////////////////////////////////////////

  sl.registerLazySingleton<NGValueLocalDataSource>(
      () => NGValueLocalDataSourceImpl());

  ///////////////////////////////////////////////////////////////////////////////////

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<JsonChecker>(() => JsonCheckerImpl(sl()));

  //! External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => json);
}
