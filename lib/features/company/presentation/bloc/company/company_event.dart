part of 'company_bloc.dart';

@immutable
abstract class CompanyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCompanyPer extends CompanyEvent {
  final String companyName;

  GetCompanyPer(this.companyName);

  @override
  List<Object> get props => [companyName];
}