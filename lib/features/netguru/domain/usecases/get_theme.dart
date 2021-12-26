import 'package:dartz/dartz.dart';
import 'package:netguru_values/core/failures/failure.dart';
import 'package:netguru_values/core/usecase/usecase.dart';
import 'package:netguru_values/features/netguru/domain/repository/ng_value_repository.dart';

class GetTheme {
  final NGValueRepository ngValueRepository;

  GetTheme(this.ngValueRepository);

  Future<int> value(NoParams params) async {
    return await ngValueRepository.getTheme();
  }
}
