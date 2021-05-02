import '../../../../../../index.dart';

class BackButtion extends StatelessWidget {
  const BackButtion({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45, left: 10),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: FontSizes.large,
                color: AppColors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          Text(
            Strings.gstProfile,
            style: TextStyle(
                color: AppColors.white,
                fontSize: FontSizes.medium,
                fontWeight: FontWeights.w500),
          )
        ],
      ),
    );
  }
}
