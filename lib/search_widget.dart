import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final ValueChanged<String> inputChanged;
  SearchWidget({@required this.inputChanged});
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _controller = TextEditingController();

  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x44ffffff),
      ),
      child: Row(
        children: [
          IconButton(
            icon: getIcon(_isActive),
            onPressed: () {},
          ),
          Expanded(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
              onChanged: _onChanged,
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(String input) {
    setState(() {
      _isActive = input.isNotEmpty;
    });
    widget.inputChanged(input);
  }

  Widget getIcon(bool active) {
    if (_isActive) {
      return IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {},
      );
    }
    return IconButton(
      icon: Icon(
        Icons.search,
      ),
      onPressed: () {},
    );
  }
}
