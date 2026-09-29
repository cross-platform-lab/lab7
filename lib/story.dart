// Một đoạn truyện cùng hai lựa chọn và chỉ số đoạn truyện tiếp theo cho mỗi lựa chọn.
class Story {
  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
    required this.nextStory1,
    required this.nextStory2,
  });

  final String storyTitle;
  final String choice1;
  final String choice2;
  final int nextStory1;
  final int nextStory2;
}
