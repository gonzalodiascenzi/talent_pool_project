import 'package:flutter/material.dart';
import '../movie/models/movie_model.dart';
import 'image_widget.dart';

class ItemMovieWidget extends Container {
  final MovieModel? movie;
  final double heightBackdrop;
  final double widthBackdrop;
  final double heightPoster;
  final double widthPoster;
  final double radius;
  final void Function()? onTap;

  ItemMovieWidget({
    required this.heightBackdrop,
    required this.widthBackdrop,
    required this.heightPoster,
    required this.widthPoster,
    this.radius = 12,
    this.movie,
    this.onTap,
    super.key,
  });

  @override
  Clip get clipBehavior => Clip.hardEdge;

  @override
  Decoration? get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      );

  @override
  Widget? get child => Stack(
        children: [
          ImageNetworkWidget(
            height: heightBackdrop,
            width: widthBackdrop,
          ),
          Container(
            height: heightBackdrop,
            width: widthBackdrop,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),

          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      );
}
