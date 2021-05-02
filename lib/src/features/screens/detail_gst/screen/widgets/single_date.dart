import '../../../../../../index.dart';

class SingleDate extends StatelessWidget {
  const SingleDate({
    Key key,
    @required this.crossAxisAlignment,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
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
    );
  }
}
