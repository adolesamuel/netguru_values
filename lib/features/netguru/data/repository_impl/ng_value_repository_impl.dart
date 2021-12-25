import 'package:netguru_values/core/utils/strings.dart';
import 'package:netguru_values/features/netguru/data/sources/ng_local_data_source.dart';
import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class NGValueRepositoryImplementation implements NGValueRepository {
  final NGValueLocalDataSource ngValueLocalDataSource;

  NGValueRepositoryImplementation(this.ngValueLocalDataSource);

  @override
  Future<Either<Failure, List<NGValues>>> addToFavourites(
      NGValues value) async {
    //check for network connection
    //perform error handling to ascertain if there was
    // no issue during the process and trigger the local data source
    //to cache list of messages obtained from the server
    try {
      //call local data source to cache prayer
      //and return a boolean object indicating success
      return Right(
          await ngValueLocalDataSource.addToFavourites(value.toValueModel()));
    } catch (e) {
      //if there is an error during this operation
      //then return the left side of the Either-type with
      //a CacheFailure object

      return Left(
          CacheFailure(ErrorStrings.errorAddingToFavourites, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NGValues>>> addToValues(NGValues value) async {
    try {
      return Right(
          await ngValueLocalDataSource.addToValues(value.toValueModel()));
    } catch (e) {
      return Left(CacheFailure(ErrorStrings.errorAddingToValues, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NGValues>>> getFavourites() async {
    try {
      return Right(await ngValueLocalDataSource.getFavourites());
    } catch (e) {
      return Left(
          CacheFailure(ErrorStrings.errorGettingFavourites, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NGValues>>> getMyValues() async {
    try {
      return Right(await ngValueLocalDataSource.getMyValues());
    } catch (e) {
      return Left(CacheFailure(ErrorStrings.errorGettingValues, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NGValues>>> removeFromFavourites(
      NGValues value) async {
    try {
      return Right(await ngValueLocalDataSource
          .removeFromFavourites(value.toValueModel()));
    } catch (e) {
      return Left(
          CacheFailure(ErrorStrings.errorRemovingFavourite, e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NGValues>>> removeFromValues(
      NGValues value) async {
    try {
      return Right(
          await ngValueLocalDataSource.removeFromValues(value.toValueModel()));
    } catch (e) {
      return Left(CacheFailure(ErrorStrings.errorRemovingValue, e.toString()));
    }
  }
}
