---

# Decimal to Binary Converter

A simple program that converts a decimal number to its binary representation. The converter includes both Java and MIPS assembly implementations.

## Overview

This project provides a decimal-to-binary converter implemented in Java and MIPS assembly language. The goal is to convert a real number, including both the whole and fractional parts, into its binary representation.

## Features

- **Java Implementation:** The `dec2bin.java` file contains the main program written in Java. It utilizes `whole2bin.java` and `fractional2bin.java` for converting the whole and fractional parts, respectively.

- **MIPS Assembly Implementation:** The `dec2bin.s` file provides the same functionality as the Java program but is implemented in MIPS assembly language. It includes subroutines such as `whole2bin.s` and `fractional2bin.s`.

## Usage

### Java Program

Compile and run the Java program as follows:

```bash
$ javac dec2bin.java
$ java dec2bin <whole> . <fractional> <precision>
```

Replace `<whole>`, `<fractional>`, and `<precision>` with appropriate values.

### MIPS Assembly Program

Use the MIPS assembly program through the provided utility:

```bash
$ mips_subroutine dec2bin <whole> . <fractional> <precision>
```

Again, replace `<whole>`, `<fractional>`, and `<precision>` with appropriate values.

## Files

1. `dec2bin.java`: Main Java program.
2. `whole2bin.java`: Java implementation for converting the whole part.
3. `fractional2bin.java`: Java implementation for converting the fractional part.
4. `MIPS_OS_Interface.java`: Java interface for interacting with MIPS assembly.
5. `dec2bin.s`: MIPS assembly implementation.
6. `whole2bin.s`: MIPS assembly implementation for converting the whole part.
7. `fractional2bin.s`: MIPS assembly implementation for converting the fractional part.
8. `README.md`: This file.

## Requirements

- Java Development Kit (JDK) for compiling and running Java programs.
- MIPS assembly environment for running MIPS programs.

## License

This project is licensed under the [MIT License](LICENSE).

---