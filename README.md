# llvm-beginner

## Learn from llvm-cookbook

### Chap4

Other modifications to make examples work:

- Add analysis pass header file: `#include "llvm/Analysis/LoopInfo.h"`

- Add `getAnalysisUsage` function after `runOnFunction`
    ```c
    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
      AU.addRequired<LoopInfoWrapperPass>();
    }
    ```