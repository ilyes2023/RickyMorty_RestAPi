// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_morty_api/BUSINESS_LOGIC_LAYER/cubit/rickymorty_cubit.dart';
import 'package:ricky_morty_api/Constant/colors.dart';
import 'package:ricky_morty_api/DATA/model/character.dart';
import 'package:ricky_morty_api/UI/screen/details.dart';

import 'package:ricky_morty_api/UI/widget/charater_item.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Character> allCharater = [];
  List<Character> searchCharacter = [];
  bool isSearching = false;
  final searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RickymortyCubit>(context).getAllData();
    // BlocProvider.of<RickymortyCubit>(context).getQuary();
    BlocProvider.of<RickymortyCubit>(context).fetchData();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<RickymortyCubit, RickymortyState>(
      builder: (context, state) {
        if (state is CharacterLoading) {
          allCharater = (state).characters;
          print(allCharater.length);
          return buildLoadedWidget();
        } else {
          return showProgressIndicateor();
        }
      },
    );
  }

  Widget showProgressIndicateor() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildLoadedWidget() {
    return Container(
      color: MyColors.grey,
      child: buildLoadedGridList(),
    );
  }

  Widget buildLoadedGridList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust as needed
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: searchTextController.text.isEmpty
            ? allCharater.length
            : searchCharacter.length,
        itemBuilder: (context, index) {
          return CharachterItem(
            character: searchTextController.text.isEmpty
                ? allCharater[index]
                : searchCharacter[index],
          );
        });
  }

// start working on Searching
  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.grey,
      decoration: const InputDecoration(
        label: Text(
          'Search Character',
          style: TextStyle(color: Color.fromARGB(255, 43, 42, 42)),
        ),
        hintText: 'Enter name Charatcer',
      ),
      autocorrect: false,
      onChanged: (searchingValue) {
        return addSerchForItemToSearched(searchingValue);
      },
    );
  }

  void addSerchForItemToSearched(String searcingValue) {
    searchCharacter = allCharater
        .where((character) =>
            character.name.toLowerCase().startsWith(searcingValue))
        .toList();
    print(searchCharacter.length);
    setState(() {
      allCharater = searchCharacter;
    });
    print(searchCharacter.length);
  }

  List<Widget> buildSearchAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              searchTextController.clear();
              setState(() {
                isSearching = false;
              });
            },
            icon: const Icon(Icons.clear))
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearchingAction,
          icon: const Icon(Icons.search),
        )
      ];
    }
  }

  void startSearchingAction() {
    ModalRoute.of(context);

    setState(() {
      isSearching = true;
    });
  }

  Widget titleAppSeachBar() {
    return const Text('Home');
  }

  Widget buildIconBack() {
    return IconButton(
      onPressed: () {
        setState(() {
          searchTextController.clear();
          isSearching = false;
        });
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.yallow,
        foregroundColor: MyColors.grey,
        leading: isSearching ? buildIconBack() : null,
        title: isSearching ? buildSearchField() : titleAppSeachBar(),
        actions: buildSearchAppBarAction(),
      ),
      body: buildBlocWidget(),
    );
  }
}
