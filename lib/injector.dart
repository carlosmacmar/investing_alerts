import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:investing_alerts/features/company/domain/usecases/get_company_per_usecase.dart';
import 'package:investing_alerts/features/company/presentation/bloc/company/company_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/company/data/datasources/company_local_data_source.dart';
import 'features/company/data/datasources/company_remote_data_source.dart';
import 'features/company/data/repositories/company_repository_impl.dart';
import 'features/company/domain/repositories/company_repository.dart';

final injector = GetIt.instance;

Future<void> init() async {
  // Bloc
  injector.registerFactory(
    () => CompanyBloc(
      getCompanyPer: injector(),
    ),
  );

  // Use cases
  injector.registerLazySingleton(() => GetCompanyPerUseCase(injector()));

  // Repository
  injector.registerLazySingleton<CompanyRepository>(
    () => CompanyRepositoryImpl(
      localDataSource: injector(),
      networkInfo: injector(),
      remoteDataSource: injector(),
    ),
  );

  // Data sources
  injector.registerLazySingleton<CompanyRemoteDataSource>(
    () => CompanyRemoteDataSourceImpl(client: injector()),
  );

  injector.registerLazySingleton<CompanyLocalDataSource>(
    () => CompanyLocalDataSourceImpl(sharedPreferences: injector()),
  );

  //! Core
  injector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injector()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);
  injector.registerLazySingleton(() => http.Client());
  injector.registerLazySingleton(() => DataConnectionChecker());
}
