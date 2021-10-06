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
- [ ] Choice 2 . Or try to patch the original LLVM. 
For example, I install LLVM 9.0.0 and I haven't figure out how to add new pass of the upper repo. 
And I don't want to reinstall the LLVM.
  1. Install arm gcc tool chain. ([Reference](https://askubuntu.com/questions/1243252/how-to-install-arm-none-eabi-gdb-on-ubuntu-20-04-lts-focal-fossa))
    - Download the arm gcc toolchain from [link](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).
    - `sudo tar xjf gcc-arm-none-eabi-your-version.bz2 -C /usr/share/`
    - `sudo ln -s /usr/share/gcc-arm-none-eabi-your-version/bin/* /usr/bin/`