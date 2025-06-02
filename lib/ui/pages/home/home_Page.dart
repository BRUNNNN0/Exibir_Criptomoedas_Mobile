import 'package:app_criptomoeda/ui/pages/home/view_models/tela_home_factory_viewmodel.dart.dart';
import 'package:app_criptomoeda/ui/pages/home/view_models/tela_home_viewmodel.dart';
import 'package:app_criptomoeda/ui/pages/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TelaHomeViewModel>(
      create: TelaPerfilFactoryViewmodel().create,
      child: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF5FF),
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          'API Coin Market Cap',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: HomeWidgets(),
    );
  }
}

