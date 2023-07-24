import 'package:apptest01/utils/default_values.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/album.dart';

class MusicService {
  static const String baseUrl = 'https://itunes.apple.com/lookup';

  Future<List<Album>> fetchAlbumsForJackJohnson() async {
    final response = await http.get(Uri.parse('$baseUrl?id=909253&entity=album'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> albumData = data['results'];

      // Filter albums with wrapperType == 'collection'
      final List<dynamic> collectionData = albumData.where((albumJson) => albumJson['wrapperType'] == 'collection').toList();

      return collectionData
          .map<Album>((albumJson) => Album(
                artworkUrl100: albumJson['artworkUrl100'] ?? defaultArtworkUrl100,
                collectionName: albumJson['collectionName'] ?? defaultCollectionName,
                currency: albumJson['currency'] ?? defaultCurrency,
                collectionPrice: albumJson['collectionPrice'] ?? defaultCollectionPrice,
              ))
          .toList();
    } else {
      throw Exception('Failed to fetch albums');
    }
  }
}
