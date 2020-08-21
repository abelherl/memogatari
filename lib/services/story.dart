import 'dart:convert';
import 'package:hive/hive.dart';

part 'story.g.dart';

@HiveType(typeId: 0)
class Story {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String image;

  Story({ this.id, this.title, this.description, this.image });

}
