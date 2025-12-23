import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String url;
  const AvatarImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) =>
          CircleAvatar(radius: 24, backgroundImage: imageProvider),
      placeholder: (context, url) => const CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey,
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
        ),
      ),
      errorWidget: (context, url, error) => const CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person_off, color: Colors.white),
      ),
    );
  }
}
