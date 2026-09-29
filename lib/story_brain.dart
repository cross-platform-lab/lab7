import 'story.dart';

// Xử lý logic điều hướng câu chuyện.
// Đoạn kết thúc có nextStory1 = 0 (Bắt đầu lại) và nextStory2 = -1 (ẩn nút thứ hai).
class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Xe của bạn bị nổ lốp giữa một con đường núi vắng vẻ, điện thoại mất sóng. '
          'Bạn quyết định vẫy xin quá giang. Một chiếc bán tải cũ kỹ dừng lại, '
          'người đàn ông đội mũ rộng vành với ánh mắt khó đoán hỏi: "Cần đi nhờ không, nhóc?"',
      choice1: 'Lên xe. Có còn hơn không.',
      choice2: 'Hỏi thử xem ông ta có phải kẻ xấu không.',
      nextStory1: 2,
      nextStory2: 1,
    ),
    Story(
      storyTitle: 'Ông ta gật đầu chậm rãi, không hề bối rối trước câu hỏi của bạn.',
      choice1: 'Ít ra ông ấy cũng thật thà. Lên xe thôi.',
      choice2: 'Khoan, tôi biết thay lốp mà.',
      nextStory1: 2,
      nextStory2: 3,
    ),
    Story(
      storyTitle:
          'Xe vừa chạy được một đoạn, người lạ bảo bạn mở ngăn đựng đồ phía trước. '
          'Bên trong là một con dao dính máu, hai ngón tay giả và một băng cát-xét nhạc đồng quê. '
          'Ông ta chìa tay ra đòi chiếc hộp.',
      choice1: 'Tôi thích nhạc đồng quê lắm! Đưa băng cát-xét.',
      choice2: 'Đây là cơ hội! Cầm con dao lên.',
      nextStory1: 5,
      nextStory2: 4,
    ),
    Story(
      storyTitle:
          'Đúng là dại dột! Bạn tự thay lốp, nhưng trời tối quá nhanh và bạn lạc đường. '
          'Có vẻ tiết kiệm công sức đi nhờ xe không phải lúc nào cũng khôn ngoan.',
      choice1: 'Bắt đầu lại',
      choice2: '',
      nextStory1: 0,
      nextStory2: -1,
    ),
    Story(
      storyTitle:
          'Bạn đâm xuyên qua lan can khi cố giành lấy con dao và lao xuống vực. '
          'Bạn tự hỏi liệu có phải mình vừa làm điều ngu ngốc nhất đời.',
      choice1: 'Bắt đầu lại',
      choice2: '',
      nextStory1: 0,
      nextStory2: -1,
    ),
    Story(
      storyTitle:
          'Hai người hát vang cả quãng đường. Khi tới thị trấn, ông ta hỏi đường tới quán cà phê '
          'gần nhất. Hóa ra ông chỉ là một thợ săn tốt bụng. Bạn còn được mời một ly cà phê sữa đá!',
      choice1: 'Bắt đầu lại',
      choice2: '',
      nextStory1: 0,
      nextStory2: -1,
    ),
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoice1() => _storyData[_storyNumber].choice1;

  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    final story = _storyData[_storyNumber];
    final next = choiceNumber == 1 ? story.nextStory1 : story.nextStory2;
    if (next == 0) {
      restart();
    } else if (next > 0) {
      _storyNumber = next;
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  // Nút thứ hai chỉ hiển thị khi đoạn truyện hiện tại chưa phải đoạn kết.
  bool buttonShouldBeVisible() => _storyData[_storyNumber].nextStory2 >= 0;
}
