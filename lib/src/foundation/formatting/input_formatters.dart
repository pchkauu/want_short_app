import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

// @sealed
// class CurrencyInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.isEmpty) {
//       return newValue.copyWith(text: '');
//     }

//     final charList = newValue.text.split('');

//     final firstCharZero = charList.length > 1 &&
//         charList.firstOrNull == '0' &&
//         !newValue.text.contains(RegExp('0[.,]'));

//     if (_containsMultipleSeparators(newValue.text)) {
//       return oldValue;
//     }

//     final cleanedText = newValue.text.replaceAll(RegExp('[^0-9,.]'), '').trim();

//     final parts = _splitNumber(cleanedText);
//     var integerPart = parts[0];
//     final decimalPart = parts.length > 1 ? parts[1] : '';

//     while (integerPart.length > 1 && integerPart[0] == '0') {
//       integerPart = integerPart.substring(1);
//     }

//     final buffer = StringBuffer();
//     final length = integerPart.length;

//     for (var i = 0; i < length; i++) {
//       if (i > 0 && (length - i) % 3 == 0) {
//         buffer.write(' ');
//       }
//       buffer.write(integerPart[i]);
//     }

//     final formattedIntegerPart = buffer.toString();

//     final formattedText = '$formattedIntegerPart$decimalPart';

//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: formattedText.length),
//     );
//   }

//   bool _containsMultipleSeparators(String input) {
//     final regex = RegExp('[,.].*[,.]');
//     return regex.hasMatch(input);
//   }

//   List<String> _splitNumber(String number) {
//     final index = number.indexOf(RegExp('[,.]'));

//     if (index != -1) {
//       final integerPart = number.substring(0, index);
//       final decimalPart = number.substring(index).replaceAll(',', '.');
//       final decimalPartList = decimalPart.split('').take(3).join();

//       return [integerPart, decimalPartList];
//     }

//     return [number];
//   }

//   String formatCurrency(String value) {
//     return CurrencyInputFormatter()
//         .formatEditUpdate(
//           TextEditingValue.empty,
//           TextEditingValue(text: value),
//         )
//         .text;
//   }
// }

@sealed
class AmountInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    if (_containsMultipleSeparators(text)) {
      return oldValue;
    }

    // Заменяем запятые на точки
    text = text.replaceAll(',', '.');

    // Удаляем все символы, кроме цифр и точек
    text = text.replaceAll(RegExp('[^0-9.]'), '');

    // Разбиваем на целую и дробную части
    final parts = text.split('.');

    // Удаляем ведущие нули в целой части
    if (parts.isNotEmpty) {
      parts[0] = _removeLeadingZeros(parts[0]);
      parts[0] = _formatIntegerPart(parts[0]);
    }

    // Оставляем только две цифры после точки
    if (parts.length > 1) {
      parts[1] = parts[1].substring(0, parts[1].length > 2 ? 2 : parts[1].length);
    }

    // Соединяем обратно
    final formatted = parts.join('.');

    // Вычисляем новую позицию курсора
    var cursorPosition = newValue.selection.baseOffset;

    // Корректируем позицию курсора в зависимости от изменений
    final offsetChange = formatted.length - newValue.text.length;
    cursorPosition = cursorPosition + offsetChange;

    // Убедимся, что курсор не выходит за пределы текста
    cursorPosition = cursorPosition.clamp(0, formatted.length);

    // Возвращаем новое значение
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _removeLeadingZeros(String text) {
    // Удаляем ведущие нули, кроме случая, когда это единственная цифра
    return text.replaceFirst(RegExp(r'^0+(?=\d)'), '');
  }

  String _formatIntegerPart(String text) {
    if (text.length <= 3) return text;
    return text.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]} ',
    );
  }

  bool _containsMultipleSeparators(String input) {
    final regex = RegExp('[,.].*[,.]');
    return regex.hasMatch(input);
  }

  String formatCurrency(String value) {
    return AmountInputFormatter()
        .formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: value),
        )
        .text;
  }
}
