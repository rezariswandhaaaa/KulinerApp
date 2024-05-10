
import 'dart:convert';

import 'package:http/http.dart' as http;

class KulinerService {
  final String baseUrl = '';
  final String endpoint = '';

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }

  Future<http.Response> addPlace(Map<String, String> data) async {
    var request = http.MultipartRequest('POST', getUri(endpoint))
      ..fields.addAll(data)
      ..headers['Content-Type'] = 'application/json';

    return await http.Response.fromStream(await request.send());
  }

  Future<List<dynamic>> fetchPlace() async {
    var response = await http.get(
        getUri(
          endpoint,
        ),
        headers: {
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeResponse = json.decode(response.body);
      return decodeResponse['people'];
    } else {
      throw Exception('Failed to load people: ${response.reasonPhrase}');
    }
  }

    Future<http.Response> updatePlace(Map<String, String> data, String id) async {
  var request = http.MultipartRequest(
    'PUT',
    getUri('$endpoint/$id'),
  )
    ..fields.addAll(data)
    ..headers['Content-Type'] = 'multipart/form-data';

  return await http.Response.fromStream(await request.send());
}

Future<http.Response> deletePlace(String id) async {
  return await http.delete(getUri('$endpoint/$id'));
}
}