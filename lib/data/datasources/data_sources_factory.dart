





import 'package:app_criptomoeda/configs/environment_helper.dart';
import 'package:app_criptomoeda/configs/injection_container.dart';
import 'package:app_criptomoeda/core/service/http_service.dart';
import 'package:app_criptomoeda/data/datasources/data_source.dart';
import 'package:app_criptomoeda/data/datasources/remote_datasource.dart';

final class RemoteFactoryDataSource {
  IRemoteDataSource create() {
    final IHttpService httpService = HttpServiceFactory().create();
    final IEnvironmentHelper environmentHelper = getIt<IEnvironmentHelper>();
    return RemoteDataSource(
      httpService, 
      environmentHelper, 
    );
  }
}