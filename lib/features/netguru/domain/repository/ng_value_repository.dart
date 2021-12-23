import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';

abstract class NGValueRepository {
  Future<Either<Failure, List<NGValues>>> addToFavourites(NGValues value);
  Future<Either<Failure, List<NGValues>>> removeFromFavourites(NGValues value);
  Future<Either<Failure, List<NGValues>>> getFavourites();
  Future<Either<Failure, List<NGValues>>> addToValues(NGValues value);
  Future<Either<Failure, List<NGValues>>> removeFromValues(NGValues value);
  Future<Either<Failure, List<NGValues>>> getMyValues();
}
