import 'dart:convert';

class Kuliner {
  int? id;
  final String namaTmp;
  final String alamat;
  final String telepon;

  Kuliner({
    required this.id,
    required this.namaTmp,
    required this.alamat,
    required this.telepon,
  });

  Kuliner copyWith({
    int? id,
    String? namaTmp,
    String? alamat,
    String? telepon,
  }) {
    return Kuliner(
      id: id ?? this.id,
      namaTmp: namaTmp ?? this.namaTmp,
      alamat: alamat ?? this.alamat,
      telepon: telepon ?? this.telepon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namaTmp': namaTmp,
      'alamat': alamat,
      'telepon': telepon,
    };
  }

  factory Kuliner.fromMap(Map<String, dynamic> map) {
    return Kuliner(
      id: map['id'] != null ? map['id'] as int : null,
      namaTmp: map['namaTmp'] as String,
      alamat: map['alamat'] as String,
      telepon: map['telepon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Kuliner.fromJson(String source) =>
      Kuliner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Kuliner(id: $id, nmTempat: $namaTmp, alamat: $alamat, telepon: $telepon)';
  }

  @override
  bool operator ==(covariant Kuliner other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.namaTmp == namaTmp &&
      other.alamat == alamat &&
      other.telepon == telepon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      namaTmp.hashCode ^
      alamat.hashCode ^
      telepon.hashCode;
  }
}
