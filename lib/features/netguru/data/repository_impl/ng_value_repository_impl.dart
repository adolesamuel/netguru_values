import 'package:netguru_values/core/utils/strings.dart';
import 'package:netguru_values/features/netguru/data/sources/ng_local_data_source.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class NGValueRepositoryImplementation implements NGValueRepository {
  final NGValueLocalDataSource ngValueLocalDataSource;

  NGValueRepositoryImplementation(this.ngValueLocalDataSource);

  @override
  Future<Either<Failure, List<String>>> addToFavourites(String value) async {
    //check for network connection
    //perform error handling to ascertain if there was
    // no issue during the process and trigger the local data source
    //to cache list of messages obtained from the server
    try {
      //call local data source to cache prayer
      //and return a boolean object indicating success
      return Right(await ngValueLocalDataSource.addToFavourites(value));
    } catch (e) {
      //if there is an error during this operation
      //then return the left side of the Either-type with
      //a CacheFailure object

      return Left(
          CacheFailure(ErrorStrings.errorAddingToFavourites, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> addToValues(String value) async {
    try {
      return Right(await ngValueLocalDataSource.addToValues(value));
    } catch (e) {
      return Left(CacheFailure(ErrorStrings.errorAddingToValues, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getFavourites() async {
    try {
      return Right(await ngValueLocalDataSource.getFavourites());
    } catch (e) {
      return Left(
          CacheFailure(ErrorStrings.errorGettingFavourites, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getMyValues() async {
    try {
      return Right(await ngValueLocalDataSource.getMyValues());
    } catch (e) {
      return Left(CacheFailure(ErrorStrings.errorGettingValues, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> removeFromFavourites(
      String value) async {
    try {
      return Right(await ngValueLocalDataSource.removeFromFavourites(value));
    } catch (e) {
      return Left(
          CacheFailure(ErrorStrings.errorRemovingFavourite, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> removeFromValues(String value) async {
    try {
      return Right(await ngValueLocalDataSource.removeFromValues(value));
    } catch (e) {
      return Left(CacheFailure(ErrorStrings.errorRemovingValue, e.toString()));
    }
  }

  @override
  Future<int> getTheme() async {
    return ngValueLocalDataSource.getTheme();
  }

  @override
  Future<int> saveTheme(int value) async {
    return ngValueLocalDataSource.setTheme(value);
  }
}
