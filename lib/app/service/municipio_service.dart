import 'package:infinitum/app/model/municipio_despesa_model.dart';
import 'package:infinitum/app/model/municipio_model.dart';
import 'package:infinitum/app/model/municipio_receita_model.dart';

abstract class MunicipioService {
  Future<List<MunicipioModel>> listMunicipios();
  Future<MunicipioModel> getMunicipio(String nome);
  Future<List<MunicipioReceitaModel>> getReceitasMunicipio(String uri, int ano, int mes);
  Future<List<MunicipioDespesaModel>> getDespesasMunicipio(String uri, int ano, int mes);
}