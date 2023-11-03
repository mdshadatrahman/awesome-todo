import 'package:awesome_todo/app/utils/global_vars.dart';
import 'package:awesome_todo/l10n/l10n.dart';
import 'package:awesome_todo/modules/todo/bloc/todo_bloc.dart';
import 'package:awesome_todo/modules/todo/screens/todo_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: ScreenUtilInit(
        designSize: const Size(414, 944),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          height = MediaQuery.of(context).size.height;
          width = MediaQuery.of(context).size.width;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.roboto().fontFamily,
              appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              useMaterial3: true,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: child,
          );
        },
        child: const TodoHomeView(),
      ),
    );
  }
}
