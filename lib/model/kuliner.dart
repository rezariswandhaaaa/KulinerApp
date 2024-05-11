// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Kuliner {
  int? id;
  final String nama;
  final String alamat;
  final String nomor;
  Kuliner({
    this.id,
    required this.nama,
    required this.alamat,
    required this.nomor,
  });


  Kuliner copyWith({
    int? id,
    String? nama,
    String? alamat,
    String? nomor,
  }) {
    return Kuliner(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      nomor: nomor ?? this.nomor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'alamat': alamat,
      'nomor': nomor,
    };
  }

  factory Kuliner.fromMap(Map<String, dynamic> map) {
    return Kuliner(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      alamat: map['alamat'] as String,
      nomor: map['nomor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kuliner.fromJson(String source) => Kuliner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kuliner(id: $id, nama: $nama, alamat: $alamat, nomor: $nomor)';
  }

  @override
  bool operator ==(covariant Kuliner other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nama == nama &&
      other.alamat == alamat &&
      other.nomor == nomor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nama.hashCode ^
      alamat.hashCode ^
      nomor.hashCode;
  }
}
