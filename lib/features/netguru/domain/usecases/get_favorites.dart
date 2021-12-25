import 'package:netguru_values/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class GetFavourites extends Usecase<List<String>, NoParams> {
  final NGValueRepository ngValueRepository;

  GetFavourites(this.ngValueRepository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
    return ngValueRepository.getFavourites();
  }
}
