import 'package:flutter/material.dart';
import 'package:ricky_morty_api/Constant/colors.dart';
import 'package:ricky_morty_api/DATA/model/character.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.character});
  final Character character;
  String next = '';

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.grey,
          body: CustomScrollView(
            slivers: [
              buildSilverAppBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.fromLTRB(30, 20, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInformationCharaters('Names : ', character.name),
                        buildDviderText(270),
                        buildInformationCharaters(
                            'Species : ', character.species),
                        buildDviderText(260),
                        buildInformationCharaters(
                            'Status : ', character.status),
                        buildDviderText(275),
                        buildInformationCharaters(
                            'Origin : ', character.origin.name),
                        buildDviderText(280),
                        buildInformationCharaters(
                            'Location : ', character.location.name),
                        buildDviderText(255),
                        buildInformationCharaters(
                            'Origin Url : ', character.origin.url),
                        buildDviderText(245),
                        buildInformationCharaters(
                            'Location Url : ', character.location.url),
                        buildDviderText(215),
                        //

                        const SizedBox(
                          height: 200,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          )),
    );
  }

  Widget buildInformationCharaters(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.yallow,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: MyColors.white.withOpacity(0.8),
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSilverAppBar() {
    return SliverAppBar(
      pinned: true,
      foregroundColor: MyColors.yallow,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))],
      expandedHeight: 500,
      backgroundColor: MyColors.grey,
      // floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          character.name,
          style: TextStyle(color: MyColors.white, fontWeight: FontWeight.bold),
        ),
        background: Image.network(
          character.image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget buildDviderText(double width) {
    return Divider(
      color: MyColors.yallow.withOpacity(0.6),
      endIndent: width,
      thickness: 2,
    );
  }
}
