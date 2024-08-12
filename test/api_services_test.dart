import 'package:flutter/foundation.dart';
import 'package:itunes/models/itunes_data_model.dart';
import 'package:itunes/services/api_services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Assuming ItunesData is already defined somewhere
class MockHttpClient extends Mock implements http.Client {}

void main() {
  setUpAll(() {
    // Register a fallback value for Uri
    registerFallbackValue(Uri());
  });

  late ApiServices apiServices;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiServices = ApiServices();
  });

  test('returns ItunesData if the http call completes successfully', () async {
    // Arrange
    var mockResponse = '{"resultCount": 1, "results": [{"kind": "song"}]}';
    when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => http.Response(mockResponse, 200),
    );

    // Act
    final result = await apiServices.getItunesData('Some Search Term');

    // Print result for debugging
    if (kDebugMode) {
      print(result.results.first.kind);
    }

    // Assert
    expect(result, isA<ItunesData>());
    expect(result.resultCount, 1);
    expect(result.results.first.kind, 'song');
  });

}
