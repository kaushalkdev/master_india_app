import '../../../../../index.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  const CustomButton({
    Key key,
    @required this.buttonText,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: FlatButton(
        height: 45,
        minWidth: double.infinity,
        color: AppColors.green,
        child: Text(
          buttonText,
          style: TextStyle(color: AppColors.white),
        ),
        onPressed: onTap,
      ),
    );
  }
}
