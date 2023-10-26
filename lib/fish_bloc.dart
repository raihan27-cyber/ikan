import 'dart:convert';

import 'package:ikan/helpers/api.dart';
import 'package:ikan/helpers/api_url.dart';
import 'package:ikan/model/fish.dart';

class IkanBloc {
  static Future<List<Ikan>> getIkans() async {
    String apiUrl = ApiUrl.listData;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listData = (jsonObj as Map<String, dynamic>)['data'];
    List<Ikan> ikans = [];
    for (int i = 0; i < listData.length; i++) {
      ikans.add(Ikan.fromJson(listData[i]));
    }
    return ikans;
  }

  static Future addData({Ikan? ikan}) async {
    String apiUrl = ApiUrl.createData;

    var body = {
      "nama_ikan": ikan!.nama,
      "jenis_ikan": ikan.jenis,
      "warna_ikan": ikan.warna,
      "habitat_ikan": ikan.habitat
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateData({required Ikan ikan}) async {
    String apiUrl = ApiUrl.updateData(ikan.idIkan!);

    var body = {
      "nama_ikan": ikan.nama,
      "jenis_ikan": ikan.jenis,
      "warna_ikan": ikan.warna,
      "habitat_ikan": ikan.habitat
    };
    print("Body : $body");
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteData({int? idIkan}) async {
    String apiUrl = ApiUrl.deleteData(idIkan!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}
