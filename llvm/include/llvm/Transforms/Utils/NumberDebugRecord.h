#ifndef LLVM_TRANSFORMS_UTILS_NUMBERDEBUGRECORD_H
#define LLVM_TRANSFORMS_UTILS_NUMBERDEBUGRECORD_H

#include "llvm/IR/PassManager.h"

namespace llvm {

struct NumberDebugRecord : public PassInfoMixin<NumberDebugRecord> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} 
#endif