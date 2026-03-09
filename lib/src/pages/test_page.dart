import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<int> items = List.generate(10, (index) => index);
  List<int> items2 = List.generate(10, (index) => index);

  late TextEditingController _nameController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'John Doe');
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print("Scrolling...");
    });
  }

  Future<void> _submitForm() async {
    // 模拟网络请求
    await Future.delayed(const Duration(seconds: 2));

    // 经典错误：在 await 之后直接使用 context，没有检查 mounted
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('提交成功!')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: ListView(
        children: [
          Row(children: items.map((e) => Text(e.toString())).toList()),
          Row(children: items2.map((e) => Text(e.toString())).toList()),
          TextField(controller: _nameController),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
