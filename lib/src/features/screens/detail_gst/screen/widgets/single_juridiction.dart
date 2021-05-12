import '../../../../../../index.dart';

class SingleJuridiction extends StatelessWidget {
  const SingleJuridiction({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppColors.grey,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeights.w500),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeights.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
