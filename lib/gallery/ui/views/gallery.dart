import 'package:art_gallery/gallery/core/view_models/get_photos/get_photos_bloc.dart';
import 'package:art_gallery/gallery/core/view_models/get_photos/get_photos_event.dart';
import 'package:art_gallery/gallery/core/view_models/get_photos/get_photos_state.dart';
import 'package:art_gallery/gallery/ui/widgets/photos_grid.dart';
import 'package:art_gallery/gallery/ui/widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetPhotosBloc>(context).add(GetPhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),
            child: Column(
              children: [
                PrimaryTextField(
                  onFieldSubmitted: (val) {
                    BlocProvider.of<GetPhotosBloc>(context)
                        .add(SearchPhotos(query: val ?? ''));
                  },
                  hintText: "Eg.Tiger",
                  textEditingController: controller,
                  prefixIconWidget: const Icon(Icons.search),
                ),
                const SizedBox(height: 10),
                BlocBuilder<GetPhotosBloc, GetPhotosState>(
                  buildWhen: (currState, prevState) {
                    if (currState is GetPhotosInitial) return true;
                    if (currState is PhotosSuccessState) return true;
                    return false;
                  },
                  builder: (context, state) {
                    if (state is GetPhotosInitial) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Shimmer(
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
                            );
                          });
                    }
                    if (state is PhotosSuccessState) {
                      return (state.photosResponseModel.photos!.isNotEmpty)
                          ? PhotosGrid(
                              photosResponseModel: state.photosResponseModel,
                            )
                          : const Center(
                              child: Text(
                                  "Oops! Seems like no photos are available."));
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
