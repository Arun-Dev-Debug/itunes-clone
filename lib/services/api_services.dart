import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../models/itunes_data_model.dart';

class ApiServices{
  String endPoint = "https://itunes.apple.com/search?term=";

  Future<SecurityContext> get globalContext async {
    final sslCert = await rootBundle.load('assets/ssl/itunes_cert.pem');
    print("ssLcert ： $sslCert");
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    print("securityContext ::: $securityContext");
    return securityContext;
  }

  Future<http.Client> getSSLPinningClient() async
  {
    HttpClient client = HttpClient(context: await globalContext) ;
    print("client ::: $client");
    client.badCertificateCallback =  (X509Certificate cert, String host, int port) => false;
    IOClient ioClient = IOClient(client);
    print("ioClient ::: $ioClient");
    return ioClient;
  }

  Future<ItunesData> getItunesData(String searchTerm) async{
    final client = await getSSLPinningClient();
    http.Response response =  await client.get(Uri.parse(endPoint+searchTerm));
    if(response.statusCode == 200){
      ItunesData result = ItunesData.fromJson(jsonDecode(response.body));
      return result;
    }else{
      throw Exception(response.reasonPhrase);
    }
  }

}

final itunesProvider = Provider<ApiServices>((ref) => ApiServices());

