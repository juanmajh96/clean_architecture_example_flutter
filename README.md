# Example Clean Architecture

Example of Clean Architecture,TDD, MVVM with Blocs.

![Static Badge](https://img.shields.io/badge/architecture-clean-blue?)
 ![Static Badge](https://img.shields.io/badge/SDP-TDD-red?) ![Static Badge](https://img.shields.io/badge/design_pattern%20-MVVM-teal) <a href="https://github.com/felangel/bloc"><img src="https://tinyurl.com/bloc-library" alt="Bloc Library"></a> ![Static Badge](https://img.shields.io/badge/coverage-100%25-green)  [![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 

## Running Tests 🧪

To execute all unit and widget tests, use the following command:

```sh
$ flutter test --coverage 
```

To view the generated coverage report, you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
Mac or Linux:

# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

```sh
Windows:

# Generate Coverage Report
$ perl C:\ProgramData\chocolatey\lib\lcov\tools\bin\genhtml -o coverage\html coverage\lcov.info

# Open Coverage Report
$ start coverage/html/index.html
```