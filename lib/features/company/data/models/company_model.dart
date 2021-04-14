import 'package:investing_alerts/features/company/domain/entities/company.dart';
import 'package:meta/meta.dart';

class CompanyModel extends Company {
  CompanyModel({
    @required String name,
    @required double per
  }) : super(name: name, per: per);

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['Name'],
      per: json['PERatio'] == "None" ? 0.0 : double.parse(json['PERatio'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'per': per,
    };
  }
}
