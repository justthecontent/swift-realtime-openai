import Foundation
#if canImport(Observation)
import Observation
#endif

/// An unsafe mutable array that can be accessed from multiple threads.
/// > Warning: Exposing any observable property externally (such as by having a computed property use `isEmpty` will lead to very hard to debug crashes
/// >
/// > If you really need to, manually observe the property using `withObservationTracking` and write changes in the main actor.
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
#if canImport(Observation)
@Observable
#endif
final class UnsafeMutableArray<T: Sendable>: @unchecked Sendable {
	private var array = [T]()

	public var isEmpty: Bool {
		array.isEmpty
	}

	var first: T? {
		array.first
	}

	func push(_ value: T) {
		array.append(value)
	}

	@discardableResult
	func popFirst() -> T? {
		array.removeFirst()
	}

	func clear() {
		array.removeAll()
	}
}
