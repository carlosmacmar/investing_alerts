import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/company.dart';
import '../../domain/repositories/company_repository.dart';
import '../datasources/company_local_data_source.dart';
import '../datasources/company_remote_data_source.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource remoteDataSource;
  final CompanyLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CompanyRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Company>> getCompanyPer(
    String companyName,
  ) async {
    if (await networkInfo.isInternetAvailable) {
      try {
        final remoteCompanyPer = await remoteDataSource.getCompanyPer(companyName);
        localDataSource.setLastCompanyInCache(remoteCompanyPer);
        return Right(remoteCompanyPer);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCompanyPer = await localDataSource.getLastCompanyFromCache();
        return Right(localCompanyPer);
      } on CacheException {
        return Left(CacheFailure());
      }
    }

  }
}
