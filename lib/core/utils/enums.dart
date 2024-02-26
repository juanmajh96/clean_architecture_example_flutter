enum SubmissionStatus {
  /// The Data has not yet been submitted.
  initial,

  /// The Data is in the process of being submitted.
  inProgress,

  /// The Data has been submitted successfully.
  success,

  /// The Data submission failed.
  failure,

  /// The Data submission has been canceled.
  canceled
}

/// Useful extensions on [SubmissionStatus]
extension FormzSubmissionStatusX on SubmissionStatus {
  /// Indicates whether the form has not yet been submitted.
  bool get isInitial => this == SubmissionStatus.initial;

  /// Indicates whether the form is in the process of being submitted.
  bool get isInProgress => this == SubmissionStatus.inProgress;

  /// Indicates whether the form has been submitted successfully.
  bool get isSuccess => this == SubmissionStatus.success;

  /// Indicates whether the form submission failed.
  bool get isFailure => this == SubmissionStatus.failure;

  /// Indicates whether the form submission has been canceled.
  bool get isCanceled => this == SubmissionStatus.canceled;

  /// Indicates whether the form is either in progress or has been submitted
  /// successfully.
  ///
  /// This is useful for showing a loading indicator or disabling the submit
  /// button to prevent duplicate submissions.
  bool get isInProgressOrSuccess => isInProgress || isSuccess;
}
