import 'package:flutter/material.dart';
import 'package:infinitum/app/view/municipio_despesas_view.dart';
import 'package:infinitum/app/view/municipio_receitas_view.dart';
import 'package:infinitum/app/view/municipios_search_view.dart';
import 'app/view/municipio_despesa_detalhes_view.dart';
import 'app/view/municipio_details_view.dart';
import 'app/view/municipio_receita_detalhes_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inifinitum',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => PesquisaMunicipios(),
        '/consulta': (context) => MunicipioDetails(),
        '/receitas': (context) => MunicipioReceitas(),
        '/despesas': (context) => MunicipioDespesas(),
        '/receitaDetalhes': (context) => MunicipioReceitaDetalhes(),
        '/despesaDetalhes': (context) => MunicipioDespesaDetalhes(),
      },
    );
  }
}

