import 'dart:convert';

import 'package:kuliner_app/model/kuliner.dart';
import 'package:kuliner_app/service/kuliner_service.dart';

class KulinerController {
  final KulinerService _service = KulinerService();

  Future<Map<String, dynamic>> addPlace(Kuliner kuliner) async {
    Map<String, String> data = {
      'nama': kuliner.nama,
      'alamat': kuliner.alamat,
      'nomor': kuliner.nomor,
    };

    try {
      var response = await _service.addPlace(data);

      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Data berhasil disimpan',
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
   Future<List<Kuliner>> getPlace() async {
    try {
      List<dynamic> placeData = await _service.fetchPlace();
      List<Kuliner> place =
          placeData.map((json) => Kuliner.fromMap(json)).toList();
      return place;
    } catch (e) {
      print(e);
      throw Exception("Failed to get Tempat Kuliner");
    }
  }


    Future<Map<String, dynamic>> updatePlace(
      Kuliner kuliner, String id) async {
    Map<String, String> data = {
      'nama': kuliner.nama,
      'alamat': kuliner.alamat,
      'nomor' : kuliner.nomor,
    };

    try {
      var response = await _service.updatePlace(data, id);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Data berhasil diubah',
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodedJson['message'] ?? 'Terjadi Kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi Kesalahan saat mengubah data',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

}