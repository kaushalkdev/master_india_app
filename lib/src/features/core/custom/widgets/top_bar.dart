import '../../../../../index.dart';

class TopBar extends StatelessWidget {
  final Widget child;

  const TopBar({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: child,
      decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          )),
    );
  }
}
