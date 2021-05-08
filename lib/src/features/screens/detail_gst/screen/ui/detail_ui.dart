import '../../../../../../index.dart';
import '../widgets/active_status.dart';
import '../widgets/address_body.dart';
import '../widgets/back_button.dart';
import '../widgets/constitution_of_business.dart';
import '../widgets/date_of_registration_coordination.dart';
import '../widgets/single_juridiction.dart';

class DetailUi extends StatefulWidget {
  @override
  _DetailUiState createState() => _DetailUiState();
}

class _DetailUiState extends State<DetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Column(
        children: [
          topBar(context),
          lowerBody(),
        ],
      ),
    );
  }

  Expanded lowerBody() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          middleBody(),
          SizedBox(height: 40),
          CustomButton(
            buttonText: Strings.getRetunFilingStatus,
            onTap: () {},
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Column middleBody() {
    return Column(
      children: [
        address(),
        juridiction(),
        ConstututionOfBusiness(),
        DateOfRegistrationCoordination(),
      ],
    );
  }

  Container address() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
      padding: EdgeInsets.only(right: 30, top: 20, bottom: 20),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          iconsWidget(),
          AddressBody(),
        ],
      ),
    );
  }

  Expanded iconsWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          locationIcon(),
          Container(
            color: AppColors.lightGreen,
            width: 0.8,
            height: 60,
          ),
          placeIcon(),
        ],
      ),
    );
  }

  Container placeIcon() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.account_balance,
        size: 20,
        color: AppColors.green,
      ),
    );
  }

  Container locationIcon() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.location_on,
        size: 20,
        color: AppColors.green,
      ),
    );
  }

  Container juridiction() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: BlocBuilder<SearchCubit, SearchState>(
          bloc: BlocProvider.of<SearchCubit>(context),
          builder: (context, state) {
            var stateJuti = "--";
            var centerJjuri = "--";
            var taxPay = "--";
            if (state is SearchLoaded) {
              stateJuti = state.gstModel.stateJuridiction;
              centerJjuri = state.gstModel.centerJuridiction;
              taxPay = state.gstModel.taxpayerType;
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleJuridiction(
                    title: Strings.stateJuridiction, value: stateJuti),
                SingleJuridiction(
                    title: Strings.centerJuridiction, value: centerJjuri),
                SingleJuridiction(title: Strings.taxPayerType, value: taxPay),
              ],
            );
          }),
    );
  }

  TopBar topBar(BuildContext context) {
    return TopBar(
      child: Column(
        children: [
          BackButtion(context: context),
          bottomTexts(),
        ],
      ),
    );
  }

  Widget bottomTexts() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.gstinTaxPayer,
            style: TextStyle(
              color: AppColors.lightWhite,
              fontSize: FontSizes.small,
              fontWeight: FontWeights.w600,
            ),
          ),
          SizedBox(height: 5),
          BlocBuilder<SearchCubit, SearchState>(
              bloc: BlocProvider.of<SearchCubit>(context),
              builder: (context, state) {
                var gstin = "--";
                if (state is SearchLoaded) {
                  gstin = state.gstModel.gstin;
                }
                return Text(
                  gstin,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeights.w600,
                    fontSize: FontSizes.large,
                  ),
                );
              }),
          SizedBox(height: 10),
          Text(
            Strings.masterIndia,
            style: TextStyle(
              color: AppColors.white,
              fontSize: FontSizes.medium,
            ),
          ),
          SizedBox(height: 10),
          ActiveStatus()
        ],
      ),
    );
  }
}
