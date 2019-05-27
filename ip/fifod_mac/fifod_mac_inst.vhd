	component fifod_mac is
		port (
			clk_156_in_clk_clk                     : in  std_logic                     := 'X';             -- clk
			clk_312_in_clk_clk                     : in  std_logic                     := 'X';             -- clk
			mac10g_avalon_st_pause_data            : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- data
			mac10g_avalon_st_rxstatus_valid        : out std_logic;                                        -- valid
			mac10g_avalon_st_rxstatus_data         : out std_logic_vector(39 downto 0);                    -- data
			mac10g_avalon_st_rxstatus_error        : out std_logic_vector(6 downto 0);                     -- error
			mac10g_avalon_st_txstatus_data         : out std_logic_vector(39 downto 0);                    -- data
			mac10g_avalon_st_txstatus_valid        : out std_logic;                                        -- valid
			mac10g_avalon_st_txstatus_error        : out std_logic_vector(6 downto 0);                     -- error
			mac10g_csr_address                     : in  std_logic_vector(12 downto 0) := (others => 'X'); -- address
			mac10g_csr_waitrequest                 : out std_logic;                                        -- waitrequest
			mac10g_csr_read                        : in  std_logic                     := 'X';             -- read
			mac10g_csr_readdata                    : out std_logic_vector(31 downto 0);                    -- readdata
			mac10g_csr_write                       : in  std_logic                     := 'X';             -- write
			mac10g_csr_writedata                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mac10g_link_fault_status_xgmii_rx_data : out std_logic_vector(1 downto 0);                     -- data
			mac10g_xgmii_rx_data                   : in  std_logic_vector(71 downto 0) := (others => 'X'); -- data
			mac10g_xgmii_tx_data                   : out std_logic_vector(71 downto 0);                    -- data
			rst_in_reset_reset                     : in  std_logic                     := 'X';             -- reset
			rx_st_fifo_out_data                    : out std_logic_vector(63 downto 0);                    -- data
			rx_st_fifo_out_valid                   : out std_logic;                                        -- valid
			rx_st_fifo_out_ready                   : in  std_logic                     := 'X';             -- ready
			rx_st_fifo_out_startofpacket           : out std_logic;                                        -- startofpacket
			rx_st_fifo_out_endofpacket             : out std_logic;                                        -- endofpacket
			rx_st_fifo_out_empty                   : out std_logic_vector(2 downto 0);                     -- empty
			rx_st_fifo_out_error                   : out std_logic_vector(5 downto 0);                     -- error
			tx_st_fifo_in_data                     : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			tx_st_fifo_in_valid                    : in  std_logic                     := 'X';             -- valid
			tx_st_fifo_in_ready                    : out std_logic;                                        -- ready
			tx_st_fifo_in_startofpacket            : in  std_logic                     := 'X';             -- startofpacket
			tx_st_fifo_in_endofpacket              : in  std_logic                     := 'X';             -- endofpacket
			tx_st_fifo_in_empty                    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			tx_st_fifo_in_error                    : in  std_logic_vector(0 downto 0)  := (others => 'X')  -- error
		);
	end component fifod_mac;

	u0 : component fifod_mac
		port map (
			clk_156_in_clk_clk                     => CONNECTED_TO_clk_156_in_clk_clk,                     --                    clk_156_in_clk.clk
			clk_312_in_clk_clk                     => CONNECTED_TO_clk_312_in_clk_clk,                     --                    clk_312_in_clk.clk
			mac10g_avalon_st_pause_data            => CONNECTED_TO_mac10g_avalon_st_pause_data,            --            mac10g_avalon_st_pause.data
			mac10g_avalon_st_rxstatus_valid        => CONNECTED_TO_mac10g_avalon_st_rxstatus_valid,        --         mac10g_avalon_st_rxstatus.valid
			mac10g_avalon_st_rxstatus_data         => CONNECTED_TO_mac10g_avalon_st_rxstatus_data,         --                                  .data
			mac10g_avalon_st_rxstatus_error        => CONNECTED_TO_mac10g_avalon_st_rxstatus_error,        --                                  .error
			mac10g_avalon_st_txstatus_data         => CONNECTED_TO_mac10g_avalon_st_txstatus_data,         --         mac10g_avalon_st_txstatus.data
			mac10g_avalon_st_txstatus_valid        => CONNECTED_TO_mac10g_avalon_st_txstatus_valid,        --                                  .valid
			mac10g_avalon_st_txstatus_error        => CONNECTED_TO_mac10g_avalon_st_txstatus_error,        --                                  .error
			mac10g_csr_address                     => CONNECTED_TO_mac10g_csr_address,                     --                        mac10g_csr.address
			mac10g_csr_waitrequest                 => CONNECTED_TO_mac10g_csr_waitrequest,                 --                                  .waitrequest
			mac10g_csr_read                        => CONNECTED_TO_mac10g_csr_read,                        --                                  .read
			mac10g_csr_readdata                    => CONNECTED_TO_mac10g_csr_readdata,                    --                                  .readdata
			mac10g_csr_write                       => CONNECTED_TO_mac10g_csr_write,                       --                                  .write
			mac10g_csr_writedata                   => CONNECTED_TO_mac10g_csr_writedata,                   --                                  .writedata
			mac10g_link_fault_status_xgmii_rx_data => CONNECTED_TO_mac10g_link_fault_status_xgmii_rx_data, -- mac10g_link_fault_status_xgmii_rx.data
			mac10g_xgmii_rx_data                   => CONNECTED_TO_mac10g_xgmii_rx_data,                   --                   mac10g_xgmii_rx.data
			mac10g_xgmii_tx_data                   => CONNECTED_TO_mac10g_xgmii_tx_data,                   --                   mac10g_xgmii_tx.data
			rst_in_reset_reset                     => CONNECTED_TO_rst_in_reset_reset,                     --                      rst_in_reset.reset
			rx_st_fifo_out_data                    => CONNECTED_TO_rx_st_fifo_out_data,                    --                    rx_st_fifo_out.data
			rx_st_fifo_out_valid                   => CONNECTED_TO_rx_st_fifo_out_valid,                   --                                  .valid
			rx_st_fifo_out_ready                   => CONNECTED_TO_rx_st_fifo_out_ready,                   --                                  .ready
			rx_st_fifo_out_startofpacket           => CONNECTED_TO_rx_st_fifo_out_startofpacket,           --                                  .startofpacket
			rx_st_fifo_out_endofpacket             => CONNECTED_TO_rx_st_fifo_out_endofpacket,             --                                  .endofpacket
			rx_st_fifo_out_empty                   => CONNECTED_TO_rx_st_fifo_out_empty,                   --                                  .empty
			rx_st_fifo_out_error                   => CONNECTED_TO_rx_st_fifo_out_error,                   --                                  .error
			tx_st_fifo_in_data                     => CONNECTED_TO_tx_st_fifo_in_data,                     --                     tx_st_fifo_in.data
			tx_st_fifo_in_valid                    => CONNECTED_TO_tx_st_fifo_in_valid,                    --                                  .valid
			tx_st_fifo_in_ready                    => CONNECTED_TO_tx_st_fifo_in_ready,                    --                                  .ready
			tx_st_fifo_in_startofpacket            => CONNECTED_TO_tx_st_fifo_in_startofpacket,            --                                  .startofpacket
			tx_st_fifo_in_endofpacket              => CONNECTED_TO_tx_st_fifo_in_endofpacket,              --                                  .endofpacket
			tx_st_fifo_in_empty                    => CONNECTED_TO_tx_st_fifo_in_empty,                    --                                  .empty
			tx_st_fifo_in_error                    => CONNECTED_TO_tx_st_fifo_in_error                     --                                  .error
		);

