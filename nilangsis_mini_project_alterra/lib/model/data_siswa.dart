import 'dart:convert';

class DataSiswa {
  String id;
  String namaSiswa;
  String kelas;

  DataSiswa({
    required this.id,
    required this.namaSiswa,
    required this.kelas,
  });

  factory DataSiswa.fromRawJson(String str) =>
      DataSiswa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataSiswa.fromJson(Map<String, dynamic> json) => DataSiswa(
        id: json["id"],
        namaSiswa: json["namaSiswa"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaSiswa": namaSiswa,
        "kelas": [kelas],
      };
}
