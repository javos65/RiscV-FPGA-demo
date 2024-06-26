component timer0 is
    port(
        rst_n_i: in std_logic;
        clk_i: in std_logic;
        apb_psel_i: in std_logic;
        apb_paddr_i: in std_logic_vector(31 downto 0);
        apb_pwdata_i: in std_logic_vector(31 downto 0);
        apb_pwrite_i: in std_logic;
        apb_penable_i: in std_logic;
        apb_pready_o: out std_logic;
        apb_prdata_o: out std_logic_vector(31 downto 0);
        apb_pslverr_o: out std_logic;
        int_o: out std_logic;
        timeout_o: out std_logic_vector(3 downto 0)
    );
end component;

__: timer0 port map(
    rst_n_i=>,
    clk_i=>,
    apb_psel_i=>,
    apb_paddr_i=>,
    apb_pwdata_i=>,
    apb_pwrite_i=>,
    apb_penable_i=>,
    apb_pready_o=>,
    apb_prdata_o=>,
    apb_pslverr_o=>,
    int_o=>,
    timeout_o=>
);
