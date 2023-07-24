import 'package:flutter/material.dart';
import '../models/album.dart';
import '../services/music_service.dart';

class MainController extends ChangeNotifier {
  final MusicService _musicService = MusicService();
  List<Album> _albums = [];

  List<Album> get albums => _albums;

  Future<void> fetchAlbums() async {
    try {
      _albums = await _musicService.fetchAlbumsForJackJohnson();
      notifyListeners();
    } catch (e) {
      print('Error fetching albums: $e');
    }
  }

  void toggleFavoriteState(int index) {
    _albums[index].isFavorite = !_albums[index].isFavorite;
    notifyListeners();
  }
}
