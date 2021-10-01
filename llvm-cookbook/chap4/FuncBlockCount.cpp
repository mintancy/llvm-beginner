//===- FuncBlockCount.cpp - Modified example code from "llvm-cookbook" ---------------===//
//===- LLVM version: 9.0.0 ---------------===//

#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Analysis/LoopInfo.h"  // llvm-cookbook miss 1
using namespace llvm;

#define DEBUG_TYPE "funcblockcount"

namespace {
  // Test - The first implementation, without getAnalysisUsage.
  struct FuncBlockCount : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid

    void countBlocksInLoop (Loop *L, unsigned nest) {
      unsigned num_Blocks = 0;
      Loop::block_iterator bb;
      for (bb = L->block_begin(); bb != L->block_end(); bb++)
      {
        num_Blocks++;
        errs() << "Loop level: " << nest << " has " << num_Blocks << " blocks\n";
        std::vector<Loop*> subLoops = L->getSubLoops();
        Loop::iterator j, f;
        for (j = subLoops.begin(), f = subLoops.end(); j != f; ++j)
        {
          countBlocksInLoop(*j, nest + 1);
        }
      }
    }

    FuncBlockCount() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) override {
      LoopInfo *LI = &getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
      errs() << "Function: ";
      errs().write_escaped(F.getName()) << '\n';
      for (Loop *L : *LI)
      {
        countBlocksInLoop(L, 0);
      }
      return false;
    }

    // llvm-cookbook miss 2
    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
      AU.addRequired<LoopInfoWrapperPass>();
    }
  };
}

char FuncBlockCount::ID = 0;
static RegisterPass<FuncBlockCount> X("funcblockcount", "Function Block Count", false, false);