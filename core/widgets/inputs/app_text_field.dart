import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/constants.dart';

// ─────────────────────────────────────────────────────────────
//  APP TEXT FIELD
//  Projedeki tüm text input'ların tek kaynağı.
//
//  Kullanım:
//    AppTextField(label: 'E-posta', hint: 'ornek@mail.com')
//    AppTextField.password(label: 'Şifre')
//    AppTextField.phone(label: 'Telefon')
//    AppTextField(
//      label: 'Ad Soyad',
//      prefixIcon: Icons.person_outline,
//      validator: (v) => v!.isEmpty ? 'Zorunlu alan' : null,
//    )
// ─────────────────────────────────────────────────────────────

enum _FieldVariant { text, password, phone, multiline }

class AppTextField extends StatefulWidget {
  // ── Default (text) ─────────────────────────
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
    this.initialValue,
  })  : _variant = _FieldVariant.text,
        maxLines = 1;

  // ── Password ────────────────────────────────
  const AppTextField.password({
    super.key,
    this.label,
    String? hint,
    this.helper,
    this.controller,
    this.focusNode,
    this.prefixIcon = Icons.lock_outline_rounded,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autofocus = false,
    this.initialValue,
    this.textInputAction,
  })  : _variant = _FieldVariant.password,
        hint = hint ?? '••••••••',
        suffixIcon = null,
        onSuffixTap = null,
        onTap = null,
        readOnly = false,
        keyboardType = TextInputType.visiblePassword,
        inputFormatters = null,
        maxLines = 1;

  // ── Phone ───────────────────────────────────
  const AppTextField.phone({
    super.key,
    this.label,
    this.helper,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autofocus = false,
    this.initialValue,
  })  : _variant = _FieldVariant.phone,
        hint = '05XX XXX XX XX',
        prefixIcon = Icons.phone_outlined,
        suffixIcon = null,
        onSuffixTap = null,
        onTap = null,
        readOnly = false,
        keyboardType = TextInputType.phone,
        textInputAction = TextInputAction.next,
        inputFormatters = const [_PhoneFormatter()],
        maxLines = 1;

  // ── Multiline ───────────────────────────────
  const AppTextField.multiline({
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.autofocus = false,
    this.maxLines = 4,
    this.initialValue,
  })  : _variant = _FieldVariant.multiline,
        suffixIcon = null,
        onSuffixTap = null,
        onTap = null,
        readOnly = false,
        keyboardType = TextInputType.multiline,
        textInputAction = TextInputAction.newline,
        inputFormatters = null;

  // ── Fields ──────────────────────────────────
  final String? label;
  final String? hint;
  final String? helper;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final bool enabled;
  final bool autofocus;
  final bool readOnly;
  final int maxLines;
  final _FieldVariant _variant;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;
  bool _hasFocus = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _hasFocus = _focusNode.hasFocus);
  }

  bool get _isPassword => widget._variant == _FieldVariant.password;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Label ──────────────────────────────
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.labelLarge.copyWith(
              color: _hasFocus
                  ? AppColors.primary
                  : (isDark ? AppColors.textOnDark : AppColors.textPrimary),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],

        // ── Input ───────────────────────────────
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          initialValue: widget.initialValue,
          obscureText: _isPassword && _obscure,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction ??
              (_isPassword
                  ? TextInputAction.done
                  : TextInputAction.next),
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          maxLines: _isPassword ? 1 : widget.maxLines,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          validator: widget.validator,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isDark ? AppColors.textOnDark : AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            helperText: widget.helper,
            helperStyle: AppTextStyles.caption,

            prefixIcon: widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              size: 20,
              color: _hasFocus
                  ? AppColors.primary
                  : AppColors.textTertiary,
            )
                : null,

            suffixIcon: _buildSuffix(),

            fillColor: widget.enabled
                ? (isDark ? AppColors.darkTertiary : AppColors.surface)
                : (isDark
                ? AppColors.darkTertiary.withValues(alpha: 0.5)
                : AppColors.border),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffix() {
    if (_isPassword) {
      return GestureDetector(
        onTap: () => setState(() => _obscure = !_obscure),
        child: Icon(
          _obscure
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          size: 20,
          color: AppColors.textTertiary,
        ),
      );
    }

    if (widget.suffixIcon != null) {
      return GestureDetector(
        onTap: widget.onSuffixTap,
        child: Icon(
          widget.suffixIcon,
          size: 20,
          color: AppColors.textTertiary,
        ),
      );
    }

    return null;
  }
}

// ─────────────────────────────────────────────────────────────
//  PHONE FORMATTER  →  0555 555 55 55
// ─────────────────────────────────────────────────────────────

class _PhoneFormatter extends TextInputFormatter {
  const _PhoneFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length && i < 11; i++) {
      if (i == 4 || i == 7 || i == 9) buffer.write(' ');
      buffer.write(digits[i]);
    }

    final result = buffer.toString();

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}