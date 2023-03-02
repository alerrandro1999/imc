import 'package:flutter/material.dart';
import 'package:imc/constants/app_constants.dart';
import 'package:imc/controller/imc_controller.dart';
import 'package:imc/widgets/left_bar.dart';
import 'package:imc/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _imcResult = 0;
  String _textResult = "";
  String _textDescription = "";
  double w = 0;
  double h = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMC',
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Altura",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Peso",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              
              onTap: () {
                if (_heightController.text.isNotEmpty &&
                    _weightController.text.isNotEmpty) {
                  h = ImcController.treatHightValue(_heightController);
                  w = ImcController.treatHightValue(_weightController);

                  setState(() {
                    _imcResult = w / (h * h);
                    _textResult = ImcController().returnImc(_imcResult);
                    _textDescription =
                        ImcController().returnDescription(_imcResult);
                  });
                } else {
                  setState(() {
                    _textResult = '';
                    _imcResult = 0.00;
                    _textDescription = 'Digite sua altura e peso!';
                  });
                }
              },
              child: Text(
                "Calcular",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _imcResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 70,
                  color: accentHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Visibility(
                visible: _textDescription.isNotEmpty,
                child: Container(
                  child: Text(
                    _textDescription,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 70),
            const SizedBox(
              height: 50,
            ),
            const RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
