sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

final class Failure<T> extends Result<T> {
  const Failure(this.exception, {this.message});
  final Exception exception;
  final String? message;
}

extension ResultExt<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => switch (this) {
    final Success<T> s => s.data,
    Failure<T> _ => null,
  };

  String? get errorMessage => switch (this) {
    Success<T> _ => null,
    final Failure<T> f => f.message ?? f.exception.toString(),
  };

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Failure<T> failure) onFailure,
  }) => switch (this) {
    final Success<T> s => onSuccess(s.data),
    final Failure<T> f => onFailure(f),
  };
}
