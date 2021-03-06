/// Classe para manipular datas.
class UtilData {
  /// Validar se uma data está no formato brasiliro `DDMMAAAA`.
  static bool validarData(String data) {
    return removeCaracteres(data).length == 8;
  }

  /// Converte o formato brasiliero `DDMMAAAA` para UTC `AAAAMMDD`.
  static String removeCaracteres(String data) {
    StringBuffer novaData = StringBuffer();

    data.runes.forEach((index) {
      int num = int.tryParse(String.fromCharCode(index));
      if (num != null) {
        novaData.write(num);
      }
    });

    return novaData.toString();
  }

  /// Converte o formato brasiliero `DDMMAAAA` para UTC `AAAAMMDD`.
  static DateTime dataToUtc(String data) {
    String dataLimpa = removeCaracteres(data);
    if (validarData(dataLimpa)) {
      StringBuffer novaData = StringBuffer();
      novaData.write(dataLimpa[4]);
      novaData.write(dataLimpa[5]);
      novaData.write(dataLimpa[6]);
      novaData.write(dataLimpa[7]);
      novaData.write('-');
      novaData.write(dataLimpa[2]);
      novaData.write(dataLimpa[3]);
      novaData.write('-');
      novaData.write(dataLimpa[0]);
      novaData.write(dataLimpa[1]);

      return DateTime.parse(novaData.toString());
    } else {
      throw Exception('Nao foi possível converter a data $data');
    }
  }

  /// Retorna o ano da data.
  static int getAno(String data) {
    String dataLimpa = removeCaracteres(data);
    if (validarData(dataLimpa)) {
      StringBuffer novaData = StringBuffer();
      novaData.write(dataLimpa[4]);
      novaData.write(dataLimpa[5]);
      novaData.write(dataLimpa[6]);
      novaData.write(dataLimpa[7]);

      return int.tryParse(novaData.toString());
    } else {
      throw Exception('Nao foi possível obter o ano da data $data');
    }
  }

  /// Retorna o mes de uma data. Informar data no formato `DDMMAAAA`
  static int getMes(String data) {
    String dataLimpa = removeCaracteres(data);
    if (validarData(dataLimpa)) {
      StringBuffer novaData = StringBuffer();
      novaData.write(dataLimpa[2]);
      novaData.write(dataLimpa[3]);

      return int.tryParse(novaData.toString());
    } else {
      throw Exception('Nao foi possível obter o mes da data $data');
    }
  }

  /// Retorna o mes de uma data. Informar data no formato `DDMMAAAA`
  static int getDia(String data) {
    String dataLimpa = removeCaracteres(data);
    if (validarData(dataLimpa)) {
      StringBuffer novaData = StringBuffer();
      novaData.write(dataLimpa[0]);
      novaData.write(dataLimpa[1]);

      return int.tryParse(novaData.toString());
    } else {
      throw Exception('Nao foi possível obter o dia da data $data');
    }
  }
}
