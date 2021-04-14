import 'dart:convert';

import 'package:investing_alerts/core/error/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/company_model.dart';

abstract class CompanyLocalDataSource {
  /// Gets the cached [CompanyModel].
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CompanyModel> getLastCompanyFromCache();

  Future<void> setLastCompanyInCache(CompanyModel companyToCache);
}

const CACHED_COMPANY = 'CACHED_COMPANY';

class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final SharedPreferences sharedPreferences;

  CompanyLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<CompanyModel> getLastCompanyFromCache() {
    final jsonString = sharedPreferences.getString(CACHED_COMPANY);
    if (jsonString != null) {
      return Future.value(CompanyModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setLastCompanyInCache(CompanyModel companyToCache) {
    return sharedPreferences.setString(
      CACHED_COMPANY,
      json.encode(companyToCache.toJson()),
    );
  }
}
