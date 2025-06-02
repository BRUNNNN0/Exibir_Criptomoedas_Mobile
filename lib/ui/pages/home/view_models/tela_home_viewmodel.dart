import 'package:app_criptomoeda/data/repositories/pegarmoeda.dart';
import 'package:app_criptomoeda/data/repositories/buscarmoeda.dart';
import 'package:app_criptomoeda/domain/entities/moeda/moeda_entity.dart';
import 'package:app_criptomoeda/configs/factory_viewmodel.dart';
import 'package:app_criptomoeda/core/widgets/show_dialog_widget.dart';
import 'package:app_criptomoeda/utils/util_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_criptomoeda/domain/entities/core/request_state_entity.dart';


final class TelaHomeViewModel extends Cubit<IRequestState<List<CriptoMoeda>>> {
  final ImoedaRepository _repository;
  final ImoedabuscaRepository _buscarepository;
  
  TelaHomeViewModel(this._repository, this._buscarepository) : super(const RequestInitiationState());

 
 
 
  void pegarMoedas() async {
    try {
      _emitter(RequestProcessingState());

      final List<CriptoMoeda> cripmoedas = await _repository.getCriptoMoeda();
      _emitter(RequestCompletedState(value: cripmoedas));
    } catch (error) {
 



  final String erorrDescription = _createErrorDescription(error);
  showSnackBar(erorrDescription);
  _emitter(RequestErrorState(error: error));
}
  }

  String _createErrorDescription(Object? error) {
    return UtilText.labelmoedaTitle;
     

  }



 
  void buscarMoeda(List<String> simbolos) async {
    try {
      _emitter(RequestProcessingState());

      final List<CriptoMoeda> cripmoedas = await _buscarepository.getCriptoMoedasymbol(simbolos);

      _emitter(RequestCompletedState(value: cripmoedas));

    } catch (error) {

  final String erorDescription = _createErroDescription(error);
  showSnackBar(erorDescription);
  _emitter(RequestErrorState(error: error));
}
  }

  String _createErroDescription(Object? error) {
    return UtilText.labelmoedabuscaTitle;
  }



  void _emitter(IRequestState<List<CriptoMoeda>> state) {
   if (isClosed) return;
    emit(state);
  }
  
  
}



  




