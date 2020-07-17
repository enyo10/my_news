import 'package:flutter/material.dart';

class StepperListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StepperListViewState();
}

class _StepperListViewState extends State<StepperListView> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stepper(
            physics: ClampingScrollPhysics(),
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepTapped: (stepIndex) {
              setState(() {
                _currentStep = stepIndex;
              });
            },
            onStepContinue: () {
              setState(() {
                _currentStep = _currentStep + 1;
              });
            },
            onStepCancel: () {
              setState(() {
                _currentStep = _currentStep - 1;
              });
            },
            steps: [
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
              Step(
                title: Text('Step'),
                content: TextFormField(),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: OutlineButton(
              onPressed: () {
                print('Pressed!');
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
