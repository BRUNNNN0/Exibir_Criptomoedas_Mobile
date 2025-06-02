import 'package:app_criptomoeda/configs/environment_helper.dart';
import 'package:app_criptomoeda/core/library/extensions.dart';
import 'package:app_criptomoeda/data/datasources/data_source.dart';
import 'package:app_criptomoeda/domain/entities/core/http_resonse_entity.dart';
import 'package:app_criptomoeda/domain/entities/moeda/moeda_entity.dart';

abstract interface class ImoedabuscaRepository {
  Future<List<CriptoMoeda>> getCriptoMoedasymbol(List<String> simbolos);
}

final class buscaMoeda implements ImoedabuscaRepository {
  final IRemoteDataSource _remoteDataSource;
  final IEnvironmentHelper _environment;

  const buscaMoeda(this._remoteDataSource, this._environment);

  @override
  Future<List<CriptoMoeda>> getCriptoMoedasymbol(List<String> simbolos) async {
    final url = montarUrlComSimbolos(simbolos, _environment);
    final HttpResponseEntity httpResponse = (await _remoteDataSource.get(url))!;

    final Map<String, dynamic> dados = httpResponse.data as Map<String, dynamic>;
    final List<CriptoMoeda> moedas = [];

   
    dados['data'].forEach((symbol, item) {
      moedas.add(CriptoMoeda.fromMap(item));
    });

    return moedas;
  }
}

String montarUrlComSimbolos(List<String> simbolos, IEnvironmentHelper environment) {
  final simbolosFormatados = simbolos.map((e) => e.trim().toUpperCase()).join(',');
  return '${environment.urlMoedasimbolo}$simbolosFormatados';
}