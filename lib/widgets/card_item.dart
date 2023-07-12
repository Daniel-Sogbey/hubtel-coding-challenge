import 'package:flutter/material.dart';
import 'package:hubtel_code_challenge/models/card_item_model.dart';

class CardItem extends StatelessWidget {

  CardItemModel cardItemModel;

 CardItem({Key? key, required this.cardItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, right: 10, top: 10, left: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("14.45PM"),
          Row(
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Absa Bank",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "055 815 9629",
                    style: TextStyle(
                      color: Colors.grey[500]!,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 6,
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 0, right: 10, top: 10, left: 20),
                    // width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.red[300]!)),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Failed",
                          style: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 9,),
                  Text("GHS 500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person,
                color: Colors.blueAccent,),
              ),
              SizedBox(
                width: 15,
              ),
              Text("Personal"),
              SizedBox(
                width: 15,
              ),
              Text(
                "•",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text("Cool your heart wai")
            ],
          )
        ],
      ),
    );
  }
}
