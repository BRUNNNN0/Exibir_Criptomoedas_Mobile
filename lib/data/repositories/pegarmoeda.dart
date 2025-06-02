import 'package:app_criptomoeda/core/library/extensions.dart';
import 'package:app_criptomoeda/data/datasources/data_source.dart';
import 'package:app_criptomoeda/domain/entities/core/http_resonse_entity.dart';
import 'package:app_criptomoeda/domain/entities/moeda/moeda_entity.dart';

abstract interface class ImoedaRepository {

Future<List<CriptoMoeda>> getCriptoMoeda();
}

final class Moeda implements ImoedaRepository {
  final IRemoteDataSource _remoteDataSource;

  const Moeda(this._remoteDataSource);

  @override
Future<List<CriptoMoeda>> getCriptoMoeda() async {
  final HttpResponseEntity httpResponse = (await _remoteDataSource.get(_urlMoeda))!;

  final List<dynamic> lista = (httpResponse.data as Map<String, dynamic>)['data'];
  return lista.map((e) => CriptoMoeda.fromMap(e)).toList();
}


  String get _urlMoeda => _remoteDataSource.environment?.urlMoeda ?? '';
  
} 