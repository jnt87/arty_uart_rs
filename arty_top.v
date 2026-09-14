// Wrapper: unpacks rhdl's packed clock_reset port and inverts the
// active-low reset button. Vivado's top module.
module arty_top(
    input  wire       CLK100MHZ,
    input  wire       ck_rst,    // active-low pushbutton
    input  wire       btn0,
    input  wire       uart_txd_in,
    output wire       uart_rxd_out,
    output wire [3:0] led
);
    wire reset = ~ck_rst;
    // bit 0 = clock, bit 1 = reset
    top u_top(.clock_reset({reset, CLK100MHZ}), .i(btn0), .o(led));

    assign uart_rxd_out = uart_txd_in;
endmodule
