import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../app/app.dart';

class AppService {
  final String _apiUrl = Environment.dev;
  final Map<String, String> _header = {
    'Accept': 'application/json',
    'Content-type': 'application/json',
    'Authorization': "Bearer " // Poner Bearer
  };

  Future<Response> apiPost(String path,
      {Map<String, dynamic>? body, String? data}) async {
    Response request = Response('Error', 500);
    try {
      request = await http.post(
        Uri.https(_apiUrl, path),
        headers: _header,
        body: data ?? jsonEncode(body),
      );
    } catch (e) {
      log("error in apiPost: $e");
    }
    return request;
  }

  Future<Response> apiGet(String path) async {
    Response request = Response('Error', 500);
    try {
      request = await http.get(
        Uri.https(_apiUrl, path),
        headers: _header,
      );
    } catch (e) {
      log("error in apiGet: $e");
    }
    return request;
  }

  Future<Response> apiDelete(String path) async {
    Response request = Response('Error', 500);
    try {
      request = await http.delete(
        Uri.https(_apiUrl, path),
        headers: _header,
      );
    } catch (e) {
      log("error in apiGet: $e");
    }
    return request;
  }

  Future<Response> apiPut(String path,
      {Map<String, dynamic>? body, String? data}) async {
    Response request = Response('Error', 500);
    try {
      request = await http.put(
        Uri.https(_apiUrl, path),
        headers: _header,
        body: data ?? jsonEncode(body),
      );
    } catch (e) {
      log("error in apiGet: $e");
    }
    return request;
  }
}
