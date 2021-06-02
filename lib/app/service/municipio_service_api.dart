import 'dart:convert';

import 'package:infinitum/app/model/municipio_despesa_model.dart';
import 'package:infinitum/app/model/municipio_model.dart';
import 'package:infinitum/app/model/municipio_receita_model.dart';
import 'package:infinitum/app/service/municipio_service.dart';
import 'package:http/http.dart';

class MunicipioServiceApi extends MunicipioService {

  static final urlPrefix = 'https://transparencia.tce.sp.gov.br/api/json';

  @override
  Future<List<MunicipioModel>> listMunicipios() async {
    final url = Uri.parse("$urlPrefix/municipios");
    Response response = await get(url);

    // String json = response.body;

    // List<MunicipioModel> lista = _toModel(jsonDecode(json));

    return _toModel(jsonDecode(response.body));

  }

  @override
  Future<List<MunicipioDespesaModel>> getDespesasMunicipio(String uri, int ano, int mes) async {
    final url = Uri.parse("$urlPrefix/despesas/$uri/$ano/$mes");

    Response response = await get(url);

    return _toDespesa(jsonDecode(response.body));
  }

  @override
  Future<MunicipioModel> getMunicipio(String nome) async {
    // TODO: implement getMunicipio
    throw UnimplementedError();
  }

  @override
  Future<List<MunicipioReceitaModel>> getReceitasMunicipio(String uri, int ano, int mes) async {
    final url = Uri.parse("$urlPrefix/receitas/$uri/$ano/$mes");

    Response response = await get(url);

    return _toReceita(jsonDecode(response.body));
  }

  _toModel(List<dynamic> list) {
    List<MunicipioModel> municipios = [];
    int i = 0;
    for (dynamic item in list) {
      municipios.add(MunicipioModel(i, item["municipio"], item["municipio_extenso"]));
      i++;
    }
    return municipios;
  }

  _toDespesa(List<dynamic> list) {
    List<MunicipioDespesaModel> despesas = [];
    for (dynamic item in list) {
      despesas.add(MunicipioDespesaModel(item["orgao"], item["mes"], item["evento"], item["nr_empenho"], item["id_fornecedor"], item["nm_fornecedor"], item["dt_emissao_despesa"], item["vl_despesa"]));
    }
    return despesas;
  }
  
  _toReceita(List<dynamic> list) {
    List<MunicipioReceitaModel> receitas = [];
    for (dynamic item in list) {
      receitas.add(MunicipioReceitaModel(item["orgao"], item["mes"], item["ds_fonte_recurso"], item["ds_cd_aplicacao_fixo"], item["ds_alinea"], item["ds_subalinea"], item["vl_arrecadacao"]));
    }
    return receitas;
  }

}