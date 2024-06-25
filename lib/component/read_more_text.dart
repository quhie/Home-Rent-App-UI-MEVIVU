import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLength;

  ReadMoreText({required this.text, this.trimLength = 100});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.length <= widget.trimLength || _isExpanded) {
      return Text(widget.text);
    }

    String trimmedText = widget.text.substring(0, widget.trimLength) + "...  ";
    String remainingText = widget.text.substring(widget.trimLength);

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: trimmedText),
          TextSpan(
            text: 'See more',
            style: TextStyle(
              color: Color(0xFF0A8ED9),
              fontFamily: 'Raleway',
            ),
            recognizer: TapGestureRecognizer()..onTap = _toggleExpanded,
          ),
        ],
      ),
    );
  }
}
