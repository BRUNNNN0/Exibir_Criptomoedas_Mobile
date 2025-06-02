import 'package:flutter/material.dart';

export 'package:flutter/material.dart';
export 'package:app_criptomoeda/configs/environment_helper.dart';
export 'package:app_criptomoeda/configs/injection_container.dart';
export 'package:app_criptomoeda/data/datasources/data_source.dart';


abstract interface class IFactoryViewModel<T> {
  T create(BuildContext context);
  void dispose(BuildContext context, T viewModel);
}