import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'Shivam\'s favourite activity is:',
    'Shivam has fallen in love:.',
    'Shivam prefers to live in the: ',
    'Shivam\'s favourite superhero is: ',
    'Shivam considers himself more of an : ',
    'Shivam wants to settle in: ',
    'Shivam\'s biggest weakness is: ',
    'Shivam has been heart broken ____ in his life. ',
    'Shivam wants to live as an:',
    'Shivam has more faith in:',
    'Your Quiz is complete! You have reached the dead end.'
  ];
  List<String> options = [
    'Programming',
    'Once',
    'Fantasy world',
    'Batman',
    'Engineer',
    'India',
    'Ladies',
    'Once',
    'Environmentalist',
    'God',
    'Get my scores',
    'Thank'
  ];
  List<String> optional = [
    'Sketching',
    'Twice',
    'Real world',
    'Spiderman',
    'Artist',
    'USA',
    'Ignorance',
    'Twice',
    'Entrepreneur',
    'Science',
    'Exit',
    'You'
  ];
  List<int> answers = [0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 2, 2];
  int count = 0;
  int correct = 0;
  int incorrect = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[count],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                options[count],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (answers[count] == 1) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    correct++;
                  } else if (answers[count] == 0) {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    incorrect++;
                  }
                  count += 1;
                  //print(count);
                  if (count >= questions.length - 1) {
                    scoreKeeper = [];
                    count = questions.length - 1;
                    if (questions.length != options.length)
                      questions.add('You know Shivam ' +
                          (correct * 10).toString() +
                          '%.');
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                optional[count],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (answers[count] == 1) {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                    incorrect++;
                  } else if (answers[count] == 0) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                    correct++;
                  }
                  count += 1;
                  if (count >= questions.length - 1) {
                    scoreKeeper = [];
                    count = questions.length - 1;
                    if (questions.length != options.length)
                      questions.add('You know Shivam ' +
                          (correct * 10).toString() +
                          '%.');
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(children: scoreKeeper),
      ],
    );
  }
}
