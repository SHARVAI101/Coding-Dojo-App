
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
    ["NINJA SENSEI", "The disciple, now a ninja's success is as clear as Mount Fugi's peak on a summer afternoon. Time for some sake.", "assets/rank_icons/11.png", 2201, 2400],
    ["SAMURAI", "Like the cold breeze in the air and the eagle in the sky, the ninja watches and annihilates any code that might stand between it and its legend.", "assets/rank_icons/12.png", 2401, 2600],
    ["SAMURAI DAIMYO", "Blossom in the wind; settles on the scabbard of its blade; the disciple has now become the master.", "assets/rank_icons/13.png", 2601, 2800],
    ["SHOGUN", "Birds harken a dawn of a new age. A powerful lord rises through the ranks. Like a fresh breath of air, a new shogun has arrived.", "assets/rank_icons/14.png", 2801, 3000],
    ["LEGENDARY SHOGUN", "The master that no one can defeat. Ruling all the lands from horizon to horizon. Legends are told about it and everyone quivers in fear. It is the LEGENDARY SHOGUN of the CODING DOJO.", "assets/rank_icons/15.png", 3001, 10000]
  ];

  // questionslist- 0:Chapter name, 1:question title, 2:question, 3:difficulty, 4:image path, 5:completion status(0 means not completed; 1 means completed), 6:time in seconds
  // solution pdf for every question is: assets/solutions/questionid.pdf
  // questionids start from 0 (array index is question id)
  static var questionslist=[['STRINGS', 'VOWELS - I', 'Given a string, find the number of vowels and consonants present in it.', 'EASY', 'null', 0, 0.0],
    ['STRINGS', 'STRING FUNCTIONS - I', 'Initialize a string variable with the string "Yumi likes mangoes"(this is also known as "hardcoding") and: \na. Find the character at the 5th position and display it \nb. Convert the string to uppercase and display it \nc. Find the length of the string and display it. \nd. Find the index of the letter m.', 'EASY', 'null', 0, 0.0],
    ['NUMBERS', 'PRIME NUMBERS - I', 'Hard code any integer number and find if it is prime or not. \nTheory: A prime number is one which is divisible by only itself and 1.', 'EASY', 'null', 0, 0.0],
    ['NUMBERS', 'NUMBER PALINDROME', 'Given a number, find if it is a palindrome number or not. \nTheory: A paplindrome number is one which is the same from the front as well as from the back. Example: 121, 1331', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'INITIALS - I', 'Write a program to accept a name containing three words and display only the initials. \nSample Input: Gaius Julius Caesar \nSample Output: G J C', 'EASY', 'null', 0, 0.0],
    ['STRINGS', 'NAME INTERCHANGE', 'Input a name containing 3 words and display the surname followed by the middle and first name. \nSample Input: Gaius Julius Caesar \nSample Output: Caesar Julius Gaius', 'EASY', 'null', 0, 0.0],
    ['STRINGS', 'LONGEST WORD', 'Accept a string and display the longest word in the string along with its length. \nSample Input: Joel went to the market and bought some pistachios \nSample Output: pistachios', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'VOWELS - II', 'Accept a string and find the frequency of every vowel. \nSample Input: Bitconnect future \nSample Output: a=0 e=2 i=1 o=1 u=2', 'EASY', 'null', 0, 0.0],
    ['STRINGS', 'ASTERISK ATTACK', 'Accept a string and replace all vowels with a * \nSample Input: Alpha Romeo \nSample Output: *lph* R*m**', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'BLUE RED INTERCHANGE', 'Consider the following string: Blue bottle is in Blue bag lying on Blue carpet The output should be: Red bottle is in Red bag lying on Red carpet', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'STRING PALINDROME', 'Accept a string and check if it is a palindrome. Example of a palindrome string: MOM, ABCDCBA', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'MIDDLE NAME REMOVER', 'Input a name and remove the middle name and display only the first and last name. \nSample Input: Arthur Conan Doyle \nSample Output: Arthur Doyle', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'VOWELS - III', 'Input a string and replace all vowels with the character following it. \nSample Input: computer \nSample Output: cpmpvtfr', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'LETTER FINDER', 'Write a program to input a sentence and find the frequency of a charachter that will be input as well. \nSample Input: karen is looking for the manager Find freq of-> k \nSample Output: 1', 'EASY', 'null', 0, 0.0],
    ['STRINGS', 'FIRST LETTER COMBINER', 'Input a string and frame a word by joining all the first characters of each word. \nSample Input: Sharp Is Knife Edge \nSample Output: SIKE', 'EASY', 'null', 0, 0.0],
    ['STRINGS', 'CHARACTER OCCURANCE', 'Input a string and print the character that occurs the most number of times in it and find the word with the most number of vowels in it. \nSample Input: Bonjour monsieur \nSample Output: Most repeated character: o \nMaximum vowels: monsieur', 'MODERATE', 'null', 0, 0.0],
    ['STRINGS', 'CHARACTER FREQUENCY', 'Input a string and calculate and display the frequency of each alphabet in it. \nSample Input: all the way \nSample Output: a-2 e-1 h-1 l-2 t-1 y-1', 'ADVANCED', 'null', 0, 0.0],
    ['STRINGS', 'REPETITION REMOVAL', 'Input a word and display the word after removing all repeated alphabets from it. \nSample Input: applications \nSample Output: aplictons', 'ADVANCED', 'null', 0, 0.0],
    ['STRINGS', 'UNIQUE STRING', 'Input a string and check if it is UNIQUE. A Unique String is one in which there are no repeated alphabets. \nSample Input: COMPUTER \nSample Output: Unique String', 'ADVANCED', 'null', 0, 0.0],
    ['STRINGS', 'PALINDROME STRING - II', 'Input a word and make it palindrome. \nSample Input: APPLE \nSample Output: APPLEELPPA', 'ADVANCED', 'null', 0, 0.0],
    ['Strings', 'VOWELS - IV (lost count by now)', 'Input a string and display the frequency of vowels in each word in the string. \nSample Input: Running Arnold \nSample Output: Vowels in Running: 2 Vowels in Arnold: 2', 'VERY ADVANCED', 'null', 0, 0.0],
    ['STRINGS', 'PATTERN - I', 'Create the following pattern:', 'LEGENDARY', 'assets/images/21.jpg', 0, 0.0],
    ['STRINGS', 'PATTERN - II', 'Create this pattern:', 'LEGENDARY', 'assets/images/22.jpg', 0, 0.0],
    ['STRINGS', 'PATTERN - III', 'Create this pattern:', 'LEGENDARY', 'assets/images/23.jpg', 0, 0.0],
    ['STRINGS', 'PATTERN - IV', 'Create this pattern:', 'LEGENDARY', 'assets/images/24.jpg', 0, 0.0],
    ['1-D ARRAYS', 'MIN MAX NUMBER - I', 'Hard code 10 different numbers in an array and display the greatest and smallest number of them all.', 'EASY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'NUMBER SEARCH', 'Input 10 numbers into an array and search whether a given number (which is also input) is present in the array or not.', 'EASY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'SUM & AVERAGE', 'Input 10 numbers into an array and find the sum and average of the numbers in it.', 'EASY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'UNO REVERSE', 'Input 10 numbers into an array and then store all these numbers in the reverse format in another array.', 'EASY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'TABLE MAKER', 'Input 10 different country names and their capitals in 2 different arrays and display this info in the following order: ', 'EASY', 'assets/images/29.jpg', 0, 0.0],
    ['1-D ARRAYS', 'SUM - II', 'Input 10 different numbers and find and display the sum of all the even numbers and all the odd numbers separately', 'EASY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'NAME SEARCH', 'Input 10 different names in an array and find if a particular name is present in it or not.', 'EASY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'AVERAGE - II', 'Create 4 arrays of size 10. The first array consists of names of students. The second array consists of every corresponding student\'s marks in Physics. The third array consists of Biology marks and the fourth array consists of Chemistry marks. Calculate the average of these three subjects for every student and display it along with the name of the student.', 'MODERATE', 'null', 0, 0.0],
    ['1-D ARRAYS', 'TEMPERATURE CONVERTER', 'Input 10 entries of temperature in degree celsius. Now convert each one into Farenheit and store them in the same array and display. C=(5/9)*(F-32)', 'MODERATE', 'null', 0, 0.0],
    ['1-D ARRAYS', 'PRIME FINDER', 'Input 10 different numbers and find and display all the prime numbers in the array', 'MODERATE', 'null', 0, 0.0],
    ['1-D ARRAYS', 'PALINDROME STRINGS', 'Input 10 different words in an array and display only those words that are palindromes.', 'MODERATE', 'null', 0, 0.0],
    ['1-D ARRAYS', 'ALPAT JHALPAT', 'Input 10 different words in an array and display only those words which begin with a consonant but end with a vowel. Eg.: Pizza', 'MODERATE', 'null', 0, 0.0],
    ['1-D ARRAYS', 'CONSECUTIVE NUMBERS', 'Input 10 different numbers and find and display all those numbers that are consecutive. eg. 78 79, 35 36 37', 'ADVANCED', 'null', 0, 0.0],
    ['1-D ARRAYS', 'ARRAY JOINER', 'Create an integer array of size 6 and another integer array of size 4 and input numbers in them. Now create an array which will contain numbers from both the arrays with the numbers of the first array followed by the numbers of the second array.', 'VERY ADVANCED', 'assets/images/38.jpg', 0, 0.0],
    ['1-D ARRAYS', 'NEW WORD CREATION', 'Input 5 different words in an array and fetch the first letter of each word and form a new word using these letters by arranging them in ascending order. \nSample Input: ["hi","i","am","ethan","bradberry"] \nSample Output: abehi', 'VERY ADVANCED', 'null', 0, 0.0],
    ['1-D ARRAYS', 'ARRAY <=> STACK', 'Create an array of size 10 and make it behave like a stack. (Theory: Stack is a data structure that follows the LAST IN FIRST OUT principle. Which means, the last item to be inserted into a stack is the first one to be deleted from it.)', 'LEGENDARY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'EVEN & ODD', 'Define a DDA of size 3*3 and calculate the sum of all even numbers and the product of all odd numbers', 'EASY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'MARKS MATRIX', 'Have a DDA for three subjects PHYSICS, BIOLOGY, CHEMISTRY for 5 students. Now take input a subject and a student number and display the marks of the student for that subject.', 'EASY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'MATRIX PRINTING', 'Define a DDA and display: \n1. all the digits on its diagonal; \n2. all digits in the lower triangle; \n3. all digits in the upper triangle.', 'MODERATE', 'assets/images/43.jpg', 0, 0.0],
    ['2-D ARRAYS', 'SUM - I', 'Define a DDA and find the sum of all of its elements.', 'EASY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'MAXIMUM & MINIMUM', 'Define a DDA and find the highest and lowest of all of its elements.', 'EASY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'SUM - II', 'Define a DDA and find the sum of elements in each row and column.', 'EASY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'DAMN ITS GETTIN HOT', 'Define a matrix which has the records for the min and max temperatures for 7 days of a week. Now, take any day of the week as an input and display its min and max temperatures.', 'EASY', 'null', 0, 0.0],
    ['2-D ARRAYS', 'SUM - III', 'Define 2 matrices and carry out matrix addition and store it in a new matrix.', 'MODERATE', 'null', 0, 0.0],
    ['2-D ARRAYS', 'MULTIPLICATION', 'Define 2 matrices and carry out matrix multiplication and store it in a new matrix.', 'ADVANCED', 'null', 0, 0.0],
    ['2-D ARRAYS', 'REGINA\'s HOTEL', 'Define a DDA for all the rooms in Reginas hotel. Now whenever a new customer arrives, assign a hotel room to them. There are 5 floors with 3 rooms on each floor. So, the first customer gets room number 101. The fourth customer gets room number 201.', 'ADVANCED', 'null', 0, 0.0],
    ['2-D ARRAYS', 'SYMMETRIC MATRIX', 'Define a 3*3 DDA and check if it is a symetric matrix.', 'VERY ADVANCED', 'null', 0, 0.0],
    ['2-D ARRAYS', 'POKEMON - I', 'Create a game where Pikachu can move anywhere in a 10*10 matrix. Prevent him from going beyond the matrix sides. Input keys are A - for left; D - for right; S - for down; W - for up. P indicates the position of Pikachu and _ indicates every other position. Pikachu\'s starting position is (0,0)', 'LEGENDARY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'LIBRARY SYSTEM', 'Create a software for a library that has a collection of books. The software should display the following options: \n1. Display all books \n2. Issue a book \n3. Return a book \n4. Add a book to the library \n5. Remove a book from the library. Note: Every book has one author. A user can only issue 3 books at a time. Only a librarian can have access to options 4 and 5 so, have a password system in place.', 'LEGENDARY', 'null', 0, 0.0],
    ['1-D ARRAYS', 'BANKING SYSTEM', 'Create a software for the \'TAKE MY MONEY BANK\'. The bank should offer the following options: 1. Allow a user to open an account by entering the users name 2. Deposit money 3. Withdraw money.', 'ADVANCED', 'null', 0, 0.0],
    ['1-D ARRAYS', 'TICKET BOOKING SYSTEM', 'Create a software for an airline booking system. They previously had bad programmers so they are now asking you to do it! There are 200 total seats in an airplane. First 50 seats are first class costing 20,000 rupees per seat. Next 50 seats are business class costing 15,000 rupees per seat. The last 100 seats are economy class costing 10,000 per seat. Everytime, give an option to the user to choose the number of seats they want and print the bill. The next time someone tries to book a seat, previously booked seats shouldn\'t be available.', 'LEGENDARY', 'null', 0, 0.0],
    ['FUNCTIONS', 'SUM - I', 'Accept 2 integers and pass them to a function that calculates their sum, difference, product and quotient and prints them.', 'EASY', 'null', 0, 0.0],
    ['FUNCTIONS', 'SUM - II', 'Accept 2 integers and pass them to a function that calculates their sum and returns it to the caller function. Now display the returned value.', 'EASY', 'null', 0, 0.0],
    ['FUNCTIONS', 'SUM - III', 'Accept 2 integers and pass them to a function that calculates their sum, difference, product. Now create a function called display() to whom you have to pass these calculated values to print.', 'EASY', 'null', 0, 0.0],
    ['FUNCTIONS', 'AREY AREY', 'Create an array in main() and pass it to a function input_data() that accepts input into the array. Now display its contents in main().', 'EASY', 'null', 0, 0.0],
    ['FUNCTIONS', 'STRING DATING', 'Accept 2 strings and pass them to a function that concats them. Display the result using a new function called display().', 'EASY', 'null', 0, 0.0],
    ['FUNCTIONS', 'PRIME FUNCTION', 'Accept a number and pass it to a function that finds if its prime and returns 1 if yes else 0. Display the result in main().', 'EASY', 'null', 0, 0.0],
    ['FUNCTIONS', 'CUBE FINDER', 'Write a program to input 10 numbers. Use a function to find and print the cube of each number.', 'MODERATE', 'null', 0, 0.0],
    ['FUNCTIONS', 'NUMBER FINDER', 'Accept a number and and an array in main and pass them to a function that finds if the number is present in the array or not and returns 1 if yes else 0. Display the result in main().', 'MODERATE', 'null', 0, 0.0],
    ['FUNCTIONS', 'FUNCTION OVERLOADING', 'Design a class to overload a function compare() as follows: \n(i) void compare(int, int): to compare two integers values print the greater of the two integers. \n(ii) void compare(char, char): to compare the numeric value of two characters and print with the higher numeric value. \n(iii) void compare(String, String): to compare the length of the two strings and print the longer of the two. (Theory: Function overloading or method overloading is the ability to create multiple functions of the same name with different parameter lists.)', 'EASY', 'null', 0, 0.0],
    ['OOP', 'SUM - I', 'Accept two integers and find their sum using the following info- global variables- int a, int b; functions- \n(i) void inputdata(): to input both the values \n(ii) void calculate(): to find the sum \n(iii) void display(): to print the sum.', 'EASY', 'null', 0, 0.0],
    ['OOP', 'STRING REVERSE', 'Write a program using the following info- Data members/global variables- String str, String rev; Member Functions- \\n(i) void getstr(): to input a string \n(ii) void reverse(): to reverse and print each word. \nSample Input: Alles Klar \nSample Output: ralK sellA', 'EASY', 'null', 0, 0.0],
    ['OOP', 'FIND A VOWEL', 'Write a program using the following info- Data members/global variables- String s, int c (to count the vowels); Member Functions- \n(i) void getstr(): to input a string \n(ii) void getvowel(): to count the number of vowels \n(iii) void display(): to print the number of vowels.', 'EASY', 'null', 0, 0.0],
    ['OOP', 'BIKE STORE', 'Use the following info- global variables- int bno: stores the bike number, String name: stores the owners name, int days: stores the number of days the bike was rented, int charge: to calc and store the rental charge; functions- \n(i) void inputdata(): to input all info except the charge \n(ii) void compute(): to find the rental charge according to the following guidelines: for the first five days, charge is 500 per day; for the next 5 days, the charge is 400 per day and for the remaining days, the charge is 200 per day; \n(iii) void display(): to display all info.', 'EASY', 'null', 0, 0.0],
    ['OOP', 'AREA - I', 'Use the following info- functions- \n(i) void inputdata(): to input length and breadth of a rectangle \n(ii) void compute(): to find the area of the rectangle \n(iii) void display(): to display the calculated area.', 'MODERATE', 'null', 0, 0.0],
    ['OOP', 'SQUARE SERIES', 'Write a program to calculate the sum of the series 1^2 + 2^3 + 3^4 + 4^5 +... Use the following info: global variables- int sum, int n (stores the number of terms in the series); functions- \n(i) void input(): this function takes the input for the number of terms in the series \n(ii) int square(): this function calculates the square of the number passed to it \n(iii) void summation(): this function calculates the sum and stores it in the global variable sum \n(iv) void display(): this function displays the sum.', 'MODERATE', 'null', 0, 0.0],
    ['OOP', 'LIBRARY SYSTEM - II', 'Convert your library program(From 1-D ARRAYS chapter) into an object oriented program.', 'ADVANCED', 'null', 0, 0.0],
    ['OOP', 'AVERAGE', 'Print the average of three numbers entered by the user having a method to input the variables and another to calculate and print the average.', 'EASY', 'null', 0, 0.0],
    ['NUMBERS & OOP', 'UGLY NUMBER', 'Write a Java program to check whether a given number is an ugly number. In number system, ugly numbers are positive numbers whose only prime factors are 2, 3 or 5. First 10 ugly numbers are 1, 2, 3, 4, 5, 6, 8, 9, 10, 12. For example, let us see how to check for 300 is ugly or not. Greatest divisible power of 2 is 4, after dividing 300 by 4 we get 75. Greatest divisible power of 3 is 3, after dividing 75 by 3 we get 25. Greatest divisible power of 5 is 25, after dividing 25 by 25 we get 1. Since we get 1 finally, 300 is ugly number. \nSample Input: Input an integer number: 235 \nSample Output : It is not an ugly number. Global Variables: int n - to input the number; functions: void input(), void calculate(), void display()', 'EASY', 'null', 0, 0.0],
    ['NUMBERS & OOP', 'PERFECT NUMBER', 'Write a Java program to check whether a given number is a perfect number. Perfect number is a positive integer that is equal to the sum of its proper divisors. The smallest perfect number is 6, which is the sum of 1, 2, and 3. Other perfect numbers are 28, 496, and 8128. \nGlobal Variables: int n - to input the number; \nfunctions: void input(), void calculate(), void display()', 'EASY', 'null', 0, 0.0],
    ['NUMBERS & OOP', 'ARMSTRONG NUMBER', 'Write a Java program to check whether a given number is an armstrong number. Armstrong number is a number that is equal to the sum of cubes of its digits. For example 0, 1, 153, 370, 371 and 407 are the Armstrong numbers. \nGlobal Variables: int n - to input the number; \nfunctions: void input(), void calculate(), void display()', 'MODERATE', 'null', 0, 0.0],
    ['NUMBERS & OOP', 'HAPPY NUMBER', 'Write a Java program to check whether a given number is a happy number. The happy number can be defined as a number which will yield 1 when it is replaced by the sum of the square of its digits repeatedly. Eg: 32 -> 3^2+2^2=13 -> 1^2+3^2=10 -> 1^2+0^2=1 == HAPPY. Maximum iterations = 100. If even after 100 iterations, the sum isnt 1, then it is an unhappy number. \nGlobal Variables: int n - to input the number; \nfunctions: void input(), void calculate(), void display()', 'ADVANCED', 'null', 0, 0.0],
    ['NUMBERS & OOP', 'DISARIUM NUMBER', 'Write a Java program to check whether a given number is a disarium number. A Disarium number is a number defined by the following process: Sum of its digits powered with their respective position is equal to the original number. For example 175 is a Disarium number: As 1^1+7^2+5^3 = 175. Some other DISARIUM are 89, 175, 518. \nGlobal Variables: int n - to input the number; \nfunctions: void input(), void calculate(), void display()', 'VERY ADVANCED', 'null', 0, 0.0],
  ];
}