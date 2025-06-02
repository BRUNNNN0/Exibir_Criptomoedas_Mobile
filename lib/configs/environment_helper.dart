abstract interface class IEnvironmentHelper {
  String? get urlMoeda;
  String? get urlMoedasimbolo;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();


  String get _urlBase => 'https://pro-api.coinmarketcap.com';

  @override
  String? get urlMoeda => '$_urlBase/v1/cryptocurrency/listings/latest';
  
  @override
  String? get urlMoedasimbolo => '$_urlBase/v1/cryptocurrency/quotes/latest?symbol=';


}

final String apiKey = 'c8b17b3f-afeb-4b30-859f-0444715bfb9a';