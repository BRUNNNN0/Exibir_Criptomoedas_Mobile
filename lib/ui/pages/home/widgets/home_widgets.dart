import 'package:app_criptomoeda/domain/entities/core/request_state_entity.dart';
import 'package:app_criptomoeda/domain/entities/moeda/moeda_entity.dart';
import 'package:app_criptomoeda/ui/pages/home/view_models/tela_home_viewmodel.dart';
import 'package:app_criptomoeda/utils/util_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_criptomoeda/configs/factory_viewmodel.dart';
import 'package:app_criptomoeda/utils/util_text.dart';
import 'package:intl/intl.dart';





class HomeWidgets extends StatefulWidget {
  const HomeWidgets({super.key});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  late final TelaHomeViewModel _TelaHomeViewModel;
  final TextEditingController _controller = TextEditingController();
  


  @override
  void initState() {
    super.initState();
    _TelaHomeViewModel = context.read<TelaHomeViewModel>();
    _TelaHomeViewModel.pegarMoedas();

  }

 @override
 Widget build(BuildContext context){
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Buscar criptomoedas (ex: BTC, ETH, SOL)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: (){
                _buscarMoeda();},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('BUSCA', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 2, color: Colors.black),
        const SizedBox(height: 16),



          Expanded(
            child: BlocBuilder<TelaHomeViewModel, IRequestState<List<CriptoMoeda>>>(
              builder: (context, state) {
                if (state is RequestProcessingState) {
                  return const Center(child: CircularProgressIndicator());
                }

              if (state is RequestCompletedState) {
                  final listaMoedas = state.data;
                   return RefreshIndicator(
                    onRefresh: () async {
                       _TelaHomeViewModel.pegarMoedas();
                    },
                     child: ListView.builder(
                      itemCount: listaMoedas.length,
                      itemBuilder: (context, index) {
                        final moeda = listaMoedas[index];
                        return InkWell(
                          onTap: () => _mostrarDetalhesMoeda(context, moeda),
                          child: CamposDaMoeda(
                            nome: moeda.name,
                            sigla: moeda.symbol,
                            valorUSD: formatadorUSD.format(moeda.price),
                            valorBRL: formatadorBRL.format(moeda.price*5.73),
                          ),
                        );
                      },
                                       ),
                   );
                }
                return const Center(child: Text('Nenhuma moeda encontrada'));
            },
          ),
        ),
      ],
    ),
  );
  }
  
  
  
  void _buscarMoeda(){
  final symbols = formatarSimbolos(_controller.text);
  final lista;
  
  if(symbols.isEmpty){
    lista = todasMoedas;
  } else {
    lista = symbols;
  }

_TelaHomeViewModel.buscarMoeda(lista);
}
}






class CamposDaMoeda extends StatefulWidget {
  final String nome;
  final String sigla;
  final String valorUSD;
  final String valorBRL;

  const CamposDaMoeda({
    super.key,
    required this.nome,
    required this.sigla,
    required this.valorUSD,
    required this.valorBRL,
  });

  @override
  State<CamposDaMoeda> createState() => _CamposDaMoedaState();
}


class _CamposDaMoedaState extends State<CamposDaMoeda> {
  @override
  Widget build(BuildContext context) {
  String knome = widget.nome;
  String ksigla = widget.sigla;
  String kvalorUSD = widget.valorUSD;
  String kvalorBRL = widget.valorBRL;

    return Card(
      
  elevation: 4,
  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(knome,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                      Text(ksigla,
                      style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text('Valor USD: ', style: TextStyle(fontSize: 15)),
                      Text('Valor BRL: ', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(kvalorUSD, style: TextStyle(fontSize: 15)),
                      Text(kvalorBRL, style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






void _mostrarDetalhesMoeda(BuildContext context, CriptoMoeda moeda) {
final FocusNode _searchFocusNode = FocusNode();
  final formatadorUSD = NumberFormat.currency(locale: 'en_US', symbol: 'US\$');
  final formatadorBRL = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
   _searchFocusNode.unfocus();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder( 
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(moeda.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Símbolo: ${moeda.symbol}'),
            Text('Data adicionada: ${formatarData(moeda.date_added)}'),
            const SizedBox(height: 12),
            Text('Preço atual USD: ${formatadorUSD.format(moeda.price)}'),
            Text('Preço atual BRL: ${formatadorBRL.format(moeda.price*5.73)}'),
          ],
        ),
      );
    },
  );
}

