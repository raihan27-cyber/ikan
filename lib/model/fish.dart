import 'dart:convert';

class Ikan {
  int? idIkan;
  String? nama;
  String? jenis;
  String? warna;
  String? habitat;

  Ikan({this.idIkan, this.nama, this.jenis, this.warna, this.habitat});

  factory Ikan.fromJson(Map<String, dynamic> map) {
    return Ikan(
        idIkan: map["id"],
        nama: map["nama"],
        jenis: map["jenis"],
        warna: map["warna"],
        habitat: map["habitat"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": idIkan,
      "nama": nama,
      "jenis": jenis,
      "warna": warna,
      "habitat": habitat
    };
  }

  @override
  String toString() {
    return 'Ikan{id: $idIkan, nama: $nama, jenis: $jenis, warna: $warna, habitat: $habitat}';
  }

  List<Ikan> ikanFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Ikan>.from(data.map((item) => Ikan.fromJson(item)));
  }

  String ikanToJson(Ikan data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
