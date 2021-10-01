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
4. Compile this pass, run `make` in `build/` folder. Or only compile this new pass by using [llvm-pass-skeleton](https://github.com/sampsyo/llvm-pass-skeleton).

