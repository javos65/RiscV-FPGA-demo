`timescale 100 ps/100 ps
module CCU2 (
  A0,
  B0,
  C0,
  D0,
  A1,
  B1,
  C1,
  D1,
  CIN,
  COUT,
  S0,
  S1
)
;
input A0 ;
input B0 ;
input C0 ;
input D0 ;
input A1 ;
input B1 ;
input C1 ;
input D1 ;
input CIN ;
output COUT ;
output S0 ;
output S1 ;
parameter INIT0="0x0000";
parameter INIT1="0x0000";
parameter INJECT="NO";
endmodule /* CCU2 */

module DCC (
  CE,
  CLKI,
  CLKO
)
;
input CE ;
input CLKI ;
output CLKO ;
endmodule /* DCC */

(* black_box_pad_pin="TDI,TCK,TMS,TDO" *)module JTAGH19 (
  TDI,
  TCK,
  TMS,
  TDO,
  JTCK,
  JTDI,
  JSHIFT,
  JUPDATE,
  JRSTN,
  JCE2,
  CDN,
  IP_ENABLE,
  ER2_TDO
)
;
input TDI ;
input TCK ;
input TMS ;
output TDO ;
output JTCK ;
output JTDI ;
output JSHIFT ;
output JUPDATE ;
output JRSTN ;
output JCE2 ;
output CDN ;
output [18:0] IP_ENABLE ;
input [18:0] ER2_TDO ;
endmodule /* JTAGH19 */

module OSCA (
  HFOUTEN,
  HFSDSCEN,
  HFCLKOUT,
  LFCLKOUT,
  HFCLKCFG,
  HFSDCOUT
)
;
input HFOUTEN ;
input HFSDSCEN ;
output HFCLKOUT ;
output LFCLKOUT ;
output HFCLKCFG ;
output HFSDCOUT ;
endmodule /* OSCA */

module PLL (
  INTFBKOP,
  INTFBKOS,
  INTFBKOS2,
  INTFBKOS3,
  INTFBKOS4,
  INTFBKOS5,
  DIR,
  DIRSEL,
  LOADREG,
  DYNROTATE,
  LMMICLK,
  LMMIRESET_N,
  LMMIREQUEST,
  LMMIWRRD_N,
  LMMIOFFSET,
  LMMIWDATA,
  LMMIRDATA,
  LMMIRDATAVALID,
  LMMIREADY,
  PLLPOWERDOWN_N,
  REFCK,
  CLKOP,
  CLKOS,
  CLKOS2,
  CLKOS3,
  CLKOS4,
  CLKOS5,
  ENCLKOP,
  ENCLKOS,
  ENCLKOS2,
  ENCLKOS3,
  ENCLKOS4,
  ENCLKOS5,
  FBKCK,
  INTLOCK,
  LEGACY,
  LEGRDYN,
  LOCK,
  PFDDN,
  PFDUP,
  PLLRESET,
  STDBY,
  REFMUXCK,
  REGQA,
  REGQB,
  REGQB1,
  CLKOUTDL,
  ROTDEL,
  DIRDEL,
  ROTDELP1,
  GRAYTEST,
  BINTEST,
  DIRDELP1,
  GRAYACT,
  BINACT
)
;
output INTFBKOP ;
output INTFBKOS ;
output INTFBKOS2 ;
output INTFBKOS3 ;
output INTFBKOS4 ;
output INTFBKOS5 ;
input DIR ;
input [2:0] DIRSEL ;
input LOADREG ;
input DYNROTATE ;
input LMMICLK ;
input LMMIRESET_N ;
input LMMIREQUEST ;
input LMMIWRRD_N ;
input [6:0] LMMIOFFSET ;
input [7:0] LMMIWDATA ;
output [7:0] LMMIRDATA ;
output LMMIRDATAVALID ;
output LMMIREADY ;
input PLLPOWERDOWN_N ;
input REFCK ;
output CLKOP ;
output CLKOS ;
output CLKOS2 ;
output CLKOS3 ;
output CLKOS4 ;
output CLKOS5 ;
input ENCLKOP ;
input ENCLKOS ;
input ENCLKOS2 ;
input ENCLKOS3 ;
input ENCLKOS4 ;
input ENCLKOS5 ;
input FBKCK ;
output INTLOCK ;
input LEGACY ;
output LEGRDYN ;
output LOCK ;
output PFDDN ;
output PFDUP ;
input PLLRESET ;
input STDBY ;
output REFMUXCK ;
output REGQA ;
output REGQB ;
output REGQB1 ;
output CLKOUTDL ;
input ROTDEL ;
input DIRDEL ;
input ROTDELP1 ;
input [4:0] GRAYTEST ;
input [1:0] BINTEST ;
input DIRDELP1 ;
input [4:0] GRAYACT ;
input [1:0] BINACT ;
endmodule /* PLL */

