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
  void initState() {
    super.initState();
    searchBloc.loadingBool = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      body: StreamBuilder(
        stream: searchBloc.loadingBoolStream,
        builder: (context, snapshot) => Stack(
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
            if (snapshot.data ?? false) Functions.showLoader(context),
          ],
        ),
      ),
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
        // first validate gstin
        if (searchBloc.validateGstin()) {
          //then serch the detial
          searchBloc.searchGstDetail(error: () {
            Functions.showDialog(
              context,
              _scaffoldKey,
              searchBloc.errorText,
            );
          }, success: () {
            Functions.navigateTo(context, DetailUi());
          });
        } else {
          Functions.showDialog(
            context,
            _scaffoldKey,
            searchBloc.errorText,
          );
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

  @override
  void dispose() {
    super.dispose();
    searchBloc.dispose();
  }
}
