import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itunes/models/itunes_data_model.dart';
import 'package:itunes/services/api_services.dart';


final itunesDataProvider = FutureProvider.family<Map<String, List<Results>>, String>((ref, query) async {
  final itunesData = await ref.watch(itunesProvider).getItunesData(query);

  Map<String, List<Results>> mediaMap = {};

  for (var element in itunesData.results) {
    if (element.kind != null) {
      if (!mediaMap.containsKey(element.kind)) {
        mediaMap[element.kind.toString()] = [];
      }
      mediaMap[element.kind]!.add(element);
    }
  }

  return mediaMap;
});
