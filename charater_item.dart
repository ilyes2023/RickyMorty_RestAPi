import 'package:flutter/material.dart';
import 'package:ricky_morty_api/DATA/model/character.dart';
import 'package:ricky_morty_api/UI/screen/details.dart';

class CharachterItem extends StatelessWidget {
  const CharachterItem({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsetsDirectional.all(4),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => DetailsScreen(character: character)));
        },
        child: GridTile(
            footer: Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              color: Colors.black54,
              child: Text(
                maxLines: 1,
                softWrap: true,
                character.name.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: "assets/img/placeholder.png",
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/placeholder.png',
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
            )),
      ),
    );
  }
}
