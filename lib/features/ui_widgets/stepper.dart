import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final List<String> steps;
  final ValueChanged<int> onStepTapped;

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
      onStepTapped: onStepTapped,
      steps: steps
          .map(
            (step) => Step(
          title: Text(step),
          content: const SizedBox.shrink(),
          isActive: currentStep == steps.indexOf(step),
        ),
      )
          .toList(),
    );
  }
}
