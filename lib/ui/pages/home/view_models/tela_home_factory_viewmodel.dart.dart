import 'package:app_criptomoeda/configs/factory_viewmodel.dart';
import 'package:app_criptomoeda/data/datasources/data_source.dart';
import 'package:app_criptomoeda/data/datasources/data_sources_factory.dart';
import 'package:app_criptomoeda/data/repositories/buscarmoeda.dart';
import 'package:app_criptomoeda/data/repositories/pegarmoeda.dart';
import 'package:app_criptomoeda/ui/pages/home/view_models/tela_home_viewmodel.dart';
import 'package:flutter/material.dart';

final class TelaPerfilFactoryViewmodel implements IFactoryViewModel<TelaHomeViewModel> {
  @override
  TelaHomeViewModel create(BuildContext context) {
    final IRemoteDataSource remoteDataSource = RemoteFactoryDataSource().create();
    final IEnvironmentHelper environmentHelper = const EnvironmentHelper();

    final ImoedabuscaRepository buscaRepository = buscaMoeda(remoteDataSource, environmentHelper);
    final ImoedaRepository moedaRepository = Moeda(remoteDataSource);
    
    return TelaHomeViewModel(moedaRepository,buscaRepository);
  }

  @override
  void dispose(BuildContext context, TelaHomeViewModel viewModel) {
    viewModel.close();
  }
}