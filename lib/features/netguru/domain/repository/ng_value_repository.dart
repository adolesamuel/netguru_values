import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/failures/failure.dart';

abstract class NGValueRepository {
  Future<Either<Failure, List<String>>> addToFavourites(String value);
  Future<Either<Failure, List<String>>> removeFromFavourites(String value);
  Future<Either<Failure, List<String>>> getFavourites();
  Future<Either<Failure, List<String>>> addToValues(String value);
  Future<Either<Failure, List<String>>> removeFromValues(String value);
  Future<Either<Failure, List<String>>> getMyValues();
  Future<int> saveTheme(int value);
  Future<int> getTheme();
}
