import 'package:masters_india_app/src/features/screens/detail_gst/screen/widgets/single_date.dart';
import '../../../../../../index.dart';

class DateOfRegistrationCoordination extends StatelessWidget {
  const DateOfRegistrationCoordination({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      width: double.infinity,
      child: BlocBuilder<SearchCubit, SearchState>(
          bloc: BlocProvider.of<SearchCubit>(context),
          builder: (context, state) {
            var registration = "--";
            var coordination = "--";
            if (state is SearchLoaded) {
              registration = state.gstModel.date.registration;
              coordination = state.gstModel.date.coordination;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleDate(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    title: Strings.dateOfRegistration,
                    value: registration),
                SingleDate(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    title: Strings.dateOfCoordination,
                    value: coordination),
              ],
            );
          }),
    );
  }
}
