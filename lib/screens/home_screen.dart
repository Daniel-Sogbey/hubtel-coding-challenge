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
        avatar: "images/absa.png",
        accountType: "Absa Bank",
        amount: 500,
        status: "Failed",
        time: "14:45PM"),
    CardItemModel(
        number: "055 815 9629",
        type: "other",
        avatar: "images/momo.jpeg",
        accountType: "Emmanuel Rockson",
        amount: 500,
        status: "Successful",
        time: "14:45PM"),
    CardItemModel(
        number: "055 815 9629",
        type: "other",
        avatar: "images/momo.jpeg",
        accountType: "Emmanuel Rockson",
        amount: 500,
        status: "Successful",
        time: "14:45PM"),
  ];

  String _action = "history";

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

    Future.delayed(const Duration(seconds: 1), () {
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
        title: Container(
          margin: const EdgeInsets.only(
              // left: 10.0,
              // bottom: 20,
              // right: 10.0,
              ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: const Color(0xFFCCCCCC),
          ),
          child: Container(
            // width: MediaQuery.of(context).size.width * 1,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              // color: const Color(0xFFCCCCCC),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _action = "history";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _action == "history"
                          ? Colors.white
                          : Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "History",
                          style: TextStyle(
                            color: _action == "history"
                                ? Colors.black
                                : Colors.grey[500],
                            fontSize: _action != "ts" ? 16 : 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _action = "ts";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 13,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _action == "ts" ? Colors.white : Colors.grey[100],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Transaction Summary",
                          style: TextStyle(
                            color: _action == "ts"
                                ? Colors.black
                                : Colors.grey[500],
                            fontSize: _action != "ts" ? 14 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: LoadingSpinner(),
            )
          : SafeArea(
              child: _action == "history"
                  ? HistoryScreen(cardItems: cardItems)
                  : TransactionSummaryScreen(),
            ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.teal[300],
          onPressed: () {},
          label: const Row(
            children: [
              Icon(
                Icons.add_circle_outlined,
                color: Colors.white,
              ),
              SizedBox(width: 5),
              Text(
                "SEND NEW",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  List<CardItemModel> cardItems;

  HistoryScreen({required this.cardItems});

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
                    bottom: 0, right: 10, top: 10, left: 10),
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
              return CardItem(cardItemModel: widget.cardItems[index]);
            },
            // 40 list items
            childCount: widget.cardItems.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 50,
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
