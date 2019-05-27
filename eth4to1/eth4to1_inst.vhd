	component eth4to1 is
		port (
			clk_clk                              : in  std_logic                      := 'X';             -- clk
			clk_100_clk                          : in  std_logic                      := 'X';             -- clk
			clk_312_out_clk_clk                  : out std_logic;                                         -- clk
			eth_in_mux_out_data                  : out std_logic_vector(127 downto 0);                    -- data
			eth_in_mux_out_valid                 : out std_logic;                                         -- valid
			eth_in_mux_out_ready                 : in  std_logic                      := 'X';             -- ready
			eth_in_mux_out_startofpacket         : out std_logic;                                         -- startofpacket
			eth_in_mux_out_endofpacket           : out std_logic;                                         -- endofpacket
			eth_in_mux_out_empty                 : out std_logic_vector(3 downto 0);                      -- empty
			eth_in_mux_out_channel               : out std_logic_vector(7 downto 0);                      -- channel
			ethpack_control_region_enable_export : out std_logic_vector(7 downto 0);                      -- export
			ethpack_control_region_freeze_export : out std_logic_vector(7 downto 0);                      -- export
			ethpack_tagin_data                   : in  std_logic_vector(9 downto 0)   := (others => 'X'); -- data
			ethpack_tagin_valid                  : in  std_logic                      := 'X';             -- valid
			ethpack_tagin_ready                  : out std_logic;                                         -- ready
			pcie_clk_in_clk_clk                  : in  std_logic                      := 'X';             -- clk
			pcie_hip_serial_rx_in0               : in  std_logic                      := 'X';             -- rx_in0
			pcie_hip_serial_rx_in1               : in  std_logic                      := 'X';             -- rx_in1
			pcie_hip_serial_rx_in2               : in  std_logic                      := 'X';             -- rx_in2
			pcie_hip_serial_rx_in3               : in  std_logic                      := 'X';             -- rx_in3
			pcie_hip_serial_rx_in4               : in  std_logic                      := 'X';             -- rx_in4
			pcie_hip_serial_rx_in5               : in  std_logic                      := 'X';             -- rx_in5
			pcie_hip_serial_rx_in6               : in  std_logic                      := 'X';             -- rx_in6
			pcie_hip_serial_rx_in7               : in  std_logic                      := 'X';             -- rx_in7
			pcie_hip_serial_tx_out0              : out std_logic;                                         -- tx_out0
			pcie_hip_serial_tx_out1              : out std_logic;                                         -- tx_out1
			pcie_hip_serial_tx_out2              : out std_logic;                                         -- tx_out2
			pcie_hip_serial_tx_out3              : out std_logic;                                         -- tx_out3
			pcie_hip_serial_tx_out4              : out std_logic;                                         -- tx_out4
			pcie_hip_serial_tx_out5              : out std_logic;                                         -- tx_out5
			pcie_hip_serial_tx_out6              : out std_logic;                                         -- tx_out6
			pcie_hip_serial_tx_out7              : out std_logic;                                         -- tx_out7
			pcie_npor_npor                       : in  std_logic                      := 'X';             -- npor
			pcie_npor_pin_perst                  : in  std_logic                      := 'X';             -- pin_perst
			pr_freeze_freeze                     : out std_logic;                                         -- freeze
			reset_reset_n                        : in  std_logic                      := 'X';             -- reset_n
			reset_0_reset_n                      : in  std_logic                      := 'X';             -- reset_n
			xgmii_rx_data_0_data                 : in  std_logic_vector(71 downto 0)  := (others => 'X'); -- data
			xgmii_rx_data_1_data                 : in  std_logic_vector(71 downto 0)  := (others => 'X'); -- data
			xgmii_rx_data_2_data                 : in  std_logic_vector(71 downto 0)  := (others => 'X'); -- data
			xgmii_rx_data_3_data                 : in  std_logic_vector(71 downto 0)  := (others => 'X'); -- data
			xgmii_tx_data_0_data                 : out std_logic_vector(71 downto 0);                     -- data
			xgmii_tx_data_1_data                 : out std_logic_vector(71 downto 0);                     -- data
			xgmii_tx_data_2_data                 : out std_logic_vector(71 downto 0);                     -- data
			xgmii_tx_data_3_data                 : out std_logic_vector(71 downto 0)                      -- data
		);
	end component eth4to1;

	u0 : component eth4to1
		port map (
			clk_clk                              => CONNECTED_TO_clk_clk,                              --                           clk.clk
			clk_100_clk                          => CONNECTED_TO_clk_100_clk,                          --                       clk_100.clk
			clk_312_out_clk_clk                  => CONNECTED_TO_clk_312_out_clk_clk,                  --               clk_312_out_clk.clk
			eth_in_mux_out_data                  => CONNECTED_TO_eth_in_mux_out_data,                  --                eth_in_mux_out.data
			eth_in_mux_out_valid                 => CONNECTED_TO_eth_in_mux_out_valid,                 --                              .valid
			eth_in_mux_out_ready                 => CONNECTED_TO_eth_in_mux_out_ready,                 --                              .ready
			eth_in_mux_out_startofpacket         => CONNECTED_TO_eth_in_mux_out_startofpacket,         --                              .startofpacket
			eth_in_mux_out_endofpacket           => CONNECTED_TO_eth_in_mux_out_endofpacket,           --                              .endofpacket
			eth_in_mux_out_empty                 => CONNECTED_TO_eth_in_mux_out_empty,                 --                              .empty
			eth_in_mux_out_channel               => CONNECTED_TO_eth_in_mux_out_channel,               --                              .channel
			ethpack_control_region_enable_export => CONNECTED_TO_ethpack_control_region_enable_export, -- ethpack_control_region_enable.export
			ethpack_control_region_freeze_export => CONNECTED_TO_ethpack_control_region_freeze_export, -- ethpack_control_region_freeze.export
			ethpack_tagin_data                   => CONNECTED_TO_ethpack_tagin_data,                   --                 ethpack_tagin.data
			ethpack_tagin_valid                  => CONNECTED_TO_ethpack_tagin_valid,                  --                              .valid
			ethpack_tagin_ready                  => CONNECTED_TO_ethpack_tagin_ready,                  --                              .ready
			pcie_clk_in_clk_clk                  => CONNECTED_TO_pcie_clk_in_clk_clk,                  --               pcie_clk_in_clk.clk
			pcie_hip_serial_rx_in0               => CONNECTED_TO_pcie_hip_serial_rx_in0,               --               pcie_hip_serial.rx_in0
			pcie_hip_serial_rx_in1               => CONNECTED_TO_pcie_hip_serial_rx_in1,               --                              .rx_in1
			pcie_hip_serial_rx_in2               => CONNECTED_TO_pcie_hip_serial_rx_in2,               --                              .rx_in2
			pcie_hip_serial_rx_in3               => CONNECTED_TO_pcie_hip_serial_rx_in3,               --                              .rx_in3
			pcie_hip_serial_rx_in4               => CONNECTED_TO_pcie_hip_serial_rx_in4,               --                              .rx_in4
			pcie_hip_serial_rx_in5               => CONNECTED_TO_pcie_hip_serial_rx_in5,               --                              .rx_in5
			pcie_hip_serial_rx_in6               => CONNECTED_TO_pcie_hip_serial_rx_in6,               --                              .rx_in6
			pcie_hip_serial_rx_in7               => CONNECTED_TO_pcie_hip_serial_rx_in7,               --                              .rx_in7
			pcie_hip_serial_tx_out0              => CONNECTED_TO_pcie_hip_serial_tx_out0,              --                              .tx_out0
			pcie_hip_serial_tx_out1              => CONNECTED_TO_pcie_hip_serial_tx_out1,              --                              .tx_out1
			pcie_hip_serial_tx_out2              => CONNECTED_TO_pcie_hip_serial_tx_out2,              --                              .tx_out2
			pcie_hip_serial_tx_out3              => CONNECTED_TO_pcie_hip_serial_tx_out3,              --                              .tx_out3
			pcie_hip_serial_tx_out4              => CONNECTED_TO_pcie_hip_serial_tx_out4,              --                              .tx_out4
			pcie_hip_serial_tx_out5              => CONNECTED_TO_pcie_hip_serial_tx_out5,              --                              .tx_out5
			pcie_hip_serial_tx_out6              => CONNECTED_TO_pcie_hip_serial_tx_out6,              --                              .tx_out6
			pcie_hip_serial_tx_out7              => CONNECTED_TO_pcie_hip_serial_tx_out7,              --                              .tx_out7
			pcie_npor_npor                       => CONNECTED_TO_pcie_npor_npor,                       --                     pcie_npor.npor
			pcie_npor_pin_perst                  => CONNECTED_TO_pcie_npor_pin_perst,                  --                              .pin_perst
			pr_freeze_freeze                     => CONNECTED_TO_pr_freeze_freeze,                     --                     pr_freeze.freeze
			reset_reset_n                        => CONNECTED_TO_reset_reset_n,                        --                         reset.reset_n
			reset_0_reset_n                      => CONNECTED_TO_reset_0_reset_n,                      --                       reset_0.reset_n
			xgmii_rx_data_0_data                 => CONNECTED_TO_xgmii_rx_data_0_data,                 --               xgmii_rx_data_0.data
			xgmii_rx_data_1_data                 => CONNECTED_TO_xgmii_rx_data_1_data,                 --               xgmii_rx_data_1.data
			xgmii_rx_data_2_data                 => CONNECTED_TO_xgmii_rx_data_2_data,                 --               xgmii_rx_data_2.data
			xgmii_rx_data_3_data                 => CONNECTED_TO_xgmii_rx_data_3_data,                 --               xgmii_rx_data_3.data
			xgmii_tx_data_0_data                 => CONNECTED_TO_xgmii_tx_data_0_data,                 --               xgmii_tx_data_0.data
			xgmii_tx_data_1_data                 => CONNECTED_TO_xgmii_tx_data_1_data,                 --               xgmii_tx_data_1.data
			xgmii_tx_data_2_data                 => CONNECTED_TO_xgmii_tx_data_2_data,                 --               xgmii_tx_data_2.data
			xgmii_tx_data_3_data                 => CONNECTED_TO_xgmii_tx_data_3_data                  --               xgmii_tx_data_3.data
		);

