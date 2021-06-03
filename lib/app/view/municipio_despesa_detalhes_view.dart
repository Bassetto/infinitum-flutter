import 'package:flutter/material.dart';
import 'package:infinitum/app/core/app_text_styles.dart';
import 'package:infinitum/app/model/municipio_despesa_model.dart';

class MunicipioDespesaDetalhes extends StatelessWidget {
  const MunicipioDespesaDetalhes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final MunicipioDespesaModel despesaMunicipio = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          Text("Orgão:\n${despesaMunicipio.orgao}", style: AppTextStyles.title),
          SizedBox(height: 10),
          Text("Mês:\n${despesaMunicipio.mes}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Evento:\n${despesaMunicipio.evento}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Número do empenho:\n${despesaMunicipio.nrEmpenho}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Id do fornecedor:\n${despesaMunicipio.idFornecedor}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Nome do fornecedor:\n${despesaMunicipio.nmFornecedor}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Data da despesa: R\$${despesaMunicipio.dtEmissaoDespesa}", style: AppTextStyles.heading),
          SizedBox(height: 10),
          Text("Valor da despesa: R\$${despesaMunicipio.vlDespesa}", style: AppTextStyles.heading),
        ],
      ),
    );
  }
}
