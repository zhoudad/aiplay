import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // late 显式声明一个非空的变量，但不初始化
  late TabController _tabController;

  static const List<Tab> _tabs = <Tab>[
    Tab(text: '一首'),
    Tab(text: '飞花'),
    Tab(text: '古今'),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('顶部tab切换'),
        bottom: TabBar(
          // tabs: const <Widget>[
          //   Tab(
          //     icon: Icon(Icons.directions_bike),
          //   ),
          //   Tab(
          //     icon: Icon(Icons.directions_boat),
          //   ),
          //   Tab(
          //     icon: Icon(Icons.directions_bus),
          //   ),
          // ],
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(child: Text('自行车')),
          Center(child: Text('船')),
          Center(child: Text('巴士')),
        ],
      ),
    );
  }
}
