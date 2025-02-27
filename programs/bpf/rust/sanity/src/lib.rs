//! Example Rust-based BPF sanity program that prints out the parameters passed to it

#![allow(unreachable_code)]

extern crate paychains_program;
use paychains_program::{
    account_info::AccountInfo, bpf_loader, entrypoint, entrypoint::ProgramResult, log::*, msg,
    pubkey::Pubkey,
};

#[derive(Debug, PartialEq)]
struct SStruct {
    x: u64,
    y: u64,
    z: u64,
}

#[inline(never)]
fn return_sstruct() -> SStruct {
    SStruct { x: 1, y: 2, z: 3 }
}

entrypoint!(process_instruction);
#[allow(clippy::unnecessary_wraps)]
pub fn process_instruction(
    program_id: &Pubkey,
    accounts: &[AccountInfo],
    instruction_data: &[u8],
) -> ProgramResult {
    msg!("Program identifier:");
    program_id.log();

    assert!(!bpf_loader::check_id(program_id));

    // Log the provided account keys and instruction input data.  In the case of
    // the no-op program, no account keys or input data are expected but real
    // programs will have specific requirements so they can do their work.
    msg!("Account keys and instruction input data:");
    pay_log_params(accounts, instruction_data);

    {
        // Test - use std methods, unwrap

        // valid bytes, in a stack-allocated array
        let sparkle_heart = [240, 159, 146, 150];
        let result_str = std::str::from_utf8(&sparkle_heart).unwrap();
        assert_eq!(4, result_str.len());
        assert_eq!("💖", result_str);
        msg!(result_str);
    }

    {
        // Test - struct return

        let s = return_sstruct();
        assert_eq!(s.x + s.y + s.z, 6);
    }

    {
        // Test - arch config
        #[cfg(not(target_arch = "bpf"))]
        panic!();
    }

    {
        // Test - float math functions
        let zero = accounts[0].try_borrow_mut_data()?.len() as f64;
        let num = zero + 8.0f64;
        let num = num.powf(0.333f64);
        // check that the result is in a correct interval close to 1.998614185980905
        assert!(1.9986f64 < num && num < 2.0f64);
    }

    pay_log_compute_units();
    Ok(())
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_return_sstruct() {
        assert_eq!(SStruct { x: 1, y: 2, z: 3 }, return_sstruct());
    }
}
