import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../models/itunes_data_model.dart';

class ApiServices {
  String endPoint = "https://itunes.apple.com/search?term=";
  final http.Client client;

  ApiServices({http.Client? client}) : client = client ?? http.Client();

  Future<SecurityContext> get globalContext async {
    final sslCert = await rootBundle.load('assets/ssl/itunes_cert.pem');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }

  Future<http.Client> getSSLPinningClient() async {
    HttpClient ioClient = HttpClient(context: await globalContext);
    ioClient.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
    return IOClient(ioClient);
  }

  Future<ItunesData> getItunesData(String searchTerm) async {
    final response = await client.get(Uri.parse(endPoint + searchTerm));
    if (response.statusCode == 200) {
      return ItunesData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final itunesProvider = Provider<ApiServices>((ref) => ApiServices());

