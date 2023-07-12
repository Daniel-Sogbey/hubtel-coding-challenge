import 'package:flutter/material.dart';
import 'package:hubtel_code_challenge/models/card_item_model.dart';

class CardItem extends StatelessWidget {
  CardItemModel cardItemModel;

  CardItem({Key? key, required this.cardItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, right: 10, top: 10, left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cardItemModel.time),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        cardItemModel.avatar,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardItemModel.accountType,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cardItemModel.number,
                          style: TextStyle(
                            color: Colors.grey[500]!,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 0, right: 8, top: 10, left: 16),
                    // width: MediaQuery.of(context).size.width * 0.3,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 7),
                    decoration: BoxDecoration(
                        color: cardItemModel.status == "Successful"
                            ? Colors.green[50]
                            : Colors.red[300],
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: cardItemModel.status == "Successful"
                                ? Colors.green[50]!
                                : Colors.red[300]!)),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: cardItemModel.status == "Successful"
                                ? Colors.green
                                : Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: cardItemModel.status == "Successful"
                                  ? Colors.green
                                  : Theme.of(context).colorScheme.error,
                            ),
                          ),
                          child: Icon(
                            cardItemModel.status == "Successful"
                                ? Icons.check
                                : Icons.close,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          cardItemModel.status,
                          style: TextStyle(
                            color: cardItemModel.status == "Successful"
                                ? Colors.green
                                : Colors.red[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "GHS ${cardItemModel.amount}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(cardItemModel.type),
              const SizedBox(
                width: 15,
              ),
              Text(
                "•",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text("Cool your heart wai")
            ],
          )
        ],
      ),
    );
  }
}
