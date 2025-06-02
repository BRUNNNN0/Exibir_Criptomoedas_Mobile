import 'package:intl/intl.dart';

final formatadorUSD = NumberFormat.currency(locale: 'en_US', symbol: 'US\$');
final formatadorBRL = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
final formatarData = (String dataIso) => DateFormat('dd/MM/yyyy').format(DateTime.parse(dataIso));

List<String> formatarSimbolos(String entrada) {
  return entrada
      .split(',')
      .map((e) => e.trim().toUpperCase())
      .where((e) => e.isNotEmpty)
      .toList();
}

