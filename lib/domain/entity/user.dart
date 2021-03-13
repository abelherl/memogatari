import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String id;
  final String title;
  final String synopsis;
  final String image;

  Story({
    this.id,
    this.title,
    this.synopsis,
    this.image,
  });

  @override
  List<Object> get props => [];
}
