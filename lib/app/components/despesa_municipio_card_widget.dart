import 'package:flutter/material.dart';
import 'package:infinitum/app/model/municipio_despesa_model.dart';
import 'package:infinitum/app/model/municipio_receita_model.dart';

class DespesaMunicipioCard extends StatelessWidget {
  const DespesaMunicipioCard({Key key, this.despesaMunicipio}) : super(key: key);

  final MunicipioDespesaModel despesaMunicipio;

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: phoneWidth * 0.25,
                    child: Text(
                      despesaMunicipio.orgao,
                      textAlign: TextAlign.start,
                      softWrap: true,
                    ),
                  ),
                  Container(
                    width: phoneWidth * 0.65,
                    child: ListTile(
                      subtitle: Text(despesaMunicipio.nmFornecedor),
                      title: Text("R\$${despesaMunicipio.vlDespesa}"),
                      trailing: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/despesaDetalhes", arguments: despesaMunicipio);
          },
        ),
      ),
    );
  }
}
