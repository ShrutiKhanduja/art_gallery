import 'package:equatable/equatable.dart';

abstract class GetPhotosEvent extends Equatable {}

class GetPhotos extends GetPhotosEvent {
  @override
  List<Object?> get props => [];
}

class SearchPhotos extends GetPhotosEvent {
  final String query;

  SearchPhotos({required this.query});

  @override
  List<Object?> get props => [query];
}
