import 'dart:convert';

class DataPelanggaran {
  final String? idPelanggaran;
  final String? namaSiswa;
  final String? kelas;
  final String? namaPelanggaran;
  final String? tanggalKejadian;
  final String? buktiPelanggaran;

  DataPelanggaran({
    this.idPelanggaran,
    this.namaSiswa,
    this.kelas,
    this.namaPelanggaran,
    this.tanggalKejadian,
    this.buktiPelanggaran,
  });

  factory DataPelanggaran.fromRawJson(String str) =>
      DataPelanggaran.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataPelanggaran.fromJson(Map<String, dynamic> json) =>
      DataPelanggaran(
        idPelanggaran: json["idPelanggaran"],
        namaSiswa: json["namaSiswa"],
        kelas: json["kelas"],
        namaPelanggaran: json["namaPelanggaran"],
        tanggalKejadian: json["tanggalKejadian"],
        buktiPelanggaran: json["buktiPelanggaran"],
      );

  Map<String, dynamic> toJson() => {
        "namaSiswa": namaSiswa,
        "kelas": kelas,
        "namaPelanggaran": namaPelanggaran,
        "tanggalKejadian": tanggalKejadian,
        "buktiPelanggaran": buktiPelanggaran,
      };
}
