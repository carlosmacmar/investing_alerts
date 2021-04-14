import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:investing_alerts/core/util/api_keys.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../models/company_model.dart';

abstract class CompanyRemoteDataSource {
  /// Calls the https://www.alphavantage.co/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CompanyModel> getCompanyPer(String companyName);
}

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final http.Client client;

  CompanyRemoteDataSourceImpl({@required this.client});

  @override
  Future<CompanyModel> getCompanyPer(String companyName) =>
      _getCompanyPerFromUrl('https://www.alphavantage.co/query?function=OVERVIEW&symbol=$companyName&apikey=$apiKey');

  Future<CompanyModel> _getCompanyPerFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return CompanyModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
