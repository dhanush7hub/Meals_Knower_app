import 'package:flutter/material.dart';
import 'package:thecheesechat/models/meal.dart';
import 'package:thecheesechat/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.affordability,
      required this.complexity,
      required this.duration,});

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unkown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
        break;
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      default:
        return 'unkown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
       // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '$duration min',
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        complexityText,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        affordabilityText,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
