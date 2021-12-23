import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/failures/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
