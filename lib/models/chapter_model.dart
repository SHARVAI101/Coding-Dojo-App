
class Chapter {
  String chaptername;
  String chapter_icon;

  Chapter({
    this.chaptername,
    this.chapter_icon,
  });
}


List<Chapter> chapters = [
  Chapter(
    chaptername: 'NUMBERS',
    chapter_icon: 'assets/icons/numbers.png',
  ),
  Chapter(
    chaptername: 'STRINGS',
    chapter_icon: 'assets/icons/string.png',
  ),
  Chapter(
    chaptername: '1-D ARRAYS',
    chapter_icon: 'assets/icons/array.png',
  ),
  Chapter(
    chaptername: '2-D ARRAYS',
    chapter_icon: 'assets/icons/dda.png',
  ),
  Chapter(
    chaptername: 'FUNCTIONS',
    chapter_icon:  'assets/icons/function.png',
  ),
  Chapter(
    chaptername: 'OOP',
    chapter_icon:  'assets/icons/oop.png',
  ),
];