import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class GetTheme extends Usecase<int, NoParams> {
  final NGValueRepository ngValueRepository;

  GetTheme(this.ngValueRepository);
  @override
  Future<Either<Failure, int>> call(NoParams params) {
    return ngValueRepository.getTheme();
  }
}
