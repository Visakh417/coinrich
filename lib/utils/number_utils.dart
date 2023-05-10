class NumberUtils{

  /// [getReducedFigure] will provide you the Fixed decimal size of a num value
  /// example if [value] is 2.906542, and [fractionDigits] is 3
  /// then it will return 2.906
  /// Consider that, there will be no rounding of value, just cutting off the decimal points
  static String getReducedFigure(num? value, {int fractionDigits = 2}){
    /// if [value] is null, then in default the function return 0.00
    if(value == null) return "0.00";

    /// Checks if the [value] is negative or not
    /// if [value] is negative then it will convert as positive
    value = value < 0 ? value * -1 : value;
    
    /// Cutting of the extra decimal points and returning the remaining value
    return value.toStringAsFixed(fractionDigits);
  }
}