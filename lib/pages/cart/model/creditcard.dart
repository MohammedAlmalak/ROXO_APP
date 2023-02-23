class CreditCarrd {
  static List<CreditCarrd> cards = [];
  //! cardholdername
  String _cardHolder = "";
  String get getcardHolder => _cardHolder;
  set setcridetcardHolderName(String _cardHolderName) {
    _cardHolder = _cardHolderName;
  }

  //! cardNumber
  int _cardNumber = 0;
  int get getcardNumber => _cardNumber;
  set setcridetcardCardNum(int _cardNum) {
    _cardNumber = _cardNum;
  }

  //!cardExpiration
  String _cardExpiration = "";
  String get getcardExpiration => _cardExpiration;
  set setcridetcardcardExpiration(String _cardExpirationDate) {
    _cardExpiration = _cardExpirationDate;
  }

  //! cvv
  int _cvv = 0;
  int get getcvv => _cvv;
  set setcridetcardcvv(int _cvV) {
    _cvv = _cvV;
  }

  //! visa or mastercard
  String _cardType = "";
  String get getcardType => _cardType;
  set setcridetcardcardcardType(String _cardTypE) {
    _cardType = _cardTypE;
  }
}
