import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: StepperDemo()));

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});
  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stepper Demo')),
      body: Stepper(
        currentStep: _currentStep,

        type: StepperType.vertical,

        onStepContinue: () {
          if (_currentStep < 2) setState(() => _currentStep++);
        },
        
        onStepCancel: () {
          if (_currentStep > 0) setState(() => _currentStep--);
        },

        onStepTapped: (step) => setState(() => _currentStep = step),

        steps: [
          Step(
            title: const Text('Step One'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            content: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(24),
              child: const Text('Hello from Step 1!',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),

          Step(
            title: const Text('Step Two'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            content: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(24),
              child: const Text('Hello from Step 2!',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),

          Step(
            title: const Text('Step Three'),
            isActive: _currentStep >= 2,
            state: StepState.indexed,
            content: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(24),
              child: const Text('Hello from Step 3!',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}