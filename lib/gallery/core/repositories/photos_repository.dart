import 'dart:convert';

import 'package:art_gallery/gallery/core/models/photos_response_model.dart';
import 'package:dio/dio.dart';

class PhotosRepository {
  final dio = Dio();
  final String url = 'https://api.pexels.com/v1/curated';
  final Map<String, String> headers = {
    "Authorization": "EjpWebgeKsYaH0DqnKifw2Ld7lJNa8QWtgUXlJgY3tiWoplnWdaYEPzr"
  };

  Future<PhotosResponseModel> getPhotos() async {
    final response = await dio.get(url,
        queryParameters: {"per_page": 15}, options: Options(headers: headers));

    PhotosResponseModel photosResponseModel =
        PhotosResponseModel.fromJson(response.data);
    return photosResponseModel;
  }

  Future<PhotosResponseModel> searchPhotos(String query) async {
    final response = await dio.get("https://api.pexels.com/v1/search",
        queryParameters: {"query": query, "per_page": 15},
        options: Options(headers: headers));

    PhotosResponseModel photosResponseModel =
        PhotosResponseModel.fromJson(response.data);
    return photosResponseModel;
  }
}
