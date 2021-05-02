import 'single_option.dart';
import '../../../../../../index.dart';

// ignore: must_be_immutable
class OptionTab extends StatefulWidget {
  OptionTab({
    Key key,
    @required this.selected,
    @required this.context,
  }) : super(key: key);

  String selected;
  final BuildContext context;

  @override
  _OptionTabState createState() => _OptionTabState();
}

class _OptionTabState extends State<OptionTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          SingleOption(
            selected: widget.selected,
            onTap: () {
              setState(() {
                widget.selected = Strings.searchGstNo;
              });
            },
            context: context,
            text: Strings.searchGstNo,
          ),
          Spacer(),
          SingleOption(
            selected: widget.selected,
            onTap: () {
              setState(() {
                widget.selected = Strings.gstReturnStatus;
              });
            },
            context: context,
            text: Strings.gstReturnStatus,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20, top: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: AppColors.lightBlack,
      ),
      width: double.infinity,
    );
  }
}
