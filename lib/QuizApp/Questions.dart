class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(
    text: 'What is Flutter?',
    options: [
      const Option(text: 'A programming language', isCorrect: false),
      const Option(text: 'A UI framework', isCorrect: true),
      const Option(text: 'A database management system', isCorrect: false),
      const Option(text: 'A version control system', isCorrect: false),
    ],
  ),
  Question(
    text: 'Which programming language is used in Flutter development?',
    options: [
      const Option(text: 'Java', isCorrect: false),
      const Option(text: 'Swift', isCorrect: false),
      const Option(text: 'Dart', isCorrect: true),
      const Option(text: 'Python', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is the main advantage of Flutter?',
    options: [
      const Option(text: 'Fast performance', isCorrect: true),
      const Option(text: 'Large community support', isCorrect: false),
      const Option(text: 'Compatibility with multiple platforms', isCorrect: false),
      const Option(text: 'Easy integration with backend systems', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is the widget tree in Flutter?',
    options: [
      const Option(text: 'A data structure for storing user input', isCorrect: false),
      const Option(text: 'A representation of the UI hierarchy', isCorrect: true),
      const Option(text: 'A method for handling HTTP requests', isCorrect: false),
      const Option(text: 'A tool for managing state in the app', isCorrect: false),
    ],
  ),
  Question(
    text: 'Which IDE is commonly used for Flutter development?',
    options: [
      const Option(text: 'Visual Studio Code', isCorrect: true),
      const Option(text: 'Eclipse', isCorrect: false),
      const Option(text: 'Xcode', isCorrect: false),
      const Option(text: 'Android Studio', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is a StatelessWidget in Flutter?',
    options: [
      const Option(text: 'A widget that can be updated with new data', isCorrect: false),
      const Option(text: 'A widget that cannot be updated once built', isCorrect: true),
      const Option(text: 'A widget that manages state in the app', isCorrect: false),
      const Option(text: 'A widget that defines the overall app structure', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is hot reload in Flutter?',
    options: [
      const Option(text: 'A feature for reloading data from an API', isCorrect: false),
      const Option(text: 'A tool for debugging the app', isCorrect: false),
      const Option(text: 'A mechanism for quickly viewing UI changes during development', isCorrect: true),
      const Option(text: 'A way to optimize app performance', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is the pubspec.yaml file in Flutter used for?',
    options: [
      const Option(text: 'Defining app permissions', isCorrect: false),
      const Option(text: 'Configuring app themes', isCorrect: false),
      const Option(text: 'Managing project dependencies', isCorrect: true),
      const Option(text: 'Specifying app navigation routes', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is the purpose of the setState() method in Flutter?',
    options: [
      const Option(text: 'To update the UI immediately', isCorrect: false),
      const Option(text: 'To manage the app state', isCorrect: false),
      const Option(text: 'To trigger a rebuild of the widget tree', isCorrect: true),
      const Option(text: 'To handle user input events', isCorrect: false),
    ],
  ),
  Question(
    text: 'What is a Flutter widget?',
    options: [
      const Option(text: 'A user interface element', isCorrect: true),
      const Option(text: 'A background process', isCorrect: false),
      const Option(text: 'A network request', isCorrect: false),
      const Option(text: 'A database query', isCorrect: false),
    ],
  ),

];
