    timer0 __(.rst_n_i( ),
        .clk_i( ),
        .apb_psel_i( ),
        .apb_paddr_i( ),
        .apb_pwdata_i( ),
        .apb_pwrite_i( ),
        .apb_penable_i( ),
        .apb_pready_o( ),
        .apb_prdata_o( ),
        .apb_pslverr_o( ),
        .int_o( ),
        .timeout_o( ));
