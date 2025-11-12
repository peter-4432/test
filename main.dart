import 'dart:io';

void main() {
  print("=== Welcome to the Text Tool ===\n");

  // Get text from user
  print("Please type some text:");
  String? userText = stdin.readLineSync();

  // Check if user entered anything
  if (userText == null || userText.isEmpty) {
    print("You didn't type anything. The program will now close.");
    return;
  }

  // Working with text
  print("\n--- Text Results ---");
  String modifiedText = userText + " - completed";
  print("Modified text: $modifiedText");
  
  print("Your text has ${userText.length} letters");
  
  if (userText.length >= 5) {
    print("First 5 letters: ${userText.substring(0, 5)}");
  }
  
  print("SHOUTING VERSION: ${userText.toUpperCase()}");
  print("quiet version: ${userText.toLowerCase()}");
  
  // Flip the text backwards
  String backwardsText = userText.split('').reversed.join('');
  print("Backwards: $backwardsText");

  // Working with words
  print("\n--- Word Results ---");
  List<String> words = userText.split(' ');
  print("All words: $words");
  
  // Remove duplicate words
  Set<String> uniqueWords = words.toSet();
  print("Unique words: $uniqueWords");
  
  // Show word lengths
  Map<String, int> wordLengths = {};
  for (var word in uniqueWords) {
    wordLengths[word] = word.length;
  }
  print("Word lengths: $wordLengths");

  // Working with dates
  print("\n--- Date Results ---");
  DateTime currentTime = DateTime.now();
  print("Right now: $currentTime");
  
  // Future and past dates
  DateTime nextWeek = currentTime.add(Duration(days: 7));
  DateTime lastWeek = currentTime.subtract(Duration(days: 7));
  print("Next week: $nextWeek");
  print("Last week: $lastWeek");
  
  // Calculate days between dates
  Duration timeBetween = nextWeek.difference(lastWeek);
  print("Days between dates: ${timeBetween.inDays}");

  // Save results to a file
  print("\n--- Saving Results ---");
  
  File resultsFile = File('results.txt');

  // What to save in the file
  String fileContent = """
=== Text Tool Results ===
Your text: $userText
Backwards: $backwardsText
Letter count: ${userText.length}
Unique words: $uniqueWords
Saved on: $currentTime
""";

  // Try to save the file
  try {
    resultsFile.writeAsStringSync(fileContent);
    print("Results saved to 'results.txt'");
  } catch (error) {
    print("Could not save file: $error");
  }

  // Try to read the file back
  try {
    String savedContent = resultsFile.readAsStringSync();
    print("\nSaved file shows:\n$savedContent");
  } catch (error) {
    print("Could not read file: $error");
  }

  print("\n=== All done! ===");

}
