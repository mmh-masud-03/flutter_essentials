import 'package:flutter/material.dart';

// First, create these ARB files in lib/l10n directory:
// app_en.arb:
/*
{
  "welcomeMessage": "Welcome to Flutter",
  "@welcomeMessage": {
    "description": "The main welcome message"
  },
  "selectLanguage": "Select Language",
  "@selectLanguage": {
    "description": "Language selection prompt"
  },
  "helloWorld": "Hello World",
  "@helloWorld": {
    "description": "A greeting message"
  },
  "itemCount": "{count,plural, =0{No items} =1{1 item} other{{count} items}}",
  "@itemCount": {
    "placeholders": {
      "count": {
        "type": "num",
        "format": "compact"
      }
    }
  }
}
*/

// app_bn.arb:
/*
{
  "welcomeMessage": "ফ্লাটারে স্বাগতম",
  "selectLanguage": "ভাষা নির্বাচন করুন",
  "helloWorld": "ওহে বিশ্ব",
  "itemCount": "{count,plural, =0{কোন আইটেম নেই} =1{১টি আইটেম} other{{count}টি আইটেম}}"
}
*/

class InternationalizationScreen extends StatelessWidget {
  const InternationalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Internationalization (i18n)',),
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeader(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildGuideCard(context),
                const SizedBox(height: 16),
                _buildCodeExamples(context),
                const SizedBox(height: 16),
                _buildLiveDemo(context),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showDownloadDialog(context);
        },
        icon: const Icon(Icons.code),
        label: const Text('Get Code'),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flutter Internationalization Guide',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Learn how to make your Flutter app support multiple languages including Bangla (বাংলা)',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepTitle(context, '1', 'Project Setup'),
            _buildCodeBlock('''
# pubspec.yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.0

flutter:
  generate: true

# l10n.yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart'''),
            const SizedBox(height: 24),

            _buildStepTitle(context, '2', 'Create ARB Files'),
            _buildCodeBlock('''
// lib/l10n/app_en.arb
{
  "welcomeMessage": "Welcome to Flutter",
  "selectLanguage": "Select Language",
  "helloWorld": "Hello World"
}

// lib/l10n/app_bn.arb
{
  "welcomeMessage": "ফ্লাটারে স্বাগতম",
  "selectLanguage": "ভাষা নির্বাচন করুন",
  "helloWorld": "ওহে বিশ্ব"
}'''),
            const SizedBox(height: 24),

            _buildStepTitle(context, '3', 'Configure MaterialApp'),
            _buildCodeBlock('''
MaterialApp(
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en', ''), // English
    Locale('bn', ''), // Bangla
  ],
)'''),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeExamples(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Implementation Examples',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildImplementationStep(
              context,
              title: 'Basic Usage',
              code: '''
// In any widget:
Text(AppLocalizations.of(context)!.welcomeMessage)''',
            ),
            _buildImplementationStep(
              context,
              title: 'Plurals Support',
              code: '''
// In ARB file:
{
  "itemCount": "{count,plural, =0{No items} =1{1 item} other{{count} items}}"
}

// In widget:
Text(AppLocalizations.of(context)!.itemCount(5))''',
            ),
            _buildImplementationStep(
              context,
              title: 'Language Switching',
              code: '''
class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  
  Locale get locale => _locale;
  
  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}''',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImplementationStep(
      BuildContext context, {
        required String title,
        required String code,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        _buildCodeBlock(code),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildLiveDemo(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Example',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _LanguageButton(
                  language: 'English',
                  languageCode: 'en',
                  nativeText: 'English',
                  onPressed: () {
                    // TODO: Implement language change
                  },
                ),
                _LanguageButton(
                  language: 'Bangla',
                  languageCode: 'bn',
                  nativeText: 'বাংলা',
                  onPressed: () {
                    // TODO: Implement language change
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildPreviewCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preview:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome Message: Welcome to Flutter / ফ্লাটারে স্বাগতম',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            'Hello World: Hello World / ওহে বিশ্ব',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildStepTitle(BuildContext context, String number, String title) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: SelectableText(
        code,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 12,
          height: 1.5,
        ),
      ),
    );
  }

  void _showDownloadDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Download Sample Code'),
        content: const Text(
          'This will download a complete sample project with internationalization setup including Bangla language support.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement download functionality
              Navigator.pop(context);
            },
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String language;
  final String languageCode;
  final String nativeText;
  final VoidCallback onPressed;

  const _LanguageButton({
    required this.language,
    required this.languageCode,
    required this.nativeText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        foregroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            language,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            nativeText,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}