import 'package:netguru_values/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/entities/ng_values.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class GetMyValues extends Usecase<List<NGValues>, NoParams> {
  final NGValueRepository ngValueRepository;

  GetMyValues(this.ngValueRepository);
  @override
  Future<Either<Failure, List<NGValues>>> call(NoParams params) {
    return ngValueRepository.getMyValues();
  }
}
