import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final String id;
  final String title;
  final String description;
  final String image;

  Story({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  @override
  List<Object> get props => [];
}
