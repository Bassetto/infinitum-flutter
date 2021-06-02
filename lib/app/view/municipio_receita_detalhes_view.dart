import 'package:flutter/material.dart';
import 'package:infinitum/app/core/app_text_styles.dart';
import 'package:infinitum/app/model/municipio_receita_model.dart';

class MunicipioReceitaDetalhes extends StatelessWidget {
  const MunicipioReceitaDetalhes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final MunicipioReceitaModel receitaMunicipio = ModalRoute.of(context).settings.arguments;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          Text("Orgão:\n${receitaMunicipio.orgao}", style: AppTextStyles.title),
          SizedBox(height: 10),
          Text("Mês:\n${receitaMunicipio.mes}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Fonte do recurso:\n${receitaMunicipio.dsFonteRecurso}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("CD da aplicação fixo:\n${receitaMunicipio.dsCdAplicacaoFixo}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Alinea:\n${receitaMunicipio.dsAlinea}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Sub Alinea:\n${receitaMunicipio.dsSubAlinea}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Valor da arrecadação: R\$${receitaMunicipio.vlArrecadacao}", style: AppTextStyles.heading),
        ],
      ),
    );
  }
}
