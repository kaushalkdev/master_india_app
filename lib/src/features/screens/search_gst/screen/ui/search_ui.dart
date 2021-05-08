import '../widget/options_tab.dart';
import '../../../../../../index.dart';

class SearchUi extends StatefulWidget {
  @override
  _SearchUiState createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  String selected = Strings.searchGstNo;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      body: BlocConsumer<SearchCubit, SearchState>(listener: (context, state) {
        if (state is SearchError) {
          Functions.showDialog(
            context,
            _scaffoldKey,
            state.message,
          );
        }

        if (state is SearchLoaded) {
          Functions.navigateTo(context, DetailUi());
        }
      }, builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                topBar(context),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      textField(),
                      button(context),
                    ],
                  ),
                ),
              ],
            ),
            if (state is SearchLoading) Functions.showLoader(context),
          ],
        );
      }),
    );
  }

  TopBar topBar(BuildContext context) {
    return TopBar(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: topBarChild(context),
      ),
    );
  }

  Column topBarChild(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 50,
        ),
        topIcon(),
        Text(
          Strings.selectType,
          style: TextStyle(
            fontSize: FontSizes.medium,
            color: AppColors.white,
          ),
        ),
        Text(
          Strings.gstSearchTool,
          style: TextStyle(
            fontSize: FontSizes.large,
            fontWeight: FontWeights.w900,
            color: AppColors.white,
          ),
        ),
        OptionTab(selected: selected, context: context)
      ],
    );
  }

  Row topIcon() {
    return Row(
      children: [
        Spacer(),
        IconButton(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.white,
            ),
            onPressed: () {}),
      ],
    );
  }

  CustomButton button(BuildContext context) {
    return CustomButton(
      buttonText: Strings.searchButton,
      onTap: () async {
        FocusScope.of(context).unfocus();
        final searchCubit = BlocProvider.of<SearchCubit>(context);
        // first validate gstin
        if (searchCubit.state is SearchAdding) {
          searchCubit.validateGstin(searchCubit.state);
        }
      },
    );
  }

  Column textField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: Text(
            Strings.enterGst,
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: FontSizes.medium,
            ),
          ),
        ),
        TextFormFields(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 5,
            bottom: 30,
          ),
        ),
      ],
    );
  }
}
