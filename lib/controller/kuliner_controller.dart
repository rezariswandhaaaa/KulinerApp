import 'dart:convert';

import 'package:kuliner_app/model/kuliner.dart';
import 'package:kuliner_app/service/kuliner_service.dart';

class KulinerController {
  final kulinerService = KulinerService();

  Future<Map<String, dynamic>> addPlace(Kuliner place) async {
    Map<String, String> data = {
      'nama': place.namaTmp,
      'alamat': place.alamat,
      'telepon': place.telepon,
    };

    try {
      var response = await kulinerService.addPlace(data);

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
      List<dynamic> peopleData = await kulinerService.fetchPlace();
      List<Kuliner> people =
          peopleData.map((json) => Kuliner.fromMap(json)).toList();
      return people;
    } catch (e) {
      print(e);
      throw Exception("Failed to get people");
    }
  }

}