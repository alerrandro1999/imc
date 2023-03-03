class ImcController {
  String _textResult = "";
  String _textDescription = "";

  static double treatHightValue(height) {
    if (height.text.isNotEmpty) {
      height = double.parse(height.text.replaceAll(',', '.'));
      return height;
    } else {
      return 0.00;
    }
  }

  static double treatWeightValue(weight) {
    if (weight.text.isNotEmpty) {
      weight = double.parse(weight.text.replaceAll(',', '.'));
      return weight;
    } else {
      return 0.00;
    }
  }

  returnCategory(imcResult) {
    if (imcResult < 18.5) {
      return _textResult += "Magreza: Grau 0";
    } else if (imcResult >= 18.5 && imcResult <= 24.9) {
      return _textResult += "Normal: Grau 0";
    } else if (imcResult >= 25 && imcResult <= 29.9) {
      return _textResult += "Sobrepeso: Grau: l";
    } else if (imcResult >= 30 && imcResult <= 39.9) {
      return _textResult += "Obesidade: Grau ll";
    } else if (imcResult > 39.9) {
      return _textResult += "Obesidade Grave: Grau lll";
    }
  }

  returnDescription(imcResult) {
    if (imcResult < 18.5) {
      return _textDescription +=
          "A Magreza: Grau 0 é uma das classificações da Organização Mundial da Saúde (OMS) e indica que a pessoa está com um Índice de Massa Corporal (IMC) menor que 18,5. É um tema que tem recebido cada vez mais atenção nos últimos anos. Muitas pessoas buscam uma aparência esbelta e elegante, mas é importante lembrar que a magreza extrema pode ter consequências graves para a saúde.";
    } else if (imcResult >= 18.5 && imcResult <= 24.9) {
      return _textDescription +=
          "O Normal: Grau 0 é uma das classificações da Organização Mundial da Saúde (OMS) e indica que a pessoa está com um Índice de Massa Corporal (IMC) entre 18,5, a 24,9. Indicando que a pessoa está dentro da faixa considerada saudável em relação ao peso. No entanto, é importante lembrar que a saúde é mais do que apenas o peso corporal.";
    } else if (imcResult >= 25 && imcResult <= 29.9) {
      return _textDescription +=
          "O sobrepeso é um termo utilizado para descrever um acúmulo excessivo de gordura corporal que pode ser prejudicial à saúde. O grau I de sobrepeso é uma das classificações da Organização Mundial da Saúde (OMS) e indica que a pessoa está com um Índice de Massa Corporal (IMC) entre 25 a 29,9. O excesso de peso pode levar a problemas de saúde, como diabetes tipo 2, hipertensão, doenças cardíacas, distúrbios do sono e osteoartrite. No entanto, é importante lembrar que o sobrepeso não é o único fator que influencia a saúde e que cada pessoa é única, com características físicas e genéticas diferentes.";
    } else if (imcResult >= 30 && imcResult <= 39.9) {
      return _textDescription +=
          "A obesidade é uma condição em que o acúmulo de gordura corporal é tão grande que pode prejudicar a saúde. O grau II de obesidade é uma das classificações da Organização Mundial da Saúde (OMS) e indica que a pessoa está com um Índice de Massa Corporal (IMC) entre 35 a 39,9. A obesidade pode levar a uma série de problemas de saúde, como diabetes tipo 2, hipertensão, doenças cardíacas, derrame cerebral, distúrbios do sono, osteoartrite e até mesmo certos tipos de câncer. Além disso, a obesidade pode afetar a autoestima e a qualidade de vida.";
    } else {
      return _textDescription +=
          "A obesidade grau III, também conhecida como obesidade mórbida, é uma condição em que o acúmulo de gordura corporal é tão grande que pode causar graves problemas de saúde e prejudicar a qualidade de vida. O grau III de obesidade é uma das classificações da Organização Mundial da Saúde (OMS) e indica que a pessoa está com um Índice de Massa Corporal (IMC) igual ou superior a 40. A obesidade mórbida pode aumentar significativamente o risco de doenças cardiovasculares, diabetes tipo 2, hipertensão arterial, derrames cerebrais, doenças hepáticas, distúrbios do sono, entre outras complicações. Além disso, a obesidade mórbida pode limitar a mobilidade e interferir nas atividades diárias.";
    }
  }
}
