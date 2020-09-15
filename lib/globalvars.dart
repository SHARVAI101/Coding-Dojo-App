
class GlobalVariables {
  static int points=0;
  static int rank=0;
  static int oldrank=0; //this variable helps in rank up wala page

  // rankslist- 0:rank name, 1:rank description, 2:image path, 3: lower limit, 4: upper limit
  static var rankslist=[
    ["WHITE BELT", "Like the offspring of a crane that sits on the castle roof, the youngling rises and begins its journey.", "assets/rank_icons/0.png", 0, 200],
    ["YELLOW BELT", "The youngling now starts growing and learns how the world works. Soon, like a crane, it shall grow wings to soar into history.", "assets/rank_icons/1.png", 201, 400],
    ["BLUE BELT", "The basics now known, the disciple starts enduring the labours of the world.", "assets/rank_icons/2.png", 401, 600],
    ["GREEN BELT", "The katana is sharpened and the yumi are strung. Soon, war shall be upon us.", "assets/rank_icons/3.png", 601, 800],
    ["BROWN BELT", "The kunai knives and the shuriken strike into the lifeless dummy. A sign of times to come.", "assets/rank_icons/4.png", 801, 1000],
    ["BLACK BELT", "A master of the rudiments, the talent now shines through like sun rays through sakura leaves. It is time to find destiny.", "assets/rank_icons/5.png", 1001, 1200],
    ["GENIN", "Dependable when needed, the disciple now starts the journey of attaining perfection.", "assets/rank_icons/6.png", 1201, 1400],
    ["CHUNIN", "Materializing like an apparition and vanishing whenever it pleases, the disciple is now a force to reckon with.", "assets/rank_icons/7.png", 1401, 1600],
    ["JONIN", "Slitting throats without losing the ninjato's edge; cutting through the enemy's lines like a falcon's egg in a crow's nest; the people are awed by the disciple's presence.", "assets/rank_icons/8.png", 1601, 1800],
    ["NINJA", "Unwavering as a rock against sleet and armed to the teeth with a myriad of weapons, the crane is now a wolf.", "assets/rank_icons/9.png", 1801, 2000],
    ["MASTER NINJA", "The disciple is now a teacher; a legend in its own right; the cherry blossoms grow; as if to welcome.", "assets/rank_icons/10.png", 2001, 2200],
    ["NINJA SENPAI", "The disciple, now a ninja's success is as clear as Mount Fugi's peak on a summer afternoon. Time for some sake.", "assets/rank_icons/11.png", 2201, 2400],
    ["SAMURAI", "Like the cold breeze in the air and the eagle in the sky, the ninja watches and annihilates any code that might stand between it and its legend.", "assets/rank_icons/12.png", 2401, 2600],
    ["SAMURAI DAIMYO", "Blossom in the wind; settles on the scabbard of its blade; the disciple has now become the master.", "assets/rank_icons/13.png", 2601, 2800],
    ["SHOGUN", "Birds harken a dawn of a new age. A powerful lord rises through the ranks. Like a fresh breath of air, a new shogun has arrived.", "assets/rank_icons/14.png", 2801, 3000],
    ["LEGENDARY SHOGUN", "The master that no one can defeat. Ruling all the lands from horizon to horizon. Legends are told about it and everyone quivers in fear. It is the LEGENDARY SHOGUN of the CODING DOJO.", "assets/rank_icons/15.png", 3001, 10000]
  ];

  // questionslist- 0:Chapter name, 1:question title, 2:question, 3:difficulty, 4:image path, 5:completion status(0 means not completed; 1 means completed), 6:time in seconds
  static var questionslist=[['STRINGS', 'VOWELS - I', 'Given a string, find the number of vowels and consonants present in it.', 'EASY', 'null', 1, 350.0],
    ['STRINGS', 'STRING FUNCTIONS - I', 'Hard code a string "Sharvai likes mangoes" and: a. Find the character at the 5th position and display it b. Convert the string to uppercase and display it c. Find the length of the string and display it. d. Find the index of the letter m', 'EASY', 'null', 1, 480.0],
    ['STRINGS', 'VOWELS - I', 'Given a string, find the number of vowels and consonants present in it.', 'EASY', 'null', 1, 350.0],
    ['STRINGS', 'VOWELS - I', 'Given a string, find the number of vowels and consonants present in it.', 'EASY', 'null', 1, 350.0],
    ['STRINGS', 'VOWELS - I', 'Given a string, find the number of vowels and consonants present in it.', 'EASY', 'null', 1, 350.0],
  ];
}