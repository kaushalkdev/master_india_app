import '../../../../../../index.dart';

class SingleOption extends StatelessWidget {
  SingleOption({
    Key key,
    @required this.selected,
    @required this.context,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  final String selected;
  final BuildContext context;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: text == Strings.searchGstNo
            ? EdgeInsets.only(left: 5)
            : EdgeInsets.only(right: 5),
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 40,
        width: (Functions.size(context).width - 50) / 2,
        decoration: BoxDecoration(
          color: selected == text ? AppColors.white : AppColors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: FontSizes.medium,
              color: selected == text ? AppColors.green : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
