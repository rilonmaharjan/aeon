import 'package:flutter/cupertino.dart';

class Change {
  gradientColor1() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 88, 86, 214),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  gradientColor2() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 210, 48, 120),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  gradientColor3() {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 210, 48, 120),
        Color.fromARGB(255, 255, 77, 44),
      ],
    );
  }

  buttonText1() {
    return "チェックアウトしました";
  }

  buttonText2() {
    return "クラスがありません";
  }

  buttonText3() {
    return "チェックインできません";
  }

  buttonColor1() {
    return const Color.fromARGB(255, 88, 86, 214);
  }

   buttonColor2() {
    return const Color.fromARGB(255, 210, 48, 120);
  }

  buttonColor3() {
    return const Color.fromARGB(255, 210, 48, 120);
  }
}
