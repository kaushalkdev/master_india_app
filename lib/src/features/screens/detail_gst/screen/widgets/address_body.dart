import '../../../../../../index.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.principlePlaceOfBusiness,
            style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: FontSizes.medium,
                fontWeight: FontWeights.w500),
          ),
          SizedBox(height: 10),
          Container(
            width: 300,
            height: 70,
            child: StreamBuilder<GstModel>(
              stream: detailBloc.gstDetailStream,
              builder: (context, snap) => Text(
                snap?.data?.address?.principlePlace ?? '--',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: FontSizes.large,
                  fontWeight: FontWeights.w600,
                ),
              ),
            ),
          ),
          Text(
            Strings.additionalPlaceOfBusiness,
            style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: FontSizes.medium,
                fontWeight: FontWeights.w500),
          ),
          SizedBox(height: 10),
          StreamBuilder<GstModel>(
            stream: detailBloc.gstDetailStream,
            builder: (context, snap) => Text(
              snap?.data?.address?.additionalPlace ?? '--',
              style: TextStyle(
                fontSize: FontSizes.large,
                fontWeight: FontWeights.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
