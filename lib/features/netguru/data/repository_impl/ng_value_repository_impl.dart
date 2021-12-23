import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class NGValueRepositoryImplementation implements NGValueRepository {
  @override
  Future<Either<Failure, List<NGValues>>> addToFavourites(NGValues value) {
    // TODO: implement addToFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NGValues>>> addToValues(NGValues value) {
    // TODO: implement addToValues
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NGValues>>> getFavourites() {
    // TODO: implement getFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NGValues>>> getMyValues() {
    // TODO: implement getMyValues
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NGValues>>> removeFromFavourites(NGValues value) {
    // TODO: implement removeFromFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<NGValues>>> removeFromValues(NGValues value) {
    // TODO: implement removeFromValues
    throw UnimplementedError();
  }
}
