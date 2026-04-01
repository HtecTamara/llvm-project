#ifndef LLVM_TRANSFORMS_UTILS_DELETEDEBUGRECORD_H
#define LLVM_TRANSFORMS_UTILS_DELETEDEBUGRECORD_H

#include "llvm/IR/PassManager.h"

namespace llvm {

struct DeleteDebugRecord : public PassInfoMixin<DeleteDebugRecord> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} 
#endif