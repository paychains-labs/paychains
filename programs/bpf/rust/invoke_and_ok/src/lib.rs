//! Invokes an instruction and returns an error, the instruction invoked
//! uses the instruction data provided and all the accounts

use paychains_program::{
    account_info::AccountInfo, entrypoint, entrypoint::ProgramResult, instruction::AccountMeta,
    instruction::Instruction, program::invoke, pubkey::Pubkey,
};

entrypoint!(process_instruction);
#[allow(clippy::unnecessary_wraps)]
fn process_instruction(
    _program_id: &Pubkey,
    accounts: &[AccountInfo],
    instruction_data: &[u8],
) -> ProgramResult {
    let to_call = accounts[0].key;
    let infos = accounts;
    let instruction = Instruction {
        accounts: accounts[1..]
            .iter()
            .map(|acc| AccountMeta {
                pubkey: *acc.key,
                is_signer: acc.is_signer,
                is_writable: acc.is_writable,
            })
            .collect(),
        data: instruction_data.to_owned(),
        program_id: *to_call,
    };
    let _ = invoke(&instruction, infos);

    Ok(())
}
