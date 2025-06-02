
import 'package:app_criptomoeda/configs/environment_helper.dart';
import 'package:app_criptomoeda/core/service/http_service.dart';
import 'package:app_criptomoeda/data/datasources/data_source.dart';
import 'package:app_criptomoeda/domain/entities/core/http_resonse_entity.dart';

base class RemoteDataSource implements IRemoteDataSource {
  final IHttpService _http;
  final IEnvironmentHelper _environment;

  const RemoteDataSource(this._http, this._environment,);

@override
Future<HttpResponseEntity> get(String url, [String? token]) async {
  try {
    // Apenas chama o método GET, pois os headers já estão no Dio
    return await _http.get(url);
  } catch (_) {
    rethrow;
  }
}

  @override
  Future<HttpResponseEntity?> post(String url, [String? data]) async {
    try {
      return await _http.post(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseEntity?> put(String url, [String? data]) async {
    try {
      return await _http.put(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseEntity?> patch(String url, [String? data]) async {
    try {
      return await _http.patch(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponseEntity?> delete(String url, [String? data]) async {
    try {
      return await _http.delete(url, data: data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  IEnvironmentHelper get environment => _environment;
 
}

