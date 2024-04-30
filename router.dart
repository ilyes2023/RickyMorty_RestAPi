import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_morty_api/BUSINESS_LOGIC_LAYER/cubit/rickymorty_cubit.dart';
import 'package:ricky_morty_api/DATA/repesitory/api.dart';
import 'package:ricky_morty_api/DATA/service/web_server.dart';
import 'package:ricky_morty_api/UI/screen/details.dart';
import 'package:ricky_morty_api/Constant/strings.dart';
import 'package:ricky_morty_api/UI/screen/home.dart';
import 'package:ricky_morty_api/DATA/model/character.dart';

class AppRouter {
  late CharacterRepesitory characterRepesitory;
  late RickymortyCubit charachterCubit;

  AppRouter() {
    characterRepesitory = CharacterRepesitory(charaterApi: CharaterApi());
    charachterCubit = RickymortyCubit(characterRepesitory);
  }
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => charachterCubit,
            child: const Home(),
          ),
        );
      case detailScreen:
        final charaters = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (ctx) => MultiBlocProvider(
            providers: [],
            child: BlocProvider(
              create: (context) => RickymortyCubit(characterRepesitory),
              child: DetailsScreen(
                character: charaters,
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
