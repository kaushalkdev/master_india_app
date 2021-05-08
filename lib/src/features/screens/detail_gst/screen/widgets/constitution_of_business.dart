import '../../../../../../index.dart';

class ConstututionOfBusiness extends StatelessWidget {
  const ConstututionOfBusiness({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
        bloc: BlocProvider.of<SearchCubit>(context),
        builder: (context, state) {
          var constitutionOfBusiness = "--";
          if (state is SearchLoaded) {
            constitutionOfBusiness = state.gstModel.constitutionOfBusiness;
          }
          return Container(
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
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.constitutionOfBusiness,
                  style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: FontSizes.medium,
                      fontWeight: FontWeights.w500),
                ),
                SizedBox(height: 10),
                Text(
                  constitutionOfBusiness,
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
