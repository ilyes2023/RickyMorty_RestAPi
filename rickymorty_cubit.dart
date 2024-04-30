// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:ricky_morty_api/DATA/model/character.dart';
import 'package:ricky_morty_api/DATA/repesitory/api.dart';

part 'rickymorty_state.dart';

class RickymortyCubit extends Cubit<RickymortyState> {
  final CharacterRepesitory characterRepesitory;
  List<Character> characters = [];
  String quary = '';

  List<Character> getAllData() {
    characterRepesitory.getAllData().then((character) {
      emit(CharacterLoading(character));
      characters = character;
    });
    return characters;
  }

  void fetchData() {
    characterRepesitory.fetchData();
  }

//cubite state use only in emite yu call as a constractor

  RickymortyCubit(
    this.characterRepesitory,
  ) : super(RickymortyInitial());
}
