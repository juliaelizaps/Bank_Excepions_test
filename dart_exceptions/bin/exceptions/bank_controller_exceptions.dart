// tem que sempre implementar Exception nas classes.

class SenderIdInvalidException implements Exception{
  String idSender;
  static const String report= "SenderIdInvalidException";

  SenderIdInvalidException({required this.idSender});


  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }

  }

class ReceiverIdInvalidException implements Exception{
  String idReceiver;
  static const String report= "ReceiverIdInvalidException";

  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString(){
    return "$report\nID Receiver: $idReceiver ";
  }


}
class SenderNotAuthenticatedException implements Exception{
  String idSender;
  static const String report= "SenderNotAuthenticatedException";

  SenderNotAuthenticatedException({required this.idSender});


  @override
  String toString(){
    return "$report\nID Sender: $idSender";
  }


}
class SerderBalanceLowerThanAmountException implements Exception{
  String idSender;
  double senderBalance;
  double amount;
  static const report= "SerderBalanceLowerThanAmountException";
  SerderBalanceLowerThanAmountException({required this.idSender, required this.senderBalance, required this.amount});


  @override
  String toString(){
    return "$report\nID Sender: $idSender\nSender Balance: $senderBalance\nSender Amount:$amount";
  }

}