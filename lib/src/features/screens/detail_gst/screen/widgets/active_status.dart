import '../../../../../../index.dart';

class ActiveStatus extends StatelessWidget {
  const ActiveStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: StreamBuilder<GstModel>(
        stream: detailBloc.gstDetailStream,
        builder: (context, snap) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: (snap?.data?.active ?? false)
                    ? AppColors.green
                    : AppColors.red,
              ),
            ),
            Text(
              (snap?.data?.active ?? false)
                  ? Strings.active.toUpperCase()
                  : Strings.inactive.toUpperCase(),
              style: TextStyle(
                fontSize: FontSizes.medium,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
