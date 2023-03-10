import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_sample/widgets/list_item.dart';

import '../data/blog_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

int buildTimes = 0;
int listCount = 0;
final List<bool> isClicked = List.generate(blogs.length, (i) => false);

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    buildTimes += 1;
    log('Build method called: $buildTimes ');
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 14, right: 24),
          child: Column(
            children: [
              const Text('Performance is key'),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.amberAccent,
                  child: const Center(
                    child: Text('Just a container that should be called once'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: blogs.length,
                  itemBuilder: (context, index) {
                    return ListItem(blogs: blogs, index: index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listItem(int index) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(12),
      color: !isClicked[index] ? Colors.pink : Colors.purple,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blogs[index].title,
                style: const TextStyle(fontSize: 24),
              ),
              Text(blogs[index].body),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              log('Paint bush clicked at index $index');
              setState(() {
                isClicked[index] = !isClicked[index];
              });
            },
            child: const Icon(Icons.brush_rounded),
          ),
        ],
      ),
    );
  }
}
