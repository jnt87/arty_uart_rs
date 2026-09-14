use rhdl::prelude::*;
use rhdl_fpga::core::dff::DFF;
use rhdl_fpga::core::slice::msbs;


#[derive(Clone, Debug, Synchronous, SynchronousDQ)]
#[rhdl(dq_no_prefix)]
pub struct Blinker {
    count: DFF<Bits<29>>,
}

impl Default for Blinker {
    fn default() -> Self {
        Self { count: DFF::new(bits(0)) }
    }
}

impl SynchronousIO for Blinker {
    type I = bool;
    type O = Bits<4>;
    type Kernel = kernel;
}

#[kernel]
pub fn kernel(cr: ClockReset, i: bool, q: Q) -> (Bits<4>, D) {
    let mut next = q.count + 1;
    if i {next = bits(0); }
    if cr.reset.any() { next = bits(0) ; }

    (msbs::<4, 29>(q.count), D { count: next })
}
