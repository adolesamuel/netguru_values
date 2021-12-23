import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';
import 'package:netguru_values/features/netguru/domain/usecases/ng_params.dart';

class AddToFavourites extends Usecase<List<NGValues>, NGValueParams> {
  final NGValueRepository ngValueRepository;

  AddToFavourites(this.ngValueRepository);

  @override
  Future<Either<Failure, List<NGValues>>> call(NGValueParams params) {
    return ngValueRepository.addToFavourites(params.value);
  }
}
