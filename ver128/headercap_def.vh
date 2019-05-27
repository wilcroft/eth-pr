`ifndef HEADERCAP_DEF_VH
`define HEADERCAP_DEF_VH

//`define USE_SMAC 1
//`define USE_DMAC 1
`define USE_EPROTO 1
`define USE_DPORT 1
`define USE_SPORT 1
//`define USE_IPLEN 1
`define USE_IPPROTO 1
`define USE_SIP4 1
`define USE_DIP4 1

`define MAC_LEN 48
`define EPROTO_LEN 16
`define PORT_LEN 16
`define IPLEN_LEN 16
`define IPPROTO_LEN 8
`define IP4_LEN 32

`define MAC_MASK `MAC_LEN
`define IP4_MASK `IP4_LEN

parameter CONCAT_WIDTH=0 
`ifdef USE_SMAC 
	+ `MAC_LEN 
`endif 
`ifdef USE_DMAC 
	+ `MAC_LEN 
`endif 
`ifdef USE_EPROTO 
	+ `EPROTO_LEN 
`endif 
`ifdef USE_DPORT 
	+ `PORT_LEN 
`endif 
`ifdef USE_SPORT 
	+ `PORT_LEN 
`endif 
`ifdef USE_IPLEN 
	+ `IPLEN_LEN 
`endif 
`ifdef USE_IPPROTO  
	+ `IPPROTO_LEN 
`endif 
`ifdef USE_SIP4 
	+ `IP4_LEN 
`endif 
`ifdef USE_DIP4 
	+ `IP4_LEN 
`endif
;

parameter MASK_WIDTH=0
`ifdef USE_SMAC 
	+ `MAC_MASK
`endif 
`ifdef USE_DMAC 
	+ `MAC_MASK
`endif
`ifdef USE_SIP4 
	+ `IP4_MASK
`endif 
`ifdef USE_DIP4 
	+ `IP4_MASK 
`endif
;

`endif