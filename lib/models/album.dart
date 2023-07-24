import '../utils/default_values.dart';

class Album {
  final String artworkUrl100;
  final String collectionName;
  final String currency;
  final double collectionPrice;
  bool isFavorite;

  Album({
    required this.artworkUrl100,
    required this.collectionName,
    required this.currency,
    required this.collectionPrice,
    this.isFavorite = false,
  });

  // A factory method to create an Album object from the API response
  // factory Album.fromJson(Map<String, dynamic> json) {
  //   return Album(
  //     artworkUrl100: json['artworkUrl100'] ?? defaultArtworkUrl100,
  //     collectionName: json['collectionName'] ?? defaultCollectionName,
  //     currency: json['currency'] ?? defaultCurrency,
  //     collectionPrice: json['collectionPrice'] ?? defaultCollectionPrice,
  //   );
  // }
}
