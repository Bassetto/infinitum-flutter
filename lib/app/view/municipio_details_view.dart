import 'package:flutter/material.dart';
import 'package:infinitum/app/core/app_text_styles.dart';
import 'package:infinitum/app/model/municipio_model.dart';

class MunicipioDetails extends StatelessWidget {
  const MunicipioDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MunicipioModel _municipio = ModalRoute.of(context).settings.arguments;

    _goTo(String tela) {
      Navigator.pushNamed(context, tela, arguments: _municipio);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Municípios"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                _municipio.nome,
                style: AppTextStyles.title,
              ),
            ),
            SizedBox(height: 30),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Receitas",
                  style: AppTextStyles.heading,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all(BorderSide(color: Colors.white60, width: 3, style: BorderStyle.solid)),
              ),
              onPressed: () => _goTo("/receitas"),
            ),
            SizedBox(height: 30),
            OutlinedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Despesas",
                  style: AppTextStyles.heading,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                side: MaterialStateProperty.all(BorderSide(color: Colors.white60, width: 3, style: BorderStyle.solid)),
              ),
              onPressed: () => _goTo("/despesas"),
            ),
          ],
        ),
      ),
    );
  }
}
