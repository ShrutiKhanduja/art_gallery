import 'package:art_gallery/gallery/core/models/photos_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PhotosGrid extends StatelessWidget {
  final PhotosResponseModel photosResponseModel;

  const PhotosGrid({
    required this.photosResponseModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: photosResponseModel.photos!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CachedNetworkImage(
              placeholder: (context,url)=>Shimmer(
                gradient: LinearGradient(colors: [
                  Colors.white,
                  Colors.grey.withOpacity(0.1)
                ]),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
              height: 200,
              width: 200,
                fit: BoxFit.cover,
               imageUrl:photosResponseModel.photos![index].src!.original ?? '');
        });
  }
}
