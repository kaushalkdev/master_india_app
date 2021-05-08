import '../index.dart';

class MastersIndiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(FakeSearchGstReposiotory()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: AppColors.green),
        home: SearchUi(),
      ),
    );
  }
}
