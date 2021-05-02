import '../../../../index.dart';

class Functions {
  //get size
  static Size size(BuildContext context) => MediaQuery.of(context).size;

  //navigate with push
  static void navigateTo(BuildContext context, Widget page) =>
      Navigator.push(context, CupertinoPageRoute(builder: (context) => page));

  // navigate with push replacement
  static void navigateReplacementTo(BuildContext context, Widget page) =>
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => page));

  static showLoader(BuildContext context) {
    return Container(
      color: AppColors.lightBlack,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static showDialog(
    BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey,
    String message,
  ) {
    return _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
