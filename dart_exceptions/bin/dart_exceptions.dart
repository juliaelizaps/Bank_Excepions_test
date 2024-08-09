import 'dart:math';
import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';


void testingNullSafety(){
  Account? myAccount;
  
  //Simulando comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  print(randomNumber);
  if(randomNumber<=5){
    myAccount = Account(name: 'Rick', balance: 200, isAuthenticated: true);
  }
  //operador ternário
  print(myAccount !=null ? myAccount.balance : "Conta nula");

  //Safe call: (chamada segura)
  print(myAccount?.balance);
  }

void main() {

  testingNullSafety();

  BankController bankController = BankController();

  bankController.addAccount(
      id: "01A-RI",
      account:
          Account(name: "Rick Lu", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "02B-JU",
      account:
          Account(name: "Julia Eliza", balance: 800, isAuthenticated: true));

try{
    bool result = bankController.makeTransfer(
      idSender: "02B-JU", idReceiver: "01A-RI", amount: 600);
    if(result){
      print("Transferência bem sucedida!");
    }
}on SenderIdInvalidException catch(Exception){
  print(Exception); //mensagem para Devs
  print('O ID "${Exception.idSender}" do remetente, não é um ID válido');
}on ReceiverIdInvalidException catch(Exception){
  print(Exception);
  print('O ID "${Exception.idReceiver}" do destinatário, não é um ID válido');
}on SenderNotAuthenticatedException catch(Exception){
  print(Exception);
  print('O ID "${Exception.idSender}" não está autenticado');
}on SerderBalanceLowerThanAmountException catch(Exception){
  print(Exception);
  print('O usuário de ID "${Exception.idSender}" tentou enviar ${Exception.amount} sendo que na sua conta há apenas ${Exception.senderBalance}.');
}on Exception{
  print('Algo deu errado');
}

}

