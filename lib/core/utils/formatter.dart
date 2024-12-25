import 'package:dart_style/dart_style.dart';

class Formatter{

 static String formatDartCode(String code) {
    try {
      // Create instance of DartFormatter with language version
      final formatter = DartFormatter(
        pageWidth: 80,
        lineEnding: '\n',
        // Specify the Dart language version (e.g., '2.19' or '3.0')
        languageVersion: DartFormatter.latestLanguageVersion,
      );

      // Wrap the code in a function to make it valid Dart code
      String wrappedCode = '''
// @dart=3.0
void main() {
  var widget = $code
}
''';

      // Format the code and extract the widget part
      String formattedCode = formatter.format(wrappedCode);

      // Extract the formatted widget code (remove the wrapper)
      List<String> lines = formattedCode.split('\n');
      lines = lines.sublist(2, lines.length - 1); // Remove first and last lines

      // Remove the 'var widget = ' part from the first line
      if (lines.isNotEmpty) {
        lines[0] = lines[0].replaceFirst('  var widget = ', '');
      }

      // Adjust indentation
      lines = lines.map((line) {
        if (line.startsWith('  ')) {
          return line.substring(2);
        }
        return line;
      }).toList();

      return lines.join('\n');
    } catch (e) {
      // If formatting fails, fall back to basic formatting
      return code.trim();
    }
  }

}