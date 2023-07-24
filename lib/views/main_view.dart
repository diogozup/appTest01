import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/main_controller.dart';
import '../models/album.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jack Johnson Albums'),
      ),
      body: Consumer<MainController>(
        builder: (context, controller, _) {
          if (controller.albums.isEmpty) {
            // Fetch albums when the view is first loaded
            controller.fetchAlbums();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.albums.length,
              itemBuilder: (context, index) {
                final Album album = controller.albums[index];
                return AlbumTile(
                  album: album,
                  onFavoritePressed: () => controller.toggleFavoriteState(index),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class AlbumTile extends StatelessWidget {
  final Album album;
  final VoidCallback onFavoritePressed;

  AlbumTile({required this.album, required this.onFavoritePressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(album.artworkUrl100),
      title: Text(album.collectionName),
      subtitle: Text('${album.currency} ${album.collectionPrice}'),
      trailing: IconButton(
        icon: Icon(album.isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: onFavoritePressed,
      ),
    );
  }
}
