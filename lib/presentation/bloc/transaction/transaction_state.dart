part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class LoadingTransactionState extends TransactionState {}

class SuccessPostTransactionState extends TransactionState {
  final String successMessage;

  const SuccessPostTransactionState({required this.successMessage});

  @override
  List<Object> get props => [successMessage];
}

class LoadedTransaction extends TransactionState {
  final List<Transaction> transactions;

  const LoadedTransaction({required this.transactions});

  @override
  List<Object> get props => [transactions];
}

class ErrorTransactionState extends TransactionState {
  final String errorMessage;

  const ErrorTransactionState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
