import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinitum/app/components/despesa_municipio_card_widget.dart';
import 'package:infinitum/app/components/loading_widget.dart';
import 'package:infinitum/app/model/municipio_despesa_model.dart';
import 'package:infinitum/app/model/municipio_model.dart';
import 'package:infinitum/app/service/municipio_service_api.dart';

class MunicipioDespesas extends StatefulWidget {
  const MunicipioDespesas({Key key}) : super(key: key);

  @override
  _MunicipioDespesasState createState() => _MunicipioDespesasState();
}

class _MunicipioDespesasState extends State<MunicipioDespesas> {
  final MunicipioServiceApi _api = MunicipioServiceApi();
  MunicipioModel _municipio;
  TextEditingController _anoController;
  TextEditingController _mesController;
  int _ano = DateTime.now().year;
  int _mes = DateTime.now().month;

  @override
  initState() {
    _anoController = TextEditingController();
    _mesController = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    _anoController.dispose();
    _mesController.dispose();
    super.dispose();
  }

  _updateMes() {
    int mes = int.parse(_mesController.text);
    if (mes >= 1 && mes <= 12) {
      setState(() {
        _mes = mes;
        _mesController.clear();
      });
      FocusScope.of(context).unfocus();
    }
  }

  _updateAno() {
    int ano = int.parse(_anoController.text);
    if (ano >= 2014 && ano <= DateTime.now().year) {
      setState(() {
        _ano = ano;
        _anoController.clear();
      });
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    _municipio = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas ${_municipio.nome}"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "Digite o mês desejado"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    controller: _mesController,
                    onEditingComplete: _updateMes,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "Digite o ano desejado"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    controller: _anoController,
                    onEditingComplete: _updateAno,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<MunicipioDespesaModel>>(
                future:
                    _api.getDespesasMunicipio(_municipio.nomeURI, _ano, _mes),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return listViewBuilder(snapshot.data);
                  } else {
                    return LoadingWidget();
                  }
                }),
          ),
        ],
      ),
    );
  }

  ListView listViewBuilder(List<MunicipioDespesaModel> listMunicipios) {
    return (ListView.builder(
      itemCount: listMunicipios.length,
      itemBuilder: (context, index) {
        return DespesaMunicipioCard(despesaMunicipio: listMunicipios[index]);
      },
    ));
  }
}
