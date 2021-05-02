import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'descriptionText.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  NewsItem({this.title, this.imageUrl, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      height: 280,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.cyan, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                // "https://storage.googleapis.com/afs-prod/media/10c1c1f63ea44df8bc6f178ad6a45bc6/3000.jpeg",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 150,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              title,
              // "Police fatally shoot gunman who killed 2 at Wisconsin casino - Associated Press",
              style: TextStyle(color: Colors.cyan),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: DescriptionTextWidget(
              text: description,
              // "GREEN BAY, Wis. (AP) — A gunman opened fire at a Wisconsin tribal casino complex a few miles from Lambeau Field, killing two people and wounding another in what witnesses described as a hailstorm of bullets before police shot him to death. Brown County Sherif…",
            ),
          )
        ],
      ),
    );
  }
}
