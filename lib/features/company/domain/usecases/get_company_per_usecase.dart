import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/company.dart';
import '../repositories/company_repository.dart';

class GetCompanyPerUseCase implements UseCase<Company, Params> {
  final CompanyRepository repository;

  GetCompanyPerUseCase(this.repository);

  @override
  Future<Either<Failure, Company>> call(Params params) async {
    return await repository.getCompanyPer(params.companyName);
  }
}

class Params extends Equatable {
  final String companyName;

  Params({@required this.companyName});

  @override
  List<Object> get props => [companyName];
}
