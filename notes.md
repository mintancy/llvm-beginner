[TOC]

## Learn from llvm-cookbook

### Chap4

#### Reference: 
- [LLVM Wrting a pass](https://llvm.org/docs/WritingAnLLVMPass.html)
- [PWN? PWN!](https://ch4r1l3.github.io/2019/05/02/LLVM-%E5%88%9D%E6%8E%A2-1-%E7%AE%80%E5%8D%95Pass%E7%BC%96%E5%86%99/)

#### Steps:
1. Create a new folder at <llvm_src>/lib/Transforms/: `FuncBlockCount`
2. Create required files that used to create the library. I just copy the Hello folder and change the name from `Hello` to `FuncBlockCount` accordiingly.
3. Write the pass flowed by llvm-cookbook. There are several additional work to make the pass work.
    -  Error:
        > Loop is not declared.
    - Solution: add analysis pass header file: `#include "llvm/Analysis/LoopInfo.h"`
    - Error: 
        > opt: .../PassAnalysisSupport.h:235: AnalysisType& llvm::Pass::getAnalysisID(llvm::AnalysisID) const [with AnalysisType = llvm::LoopInfoWrapperPass; llvm::AnalysisID = const void*]: Assertion `ResultPass && "getAnalysis*() called on an analysis that was not " "'required' by pass!"' failed.

    - Solution: add `getAnalysisUsage` function after `runOnFunction`
        ```c
        virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
        AU.addRequired<LoopInfoWrapperPass>();
        }
        ```
4. Modify the CMakelists.txt in this pass folder and the parent folder.
    ```c
    // pass folder
    if( NOT LLVM_REQUIRES_RTTI )
    if( NOT LLVM_REQUIRES_EH )
        set(LLVM_EXPORTED_SYMBOL_FILE ${CMAKE_CURRENT_SOURCE_DIR}/FuncBlockCount.exports)
    endif()
    endif()

    if(WIN32 OR CYGWIN)
    set(LLVM_LINK_COMPONENTS Core Support)
    endif()

    add_llvm_library( LLVMFuncBlockCount MODULE BUILDTREE_ONLY
    FuncBlockCount.cpp

    DEPENDS
    intrinsics_gen
    PLUGIN_TOOL
    opt
    )
    -------------------------------------
    // parent folder
    add_subdirectory(xxx)
    ```
5. Compile this pass, run `make` in `build/` folder. Or only compile this new pass by using [llvm-pass-skeleton](https://github.com/sampsyo/llvm-pass-skeleton).

6. compile the test source code (I target to arm): `clang -O0 -S -emit-llvm target-program.cpp -o target-program3.ll`
7. check our pass: `opt -load build/lib/xx.so -xx -disable-output test.ll
`

### chap5

- Add pass in the llvm/lib/Transforms/Scalar/

### chap6

- Life of an LLVM IR instruction:
    > C code to LLVM IR \
    &rarr; IR optimization \
    &rarr; LLVM IR to SelectionDAG (visit each IR instruction to create an SDAGNode) \
    &rarr; SelectionDAG legalization (make it to support target architecture) \
    &rarr; Conversion from target-independent DAG to machine DAG (MachineSDNode, machine instructions are described in the target description .td file) \
    &rarr; Scheduling instructions (covert d DAG into a linear set of instructions) \
    &rarr; Register allocation (SSA has unlimited registers) \
    &rarr; Code emission (JIT or llc: generate assembly instructions for a target)

- Visualizing LLVM IR CFG using graphviz

    ```shell
    $ llc --view-dag-combine-lt-dags test.ll
    $ dot -Tpng /tmp/dag._Z8additionv-88c78e.dot > test.png
    ```
## Set the LLVM to support embedded platform

- [x] Choice 1. Install the (LLVM embedded toolchain for arm)[https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm]
- [ ] Choice 2 . Use flags to specific the target. 
For example, I install LLVM 9.0.0 and I haven't figure out how to add new pass of the upper repo. 
And I don't want to reinstall the LLVM.
    - Use the`clang` to compile (learn from the previous repo *cfg files):
    ```shell
    clang --target=armv8m.main-non-eabi -mfloat-abi=soft -march=armv8m.main+nofp -fno-exceptions -fno-rtti -O0 -S -emit-llvm target-program.cpp -o target-program4.ll
    ```
    - Use the llc to genreate the .s
        - run `llc -march=arm -mattr=help` to check which cpu it supports
        - I select the cortex-m33:
        ```shell
        llc -mcpu=cortex-m33 target-program4.ll -o target-program4.s
        ```
    
### Install arm-gcc and qemu

1. Install arm gcc tool chain. ([Reference](https://askubuntu.com/questions/1243252/how-to-install-arm-none-eabi-gdb-on-ubuntu-20-04-lts-focal-fossa))
    - Download the arm gcc toolchain from [link](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).
    - `sudo tar xjf gcc-arm-none-eabi-your-version.bz2 -C /usr/share/`
    - `sudo ln -s /usr/share/gcc-arm-none-eabi-your-version/bin/* /usr/bin/`

2. Install qemu 4.0.0. [Reference](https://askubuntu.com/questions/1067722/how-do-i-install-qemu-3-0-on-ubuntu-18-04)
    - Update the python3. [Reference](https://www.atjiang.com/update-python3-on-ubuntu/).
        ```shell
        $ sudo update
        $ sudo apt install software-properties-common
        $ sudo add-apt-repository ppa:deadsnakes/ppa
        $ sudo apt update
        $ sudo apt install python3.8
        ---------- Link newly installed python3----
        $ which python3.8
        /usr/bin/python3.8
        $ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
        $ which python3.5
        /usr/bin/python3.5
        $ sudo update-alternatives --config python3
        [select 2, and enter]
        ```
    - Install Ninja: `sudo apt install ninja`
    - Clear previous installation: 
        ```shell
        sudo apt-get purge "qemu*"
        sudo apt-get autoremove
        ```
        - Enable Source Code repositories in Software and Updates (software-properties-gtk) and then: `sudo apt-get build-dep qemu`
        - Download qemu and compile (I installed qemu 4.0.0 for `microbit` is supported since qemu 4.0.0):
        ```shell
        cd ~/Downloads
        wget https://download.qemu.org/qemu-4.0.0.tar.xz
        tar -xf qemu-4.0.0.tar.xz
        cd qemu-4.0.0/
        ```
    - Decide the target we want.
    I only need the x86 and arm, so specifi the confiration (run ./configure --help to get the suppported tareget list.). 
        ```shell
        ./configure --target-list=aarch64-softmmu,arm-softmmu,aarch64-linux-user,aarch64_be-linux-user,arm-linux-user,armeb-linux-user,x86_64-softmmu,x86_64-linux-user 
        make
        ```
    - Use `checkinstall`, the qemu package will be generated as a .deb file and can be managed by the package manager.
    Can be easy to remove with `dpkg - r qemu`.
        ```shell
        sudo apt-get install checkinstall
        sudo checkinstall make install
        sudo apt-get install ./*.deb
        ```
        - Check the version:
        ```shell
        $ qemu-system-arm --version
        QEMU emulator version 4.0.0
        Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
        ```