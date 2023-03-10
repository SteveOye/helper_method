import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_sample/model/blog.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
    required this.blogs,
    required this.index,
  });

  final List<Blog> blogs;
  final int index;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      color: !isClicked ? Colors.greenAccent : Colors.deepOrangeAccent,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.blogs[widget.index].title,
                style: const TextStyle(fontSize: 24),
              ),
              Text(widget.blogs[widget.index].body),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              log('Paint bush clicked at index ${widget.index}');
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Icon(Icons.brush_rounded),
          ),
        ],
      ),
    );
  }
}
