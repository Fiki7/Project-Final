import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store/domain/entites/transaction.dart';
import 'package:store/domain/usecases/fetch_transaction.dart';
import 'package:store/domain/usecases/post_transaction.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

final PostTransaction postTransaction = PostTransaction();
final FetchTransaction fetchTransaction = FetchTransaction();

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>(
      (event, emit) async {
        try {
          emit(LoadingTransactionState());
          await postTransaction(
              '/api/transaksi', {'alamat': "Default Address"});

          emit(SuccessPostTransactionState(
              successMessage: "Berhasil melakukan transaksi"));
        } catch (e) {
          emit(
            ErrorTransactionState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );

    on<GetTransaction>(
      (event, emit) async {
        try {
          emit(LoadingTransactionState());

          final transactions = await fetchTransaction("/api/transaksi/");

          emit(
            LoadedTransaction(transactions: transactions),
          );
        } catch (e) {
          emit(
            ErrorTransactionState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
