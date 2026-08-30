---
tags:
  - general-programing
---

# Basics

To build with CMake we need to firstly be at the location of the CMakeList.txt file. We can then run the following command: `cmake -B <output build folder>`. It is of general convention to name the ouput folder `build`.

```bash
cmake -B build
```

As a result, in our project we will get a new `build` folder:
```text
├── build
│   ├── ...
│   ├── cmake_install.cmake
│   └── Makefile
├── CMakeLists.txt
└── HelloWorld.cxx
```

It creates a MakeFile which will be used with the following command to create an executable called hello:
```bash
cmake --build build
```

> [!note]
> The name of the executable is specified in the CMakeList.txt file.

We can now run this `hello` executable with `./build/hello` (/build first since we are one directory above, otherwise if you are in /build already obviously just run ./hello).


# Generators

CMake creates builds by using generators which are useful to create different build types for our applications such as Debug, Release...etc.
Here is an example of building a Release build of a project using the `Ninja` generator:
```bash
cmake -G "Ninja Multi-Config" -B build
cmake --build build --config Release
./build/Release/hello
```

But we can also run the generator without any configurations:
```bash
cmake -G Ninja -B build
cmake --build build
./build/hello
```


