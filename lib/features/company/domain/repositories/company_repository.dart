import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/company.dart';

abstract class CompanyRepository {
  Future<Either<Failure, Company>> getCompanyPer(String companyName);
}
