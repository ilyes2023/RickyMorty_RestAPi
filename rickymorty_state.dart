part of 'rickymorty_cubit.dart';

@immutable
sealed class RickymortyState {}

final class RickymortyInitial extends RickymortyState {}

//declare the staet you will work on it

// ignore: must_be_immutable
class CharacterLoading extends RickymortyState {
  List<Character> characters;

  CharacterLoading(this.characters);
}
