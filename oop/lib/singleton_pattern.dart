class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance; // always returns the SAME instance
  }

  Logger._internal();
}
// Here Logger() never creates a new object after the first time — it keeps handing back the same one.
// A normal const/default constructor can't do that.

// 1. static means "belongs to the class, not to instances"
//
// static final Logger _instance = Logger._internal(); runs exactly once — the very first time the Logger class is used/loaded.
// It creates one Logger object and stores it in _instance. This line does not run again, no matter how many times you call Logger() afterward.

// 2. The factory constructor doesn't build anything — it just returns
// dart
// factory Logger() {
//   return _instance;
// }
//
// Every time you write Logger() in your code, this factory runs. But look at what it does: it doesn't say
// Logger._internal() (which would build a new object) — it just returns the existing _instance that was already created in step 1.

// 3. So every call points to the same object in memory
// dart
// var log1 = Logger();
// var log2 = Logger();
//
// print(identical(log1, log2)); // true — same object!
//
// log1 and log2 aren't two separate Logger objects that happen to look the same — they are literally the same object in memory,
// because the factory keeps handing back that one _instance reference instead of creating a new one.

// Why this is only possible with factory
// A normal constructor (Logger() without factory) is forced to create a new instance every time it's called — that's just how Dart works.
// factory is special because it lets you skip creating a new instance and instead return whatever you want (including an old one) —
// which is exactly what makes the Singleton pattern possible.