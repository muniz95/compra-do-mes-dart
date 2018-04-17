import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ErrorView extends InfoMessageView {
  static final Key tryAgainButtonKey = new Key('tryAgainButton');

  ErrorView({
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

class InfoMessageView extends StatelessWidget {
  InfoMessageView({
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
      new CircleAvatar(
        child: new Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 52.0,
        ),
        backgroundColor: Colors.black,
        radius: 42.0,
      ),
      new Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Text(
          title,
          style: new TextStyle(fontSize: 24.0),
        ),
      ),
      new Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: new Text(
          description,
          textAlign: TextAlign.center,
        ),
      ),
    ];

    if (onActionButtonTapped != null) {
      content.add(new Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: new FlatButton(
          key: actionButtonKey,
          onPressed: onActionButtonTapped,
          child: new Text(
            'TRY AGAIN',
            style: new TextStyle(color: Colors.green),
          ),
        ),
      ));
    }

    return new SingleChildScrollView(
      child: new Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: content,
          ),
        ),
      ),
    );
  }
}
