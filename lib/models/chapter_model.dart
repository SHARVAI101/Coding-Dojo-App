
class Chapter {
  String chaptername;
  String chapter_icon;
  int noofquestions;

  Chapter({
    this.chaptername,
    this.chapter_icon,
    this.noofquestions
  });
}


List<Chapter> chapters = [
  Chapter(
    chaptername: 'NUMBERS',
    chapter_icon: 'assets/icons/numbers.png',
    noofquestions: 2,
  ),
  Chapter(
    chaptername: 'STRINGS',
    chapter_icon: 'assets/icons/string.png',
    noofquestions: 22,
  ),
  Chapter(
    chaptername: '1-D ARRAYS',
    chapter_icon: 'assets/icons/array.png',
    noofquestions: 19,
  ),
  Chapter(
    chaptername: '2-D ARRAYS',
    chapter_icon: 'assets/icons/dda.png',
    noofquestions: 12,
  ),
  Chapter(
    chaptername: 'FUNCTIONS',
    chapter_icon:  'assets/icons/function.png',
    noofquestions: 9,
  ),
  Chapter(
    chaptername: 'OOP',
    chapter_icon:  'assets/icons/oop.png',
    noofquestions: 8,
  ),
  Chapter(
    chaptername: 'NUMBERS & OOP',
    chapter_icon:  'assets/icons/noop.png',
    noofquestions: 5,
  ),
];