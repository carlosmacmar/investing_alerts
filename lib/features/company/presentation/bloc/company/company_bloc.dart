import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:investing_alerts/core/error/failures.dart';
import 'package:investing_alerts/features/company/domain/entities/company.dart';
import 'package:investing_alerts/features/company/domain/usecases/get_company_per_usecase.dart';
import 'package:meta/meta.dart';

part 'company_event.dart';

part 'company_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The name should be the symbol of a company. E.g. IBM.';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetCompanyPerUseCase getCompanyPer;

  CompanyBloc({
    @required GetCompanyPerUseCase getCompanyPer,
  })  : assert(getCompanyPer != null),
        this.getCompanyPer = getCompanyPer;

  @override
  CompanyState get initialState => Empty();

  @override
  Stream<CompanyState> mapEventToState(CompanyEvent event) async* {
    if (event is GetCompanyPer) {
      yield Loading();
      final failureOrCompany = await getCompanyPer(Params(companyName: event.companyName));
      yield* _eitherLoadedOrErrorState(failureOrCompany);
    }
  }

  Stream<CompanyState> _eitherLoadedOrErrorState(
      Either<Failure, Company> failureOrCompany,
      ) async* {
    yield failureOrCompany.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (company) => Loaded(company: company),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
