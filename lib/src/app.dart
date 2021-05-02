import '../index.dart';

class MastersIndiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: AppColors.green),
      home: SearchUi(),
    );
  }
}
