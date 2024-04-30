import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricky_morty_api/UI/router/router.dart';

void main() {
  runApp(RickyMorty(
    appRouter: AppRouter(),
  ));
}

class RickyMorty extends StatelessWidget {
  final AppRouter appRouter;
  const RickyMorty({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      builder: (context, child) {
        return BlocProvider.value(
          value: appRouter.charachterCubit,
          child: child!,
        );
      },
    );
  }
}
