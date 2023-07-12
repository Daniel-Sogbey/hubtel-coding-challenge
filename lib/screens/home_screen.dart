import 'package:flutter/material.dart';
import 'package:hubtel_code_challenge/models/card_item_model.dart';
import 'package:hubtel_code_challenge/widgets/card_item.dart';
import 'package:hubtel_code_challenge/widgets/loading_spinner.dart';
import 'package:hubtel_code_challenge/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ['History', 'Transaction Summary'];
  var _isLoading = false;

  final List<CardItemModel> cardItems = [
    CardItemModel(
      number: "055 815 9629",
      type: "Personal",
      avatar: "/images/absa.png",
      accountType: "Absa Bank",
      amount: 500,
      status: "failed",
    ),
    CardItemModel(
      number: "055 815 9629",
      type: "other",
      avatar: "/images/momo.jpg",
      accountType: "Emmanuel Rockson",
      amount: 500,
      status: "successful",
    ),
    CardItemModel(
      number: "055 815 9629",
      type: "other",
      avatar: "/images/momo.jpg",
      accountType: "Emmanuel Rockson",
      amount: 500,
      status: "successful",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  BoxDecoration _buildIndicatorDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      border: Border(bottom: BorderSide(color: Colors.white, width: 2.0)),
    );
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        _isLoading = false;
      });


    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        bottom: TabBar(
          controller: _tabController,
          indicator: _buildIndicatorDecoration(),
          indicatorPadding: EdgeInsets.zero,
          tabs: tabs.map((String tab) {
            return Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      body: _isLoading
          ? Center(
              child: LoadingSpinner(),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                HistoryScreen(cardItems: cardItems),
                TransactionSummaryScreen(),
              ],
            ),
    );
  }
}

class HistoryScreen extends StatefulWidget {

  List<CardItemModel> cardItems;

  HistoryScreen({ required this.cardItems});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController term = TextEditingController();

  var focusNode = FocusNode();
  var _isFocus = false;

  void _onFocusChange() {
    debugPrint("Focus: ${focusNode.hasFocus.toString()}");
    setState(() {
      _isFocus = focusNode.hasFocus;
    });

    debugPrint("IS FOCUS: $_isFocus");
  }



  @override
  initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  void _search(String text) {}

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            children: [
              SearchField(
                focusNode: focusNode,
                title: term,
                search: () => _search(term.text),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_outlined,
                  size: 40,
                ),
              )
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    bottom: 0, right: 10, top: 10, left: 20),
                width: MediaQuery.of(context).size.width * 0.3,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey[200]!)),
                child: Text(
                  "May 24, 2022",
                  style: TextStyle(
                    color: Colors.grey[500]!,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CardItem(cardItemModel : widget.cardItems[index]);
            },
            // 40 list items
            childCount: widget.cardItems.length,
          ),
        ),
      ],
    );
  }
}

class TransactionSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Transaction Summary Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
