mod blinker;

use rhdl::prelude::*;
use blinker::Blinker;

fn main() -> miette::Result<()> {
    let uut = Blinker::default();
    let desc = uut.descriptor(ScopedName::top())?;
    let hdl = desc.hdl()?;
    std::fs::write("blinker.v", hdl.modules.pretty()).unwrap();
    Ok(())
}
