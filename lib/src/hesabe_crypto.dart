import 'package:encrypt/encrypt.dart';
import 'package:convert/convert.dart';
import 'dart:convert';

class HesabeCrypt {
  HesabeCrypt({String key, String iv})
      : key = Key.fromUtf8(key),
        iv = IV.fromUtf8(iv);
  Key key;
  IV iv;
  String encrypt(String data) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: null));
    final encrypted = encrypter.encrypt(pkcs5Pad(data), iv: iv);
    var encodedData = hex.encode(encrypted.bytes);
    return encodedData;
  }

  String decrypt(String data) {
    if (data == null || data.length == 0) throw new Exception("Empty string");
    var dataBytes = hex.decode(data);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: null));
    final decrypted = encrypter.decrypt64(base64.encode(dataBytes), iv: iv);
    return pkcs5Strip(decrypted);
  }

  String pkcs5Pad(String data) {
    var blockSize = 32;
    var padLen = blockSize - (data.length % blockSize);
    var paddedTxt = data + strRepeat(String.fromCharCode(padLen), padLen);
    return paddedTxt;
  }

  String pkcs5Strip(String data) {
    if (data.length < 32) {
      throw new Exception('Invalid data length. Block size must be 32 bytes');
    }
    var padderCodeInt = data.codeUnitAt(data.length - 1);
    if (padderCodeInt > 32) {
      throw new Exception('PKCS#5 padding byte out of range');
    }
    var len = data.length - padderCodeInt;
    return data.substring(0, len);
  }

  String strRepeat(String input, int multiplier) {
    var y = '';
    if (multiplier >= 1) {
      y = input * multiplier;
    }
    return y;
  }
}
