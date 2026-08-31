---
tags:
  - linux
---
# Basics

To compile a single .cpp file on Linux we need to use the following command: `<compiler> <cpp file>`. For example: 
```bash
clang++ test.cpp
```
This will result in a a.out file. If this file is ran, it will execute the code. 

If you want to name the output executable, instead use the following command: `<compiler> <cpp file> -o <output executable name>`. Such as:
```bash
clang++ test.cpp -o test
```

If your project contains multiple source files, you can compile them by adding all the .cpp files before the `-o`. For example, with the following file architecture...
```text
MyProject/
├── main.cpp
├── test.cpp
└── test.h
```
...you can compile it with:
```bash
clang++ main.cpp test.cpp -o my_program
```

# Include files

Include files are automatically if placed in the same directory. This is why we could compile with the previous example. However, if the include files aren't in the same directory, we need to specify to the compiler where they are. Lets demonstrate this problem with the following project file architecture:
```text
Myproject/
├── include
│   └── test.h
└── src
    ├── main.cpp
    └── test.cpp
```
Here we face the issue where the header file isn't in the same directory as its source file. We have to add the include flag in the command. In this case, to compile the project we would have to do:
```bash
clang++ -Iinclude src/main.cpp src/test.cpp -o my_program
```
Additionally, if there are more source or include sub-directories, be sure to write their correct complete path relative to where the command is being executed.


# Bigger projects

When your project gains in complexity, it is good to move away from the classic CLI commands and start using a software like [[Make]] or [[CMake]] for several reasons: they allow you to store the compilation commands and use them quicker. In the case of CMake, it also allows you to build your project so it can be cross platform in an easy way. Learning and using CMake is the next step to setup a solid development pipeline for your coding projects.

***
Next: check out [[CMake]]

