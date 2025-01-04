import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/code_viewer.dart';

class ExpandableSection {
  static Widget buildExpandableSection(
      BuildContext context, {
        required String title,
        required Widget widget,
        required String description,
        required String codeUrl,
        Color? backgroundColor,
        Color? expandedBackgroundColor,
        BorderRadius? borderRadius,
        EdgeInsetsGeometry contentPadding = const EdgeInsets.all(16.0),
        TextStyle? titleStyle,
        TextStyle? descriptionStyle,
        Duration animationDuration = const Duration(milliseconds: 200),
        bool initiallyExpanded = false,
        List<Widget>? actions,
        Widget? trailing,
        bool showDivider = true,
        bool enableInteraction = true,
        Widget Function(Widget)? widgetWrapper,
      }) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            backgroundColor: backgroundColor ?? theme.cardColor,
            collapsedBackgroundColor: backgroundColor ?? theme.cardColor,
            maintainState: true,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ??
                        theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                          fontSize: 16,
                        ),
                  ),
                ),
                if (actions != null) ...actions,
                if (trailing != null) trailing,
              ],
            ),
            children: [
              if (showDivider)
                Divider(height: 1, color: theme.dividerColor),
              AnimatedContainer(
                duration: animationDuration,
                color: expandedBackgroundColor ?? theme.cardColor,
                child: Padding(
                  padding: contentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: descriptionStyle ??
                            theme.textTheme.bodyLarge?.copyWith(
                              color: theme.textTheme.bodyMedium?.color,
                              height: 1.5,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: theme.dividerColor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AbsorbPointer(
                            absorbing: !enableInteraction,
                            child: widgetWrapper?.call(widget) ?? widget,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (codeUrl.trim().isNotEmpty)
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () => _showCodeDialog(context, codeUrl, title),
                            icon: const Icon(Icons.code),
                            label: const Text('View Source Code'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void _showCodeDialog(
      BuildContext context,
      String codeUrl,
      String title,
      ) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: Container(
          width: screenSize.width * 0.92,
          height: screenSize.height * 0.85,
          decoration: BoxDecoration(
            color: theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDialogHeader(context, title),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: CodeViewer(codeUrl: codeUrl),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildDialogHeader(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Source Code - $title',
              maxLines: 2,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.close, color: theme.colorScheme.onPrimary),
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Close',
              splashRadius: 24,
            ),
          ),
        ],
      ),
    );
  }
}