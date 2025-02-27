import React from "react";
import {
  TransactionInstruction,
  SignatureResult,
  ParsedInstruction,
} from "@paychains/web3.js";
import { InstructionCard } from "./InstructionCard";
import { programLabel } from "utils/tx";
import { useCluster } from "providers/cluster";

export function UnknownDetailsCard({
  ix,
  index,
  result,
  innerCards,
  childIndex,
}: {
  ix: TransactionInstruction | ParsedInstruction;
  index: number;
  result: SignatureResult;
  innerCards?: JSX.Element[];
  childIndex?: number;
}) {
  const { cluster } = useCluster();
  const programName =
    programLabel(ix.programId.toBase58(), cluster) || "Unknown Program";
  return (
    <InstructionCard
      ix={ix}
      index={index}
      result={result}
      title={`${programName}: Unknown Instruction`}
      innerCards={innerCards}
      childIndex={childIndex}
      defaultRaw
    />
  );
}
