import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:http/http.dart" as http;
import 'package:vet_project_flutter_frontend/main.dart';

class DiseaseTypeService {
  final String _controllerUrl = "${dotenv.env['API_URL']}/diseaseTypes";

  Future<http.Response> getList({int page = 0, int pageSize = 10}) async {
    var data = await db.collection('diseaseTypes').get();
    var model = {
      'data': data?.values.toList(),
      "currentPage": page,
      "perPage": pageSize
    };
    return http.Response.bytes(utf8.encode(jsonEncode(model)), HttpStatus.ok,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        });
  }
}
