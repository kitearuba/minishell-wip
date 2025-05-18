---

# 📚 **Libft - Custom C Library with `ft_printf` and `get_next_line`**

![Libft](https://img.shields.io/badge/Libft-C_Library-blue?style=flat-square) ![C Programming](https://img.shields.io/badge/Language-C-brightgreen?style=flat-square) ![Makefile](https://img.shields.io/badge/Build-Makefile-yellow?style=flat-square)

Welcome to the enhanced **Libft** repository—a custom C library that includes reimplementations of essential C library functions, as well as `ft_printf`, `ft_printf_fd`, and `get_next_line`. This library is designed to provide flexibility and utility for future C projects, offering functions for string manipulation, memory management, formatted output, and file reading.

---

## 📑 **Table of Contents**

1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Technologies Used](#technologies-used)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Core Components](#core-components)
   - [Standard Library Functions](#standard-library-functions)
   - [Additional Utility Functions](#additional-utility-functions)
   - [`ft_printf` and `ft_printf_fd`](#ft_printf-and-ft_printf_fd)
   - [`get_next_line`](#get_next_line)
7. [Contributing](#contributing)
8. [Acknowledgements](#acknowledgements)
9. [Author](#author)

---

## 📖 **Introduction**

The enhanced **Libft** library consolidates reimplementations of standard C functions with additional utility functions, formatted output using `ft_printf` and `ft_printf_fd`, and file reading with `get_next_line`. This comprehensive toolkit is designed for use in a variety of C projects.

---

## 📂 **Project Structure**

```bash
.
├── include/           # Header files
│   └── libft.h        # Prototypes for all functions
├── src/               # Source files implementing all required functions
│   ├── ft_*.c         # Standard and utility functions
│   ├── ft_printf*.c   # Files for ft_printf and ft_printf_fd
│   ├── handle_*.c     # Modular handlers for specific ft_printf cases
│   ├── get_next_line*.c # get_next_line implementation
├── Makefile           # Makefile for building the library
├── README.md          # This README file
└── libft.a            # Compiled static library
```

This structure groups all functions into a single `src` directory, with file names reflecting their functionality. Future restructuring could further modularize components.

---

## 🛠️ **Technologies Used**

- **C Programming**: The core language for implementing all functions.
- **Makefile**: Automates the compilation process.
- **GCC Compiler**: Compiles and links the source files into a static library.

---

## 🛠️ **Installation**

Follow these steps to build **Libft**:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/kitearuba/Libft-Enhanced.git
   ```

2. **Navigate to the Directory**:
   ```bash
   cd Libft-Enhanced
   ```

3. **Compile the Library**:
   ```bash
   make
   ```

The `libft.a` file will be created in the root directory.

---

## 🚀 **Usage**

To use **Libft** in your C projects:

1. **Include the Header in Your Code**:
   ```c
   #include "libft.h"
   ```

2. **Compile with the Library**:
   ```bash
   gcc -o myproject myproject.c -L. -lft
   ```

The `-L.` flag specifies the directory containing `libft.a`, and the `-lft` flag links the library.

---

## 💻 **Core Components**

### 🔨 **Standard Library Functions**
Reimplementations of common libc functions for string manipulation, memory management, and type checking. Examples:
- `ft_isalpha`
- `ft_strlen`
- `ft_memset`
- `ft_strdup`
- And more.

### 🔧 **Additional Utility Functions**
Additional functions like `ft_substr`, `ft_itoa`, and `ft_strjoin` provide flexibility for handling strings and memory.

### 🌟 **`ft_printf` and `ft_printf_fd`**
#### **`ft_printf`**
A reimplementation of `printf` supporting:
- `%c`, `%s`, `%d`, `%i`, `%u`, `%x`, `%X`, `%p`, and `%%`.

#### **`ft_printf_fd`**
An extension of `ft_printf` that allows dynamic output to a specific file descriptor:
```c
ft_printf_fd(STDERR_FILENO, "Error: %s\n", "Something went wrong!");
```

### 📄 **`get_next_line`**
A function for reading a file line-by-line, supporting multiple file descriptors.

---

## 🌟 **New Features**
1. **`ft_printf_fd`**:
   - Dynamic output to any file descriptor, enabling flexible error handling and formatted output.

2. **Improved Modular Handlers**:
   - Each `ft_printf` conversion (e.g., `%d`, `%s`) is managed by dedicated functions (`handle_int`, `handle_string`), improving maintainability.

---

## 🤝 **Contributing**

Contributions are welcome! Follow these steps:

1. **Fork the Repository**.
2. **Create a Branch** (`git checkout -b feature/AmazingFeature`).
3. **Commit Changes** (`git commit -m 'Add some AmazingFeature'`).
4. **Push to Your Branch** (`git push origin feature/AmazingFeature`).
5. **Open a Pull Request**.

---

## 👨‍💻 **Author**

- **chrrodri**  
  [GitHub Profile](https://github.com/kitearuba)

---

## 🎉 **Final Thoughts**

This version of **Libft** is a comprehensive toolkit for future C projects, offering flexibility, modularity, and reusability. It includes everything from basic utility functions to advanced file handling and formatted output.

Good luck, and happy coding! 🚀

---
