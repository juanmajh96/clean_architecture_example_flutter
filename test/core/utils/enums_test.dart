import 'package:automatitation/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SubmissionStatus Extension Tests', () {
    test('isInitial should return true for SubmissionStatus.initial', () {
      // Arrange
      const status = SubmissionStatus.initial;

      // Act & Assert
      expect(status.isInitial, true);
    });

    test('isInProgress should return true for SubmissionStatus.inProgress', () {
      // Arrange
      const status = SubmissionStatus.inProgress;

      // Act & Assert
      expect(status.isInProgress, true);
    });

    test('isSuccess should return true for SubmissionStatus.success', () {
      // Arrange
      const status = SubmissionStatus.success;

      // Act & Assert
      expect(status.isSuccess, true);
    });

    test('isFailure should return true for SubmissionStatus.failure', () {
      // Arrange
      const status = SubmissionStatus.failure;

      // Act & Assert
      expect(status.isFailure, true);
    });

    test('isCanceled should return true for SubmissionStatus.canceled', () {
      // Arrange
      const status = SubmissionStatus.canceled;

      // Act & Assert
      expect(status.isCanceled, true);
    });

    test('isInProgressOrSuccess should return true for inProgress', () {
      // Arrange
      const status = SubmissionStatus.inProgress;

      // Act & Assert
      expect(status.isInProgressOrSuccess, true);
    });

    test('isInProgressOrSuccess should return true for success', () {
      // Arrange
      const status = SubmissionStatus.success;

      // Act & Assert
      expect(status.isInProgressOrSuccess, true);
    });

    test('isInProgressOrSuccess should return false for failure', () {
      // Arrange
      const status = SubmissionStatus.failure;

      // Act & Assert
      expect(status.isInProgressOrSuccess, false);
    });
  });
}
