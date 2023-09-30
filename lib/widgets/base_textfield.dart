import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transaction_app/utils/app_contants/app_constants.dart';

class AppTextFieldALL extends StatefulWidget {
  final String? hintText;

  final String text;

  final Color? textColor;

  final TextInputType textInputType;

  final Function? onTextChange;

  final Function? onFocusChange;

  final bool forceError;

  final String alertError;

  final bool isEnable;

  final int? lengthLimitingText;

  final int maxLength;

  final bool isUserName;

  final bool isNeedValidate;

  final double? radius;

  final TextAlign? textAlign;

  final Color? color;

  final Color? colorBorderBox;

  final bool spaceBottom;

  final List<TextInputFormatter>? inputFormatters;

  final TextEditingController textEditingController;

  const AppTextFieldALL(
      {Key? key,
      required this.textEditingController,
      this.onTextChange,
      this.lengthLimitingText,
      this.onFocusChange,
      this.textInputType = TextInputType.text,
      this.maxLength = -1,
      this.forceError = false,
      this.alertError = '',
      this.isEnable = true,
      this.text = '',
      this.isUserName = false,
      this.isNeedValidate = false,
      this.hintText,
      this.radius,
      this.textAlign,
      this.color,
      this.colorBorderBox,
      this.textColor,
      this.spaceBottom = true,
      this.inputFormatters})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextFieldALL> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focus = FocusNode();

  void _onFocusChange() {
    setState(() {
      _focus.hasFocus;
    });
    if (widget.onFocusChange != null) {
      widget.onFocusChange!(_controller.text);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.text != '') {
      _controller.text = widget.text;
    }
    _controller.addListener(() {
      if (widget.onTextChange != null) {
        if (_focus.hasFocus) {
          widget.onTextChange!(_controller.text);
        }
      }
    });

    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppTextFieldALL oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onTextChange == null) {
      _controller.text = widget.text;
    }

    if (widget.onTextChange != null && widget.text.isNotEmpty && widget.text != '' && !_focus.hasFocus) {
      _controller.text = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 44.0,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 6.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.color ?? Colors.white,
            border: Border.all(
                width: 1.0,
                color: _focus.hasFocus
                    ? widget.forceError
                        ? Colors.red
                        : AppConstants.colorPurple
                    : widget.forceError
                        ? Colors.red
                        : widget.colorBorderBox ?? AppConstants.colorBorderBox),
            borderRadius: BorderRadius.circular(widget.radius ?? 0.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  textAlign: widget.textAlign ?? TextAlign.start,
                  inputFormatters: widget.inputFormatters ?? [],
                  enableSuggestions: false,
                  maxLength: widget.maxLength,
                  enabled: widget.isEnable,
                  focusNode: _focus,
                  controller: _controller,
                  keyboardType: widget.textInputType,
                  obscureText: !widget.isUserName ? widget.textInputType == TextInputType.visiblePassword : false,
                  style: TextStyle(
                    color: widget.textColor ?? AppConstants.colorBlack,
                    fontSize: 16.0,
                  ),
                  cursorColor: AppConstants.colorPurple,
                  decoration: InputDecoration(
                    counterText: '',
                    contentPadding: const EdgeInsets.only(left: 14.0, top: 4.0, bottom: 4.0),
                    hintText: widget.hintText ?? "",
                    hintMaxLines: 2,
                    isDense: true,
                    hintStyle: TextStyle(color: AppConstants.colorGray, fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.forceError
            ? SizedBox(
                height: 20,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.alertError,
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 15.0, color: AppConstants.colorRed),
                  ),
                ),
              )
            : SizedBox(
                height: widget.spaceBottom ? 20.0 : 0.0,
              )
      ],
    );
  }
}
