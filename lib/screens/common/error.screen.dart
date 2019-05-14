import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ErrorScreen extends InfoMessageScreen {
  static final Key tryAgainButtonKey = Key('tryAgainButton');

  ErrorScreen({
    String title,
    String description,
    @required VoidCallback onRetry,
  })
      : super(
          actionButtonKey: tryAgainButtonKey,
          title: title ?? 'Oops!',
          description:
              description ?? 'An error occoured.',
          onActionButtonTapped: onRetry,
        );
}

class InfoMessageScreen extends StatelessWidget {
  InfoMessageScreen({
    Key key,
    @required this.title,
    @required this.description,
    this.actionButtonKey,
    this.onActionButtonTapped,
  })
      : super(key: key);

  final Key actionButtonKey;
  final String title;
  final String description;
  final VoidCallback onActionButtonTapped;

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[
      CircleAvatar(
        child: Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 52.0,
        ),
        backgroundColor: Colors.black,
        radius: 42.0,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
        ),
      ),
    ];

    if (onActionButtonTapped != null) {
      content.add(Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: FlatButton(
          key: actionButtonKey,
          onPressed: onActionButtonTapped,
          child: Text(
            'TRY AGAIN',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ));
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: content,
          ),
        ),
      ),
    );
  }
}
