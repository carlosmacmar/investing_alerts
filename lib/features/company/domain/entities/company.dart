import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Company extends Equatable {
  final String name;
  final double per;

  Company({
    @required this.name,
    @required this.per,
  });

  @override
  List<Object> get props => [name, per];
}
