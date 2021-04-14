part of 'company_bloc.dart';

@immutable
abstract class CompanyState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CompanyState {}

class Loading extends CompanyState {}

class Loaded extends CompanyState {
  final Company company;

  Loaded({@required this.company});

  @override
  List<Object> get props => [company];
}

class Error extends CompanyState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
