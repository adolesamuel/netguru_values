import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';
import 'package:netguru_values/features/netguru/domain/usecases/ng_params.dart';

class AddToFavourites extends Usecase<List<String>, NGValueParams> {
  final NGValueRepository ngValueRepository;

  AddToFavourites(this.ngValueRepository);

  @override
  Future<Either<Failure, List<String>>> call(NGValueParams params) {
    return ngValueRepository.addToFavourites(params.value);
  }
}
