import '../../../../../../index.dart';

class AddressBody extends StatelessWidget {
  const AddressBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        bloc: BlocProvider.of<SearchCubit>(context),
        builder: (context, state) {
          var principlePlace = "--";
          var additionalPlace = "--";
          if (state is SearchLoaded) {
            principlePlace = state.gstModel.address.principlePlace;
            additionalPlace = state.gstModel.address.additionalPlace;
          }
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
                  child: Text(
                    principlePlace,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: FontSizes.large,
                      fontWeight: FontWeights.w600,
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
                Text(
                  additionalPlace,
                  style: TextStyle(
                    fontSize: FontSizes.large,
                    fontWeight: FontWeights.w600,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
