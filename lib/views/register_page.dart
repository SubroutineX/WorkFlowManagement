import 'package:flutter/material.dart';

import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/styles.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  List<Step> steps = [
    Step(
      title: Text(
        'Step 1',
        style: formFieldStyle,
      ),
      isActive: true,
      state: StepState.indexed,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
            1,
            Text(
              "Name",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          FadeAnimation(
            2,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: TextFormField(
                style: formFieldStyle,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                    hintStyle: hintStyle),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeAnimation(
            3,
            Text(
              "Username",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          FadeAnimation(
            4,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: TextFormField(
                style: formFieldStyle,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Username",
                  hintStyle: hintStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.indexed,
      title: Text(
        'Step 2',
        style: formFieldStyle,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
            1,
            Text(
              "Email",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          FadeAnimation(
            2,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: TextFormField(
                style: formFieldStyle,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: hintStyle),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeAnimation(
            3,
            Text(
              "Password",
              style: labelStyle,
            ),
          ),
          SizedBox(height: 10),
          FadeAnimation(
            4,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.white),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                style: formFieldStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: hintStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.blueAccent,
                          child: currentStep < steps.length - 1
                              ? Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                )
                              : Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ),
                          onPressed: () {
                            setState(
                              () {
                                if (currentStep < steps.length - 1) {
                                  currentStep = currentStep + 1;
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        FlatButton(
                          color: currentStep > 0
                              ? Colors.white
                              : Color(0xffcccccc),
                          child: currentStep > 0
                              ? Text(
                                  "Back",
                                  style: TextStyle(color: Colors.blueAccent),
                                )
                              : Text(
                                  "Back",
                                  style: TextStyle(color: Colors.black38),
                                ),
                          onPressed: () {
                            setState(
                              () {
                                if (currentStep > 0) {
                                  currentStep = currentStep - 1;
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
