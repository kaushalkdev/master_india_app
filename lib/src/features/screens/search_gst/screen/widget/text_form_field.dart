import '../../../../../../index.dart';

class TextFormFields extends StatefulWidget {
  final EdgeInsets margin;

  TextFormFields({Key key, this.margin}) : super(key: key);

  @override
  _TextFormFieldsState createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: widget.margin,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: AppColors.grey,
      ),
      child: StreamBuilder<String>(
        stream: searchBloc.gstinStream,
        builder: (context, snapshot) => TextFormField(
          style: TextStyle(
            fontSize: FontSizes.medium,
            color: AppColors.darkGrey,
          ),
          maxLength: 15,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(searchBloc.resExp))
          ],
          onChanged: (string) {
            searchBloc.gstinStreamSet = string;
          },
          decoration: InputDecoration(
            counterText: '',
            hintStyle: TextStyle(
              fontSize: FontSizes.medium,
              color: AppColors.darkGrey,
            ),
            hintText: Strings.gstHint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
