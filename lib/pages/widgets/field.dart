import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/app_colors.dart';

class Field extends StatefulWidget {
  const Field(
      {Key? key,
      required FocusNode focusNode,
      required bool showtext,
      required TextInputType inputType,
      required String label,
      required IconData? suffixcIcon,
      required void Function()? ontap,
      required bool makeSufficIconButton,
      required String hintText,
      String? Function(String?)? validate,
      void Function(String)? onchange,
      void Function(String?)? onSaved,
      this.suffixiconontap,
      this.prefixicIcon})
      : _focusNode = focusNode,
        _showtext = showtext,
        _hintText = hintText,
        _inputType = inputType,
        _label = label,
        _suffixcIcon = suffixcIcon,
        _ontap = ontap,
        _makeSufficIconButton = makeSufficIconButton,
        _onchange = onchange,
        _validate = validate,
        _onSaved = onSaved,
        super(key: key);
  final FocusNode _focusNode;
  final bool _showtext;
  final TextInputType _inputType;
  final String _label;
  final IconData? _suffixcIcon;
  final void Function()? _ontap;
  final void Function()? suffixiconontap;
  final bool _makeSufficIconButton;
  final String _hintText;
  final void Function(String)? _onchange;
  final String? Function(String?)? _validate;
  final void Function(String?)? _onSaved;
  final IconData? prefixicIcon;
  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget._onSaved,
      validator: widget._validate,
      onChanged: widget._onchange,
      obscureText: !widget._showtext,
      keyboardType: widget._inputType,
      onTap: widget._ontap,
      //! cursor
      cursorColor: AppColors.activeDotColor,
      cursorHeight: 20.h,
      focusNode: widget._focusNode,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: widget._hintText,
        hintStyle: GoogleFonts.balooBhaijaan2(
          color: widget._focusNode.hasFocus ? AppColors.activeDotColor : Colors.grey,
          fontSize: 8.sp,
        ),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: AppColors.activeDotColor)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: const BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: const BorderSide(color: Colors.red)),
        //! label
        labelText: widget._label,
        labelStyle: GoogleFonts.balooBhaijaan2(
          color: widget._focusNode.hasFocus ? AppColors.activeDotColor : Colors.grey,
        ),

        //! suffix icon
        suffixIcon: widget._makeSufficIconButton
            ? IconButton(
                onPressed: widget.suffixiconontap,
                icon: Icon(
                  widget._suffixcIcon,
                  color: widget._focusNode.hasFocus ? AppColors.activeDotColor : Colors.grey,
                ),
              )
            : Icon(
                widget._suffixcIcon,
                color: widget._focusNode.hasFocus ? AppColors.activeDotColor : Colors.grey,
              ),
        prefixIcon: widget.prefixicIcon == null
            ? null
            : Icon(
                widget.prefixicIcon,
                color: widget._focusNode.hasFocus ? AppColors.activeDotColor : Colors.grey,
              ),
      ),
    );
  }
}
