import 'package:flutter/material.dart';
import 'package:infinitum/app/model/municipio_receita_model.dart';

class ReceitaMunicipioCard extends StatelessWidget {
  const ReceitaMunicipioCard({Key key, this.receitaMunicipio})
      : super(key: key);

  final MunicipioReceitaModel receitaMunicipio;

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
                      receitaMunicipio.orgao,
                      textAlign: TextAlign.start,
                      softWrap: true,
                    ),
                  ),
                  Container(
                    width: phoneWidth * 0.65,
                    child: ListTile(
                      subtitle: Text(receitaMunicipio.dsAlinea),
                      title: Text("R\$${receitaMunicipio.vlArrecadacao}"),
                      trailing: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed("/receitaDetalhes", arguments: receitaMunicipio);
          },
        ),
      ),
    );
  }
}
