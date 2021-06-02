import 'package:flutter/material.dart';
import 'package:infinitum/app/components/app_bar_widget.dart';
import 'package:infinitum/app/components/loading_widget.dart';
import 'package:infinitum/app/core/app_text_styles.dart';
import 'package:infinitum/app/model/municipio_model.dart';
import 'package:infinitum/app/service/municipio_service_api.dart';

class PesquisaMunicipios extends StatefulWidget {
  const PesquisaMunicipios({Key key}) : super(key: key);

  @override
  _PesquisaMunicipiosState createState() => _PesquisaMunicipiosState();
}

class _PesquisaMunicipiosState extends State<PesquisaMunicipios> {
  final MunicipioServiceApi _api = MunicipioServiceApi();

  _removerAcentos(String nome) {
    String comAcentos = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç";
    String semAcentos = "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc";

    for (int i = 0; i < comAcentos.length; i++) {
      nome = nome.replaceAll(comAcentos[i], semAcentos[i]);
    }
    return nome;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: FutureBuilder<List<MunicipioModel>>(
          future: _api.listMunicipios(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pesquisa de Munícipios",
                      style: AppTextStyles.title,
                    ),
                    SizedBox(height: 20),
                    Autocomplete<MunicipioModel>(
                      displayStringForOption: (MunicipioModel municipio) =>
                          municipio.nome,
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<MunicipioModel>.empty();
                        }
                        return snapshot.data.where((MunicipioModel option) {
                          return option.nomeURI
                              .replaceAll("-", " ")
                              .toLowerCase()
                              .contains(_removerAcentos(
                                  textEditingValue.text.toLowerCase()));
                        });
                      },
                      onSelected: (MunicipioModel municipio) {
                        Navigator.of(context)
                            .pushNamed("/consulta", arguments: municipio);
                      },
                    ),
                  ],
                ),
              );
            } else {
              return LoadingWidget();
            }
          }),
    );
  }
}
