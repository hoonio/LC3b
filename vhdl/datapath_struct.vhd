-- hds header_start
--
-- VHDL Entity MP2_2.Datapath.interface
--
-- Created:
--          by - skim41.stdt (remsun1.ews.uiuc.edu)
--          at - 08:02:06 10/17/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      ALUMuxSel : IN     std_logic;
      ALUop     : IN     LC3b_aluop;
      DATAIN    : IN     LC3b_word;
      LoadIR    : IN     std_logic;
      LoadMAR   : IN     std_logic;
      LoadMDR   : IN     std_logic;
      LoadNZP   : IN     std_logic;
      LoadPC    : IN     std_logic;
      MARMuxSel : IN     std_logic_vector (1 DOWNTO 0);
      MDRMuxSel : IN     std_logic;
      PCMuxSel  : IN     std_logic_vector (1 DOWNTO 0);
      RESET_L   : IN     std_logic;
      RFMuxSel  : IN     std_logic_vector (1 DOWNTO 0);
      RegWrite  : IN     std_logic;
      StoreSR   : IN     std_logic;
      clk       : IN     std_logic;
      ADDRESS   : OUT    LC3b_word;
      CheckN    : OUT    std_logic;
      CheckP    : OUT    std_logic;
      CheckZ    : OUT    std_logic;
      DATAOUT   : OUT    LC3b_word;
      Opcode    : OUT    LC3b_opcode;
      bit11     : OUT    std_logic;
      n         : OUT    std_logic;
      p         : OUT    std_logic;
      z         : OUT    std_logic
   );

-- Declarations

END Datapath ;

-- hds interface_end
--
-- VHDL Architecture MP2_2.Datapath.struct
--
-- Created:
--          by - skim41.stdt (remsun1.ews.uiuc.edu)
--          at - 08:02:07 10/17/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

LIBRARY MP2_2;

ARCHITECTURE struct OF Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADJ9out     : LC3b_word;
   SIGNAL ALUout      : LC3b_word;
   SIGNAL BRaddout    : LC3b_word;
   SIGNAL F           : LC3b_word;
   SIGNAL GenCCout    : LC3b_cc;
   SIGNAL IRout       : LC3b_word;
   SIGNAL MARMuxout   : LC3b_word;
   SIGNAL MDRMuxout   : LC3b_word;
   SIGNAL MDRout      : LC3b_word;
   SIGNAL PCMuxout    : LC3b_word;
   SIGNAL PCPlus2out  : LC3b_word;
   SIGNAL PCoffset11  : LC3b_PCoffset11;
   SIGNAL PCout       : LC3b_word;
   SIGNAL RFAout      : LC3b_word;
   SIGNAL RFMuxout    : LC3b_word;
   SIGNAL RegDest     : LC3b_reg;
   SIGNAL ShiftOut    : LC3b_word;
   SIGNAL SrcA        : LC3b_reg;
   SIGNAL SrcB        : LC3b_reg;
   SIGNAL StoreMuxout : LC3b_reg;
   SIGNAL adj6out     : LC3b_word;
   SIGNAL alumuxout   : LC3b_word;
   SIGNAL dest        : LC3b_reg;
   SIGNAL imm4        : LC3b_imm4;
   SIGNAL imm5        : LC3b_imm5;
   SIGNAL immsel      : std_logic;
   SIGNAL index6      : LC3b_index6;
   SIGNAL offset9     : LC3b_offset9;
   SIGNAL rfbout      : LC3b_word;
   SIGNAL trapvect8   : LC3b_trapvect8;

   -- Implicit buffer signal declarations
   SIGNAL Opcode_internal : LC3b_opcode;


   -- Component Declarations
   COMPONENT ADJ6
   PORT (
      Opcode    : IN     LC3b_opcode ;
      clk       : IN     std_logic ;
      imm5      : IN     LC3b_imm5 ;
      index6    : IN     LC3b_index6 ;
      trapvect8 : IN     LC3b_trapvect8 ;
      adj6out   : OUT    LC3b_word ;
      immsel    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      Opcode     : IN     LC3b_opcode ;
      PCoffset11 : IN     LC3b_PCoffset11 ;
      clk        : IN     std_logic ;
      offset9    : IN     LC3b_offset9 ;
      ADJ9out    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ALU
   PORT (
      ALUop     : IN     LC3b_aluop ;
      ShiftOut  : IN     LC3b_word ;
      alumuxout : IN     LC3b_word ;
      clk       : IN     std_logic ;
      ALUout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT BRadd
   PORT (
      ADJ9out  : IN     LC3b_word ;
      PCout    : IN     LC3b_word ;
      clk      : IN     std_logic ;
      BRaddout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT DestReg
   PORT (
      Opcode  : IN     LC3b_opcode ;
      clk     : IN     std_logic ;
      dest    : IN     LC3b_reg ;
      RegDest : OUT    LC3b_reg 
   );
   END COMPONENT;
   COMPONENT GenCC
   PORT (
      RFMuxout : IN     LC3b_word ;
      clk      : IN     std_logic ;
      GenCCout : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT IR
   PORT (
      LoadIR     : IN     std_logic ;
      MDRout     : IN     LC3b_word ;
      clk        : IN     std_logic ;
      Bit11      : OUT    std_logic ;
      IRout      : OUT    LC3b_word ;
      Opcode     : OUT    LC3b_opcode ;
      PCoffset11 : OUT    LC3b_PCoffset11 ;
      SrcA       : OUT    LC3b_reg ;
      SrcB       : OUT    LC3b_reg ;
      dest       : OUT    LC3b_reg ;
      imm4       : OUT    LC3b_imm4 ;
      imm5       : OUT    LC3b_imm5 ;
      index6     : OUT    LC3b_index6 ;
      offset9    : OUT    LC3b_offset9 ;
      trapvect8  : OUT    LC3b_trapvect8 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc ;
      LoadNZP  : IN     std_logic ;
      clk      : IN     std_logic ;
      n        : OUT    std_logic ;
      p        : OUT    std_logic ;
      z        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      clk    : IN     std_logic ;
      dest   : IN     LC3b_reg ;
      CheckN : OUT    std_logic ;
      CheckP : OUT    std_logic ;
      CheckZ : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word ;
      clk        : IN     std_logic ;
      PCPlus2out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Reg16
   PORT (
      clk    : IN     std_logic ;
      input  : IN     LC3b_word ;
      reset  : IN     std_logic ;
      load   : IN     std_logic ;
      output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT RegFile
   PORT (
      RESET_L     : IN     std_logic ;
      RFMuxout    : IN     LC3b_word ;
      RegDest     : IN     LC3b_reg ;
      RegWrite    : IN     std_logic ;
      SrcB        : IN     LC3b_reg ;
      StoreMuxout : IN     LC3b_reg ;
      clk         : IN     std_logic ;
      RFAout      : OUT    LC3b_word ;
      rfbout      : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Shift
   PORT (
      Opcode   : IN     LC3b_opcode ;
      RFAout   : IN     LC3b_word ;
      clk      : IN     std_logic ;
      imm4     : IN     LC3b_imm4 ;
      imm5     : IN     LC3b_imm5 ;
      index6   : IN     LC3b_index6 ;
      ShiftOut : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT StoreMux
   PORT (
      SrcA        : IN     LC3b_reg ;
      StoreSR     : IN     std_logic ;
      clk         : IN     std_logic ;
      dest        : IN     LC3b_reg ;
      StoreMuxout : OUT    LC3b_reg 
   );
   END COMPONENT;
   COMPONENT StoreMux1
   PORT (
      adj6out   : IN     LC3b_word ;
      immsel    : IN     std_logic ;
      rfbout    : IN     LC3b_word ;
      clk       : IN     std_logic ;
      alumuxout : OUT    LC3b_word ;
      alumuxsel : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      a   : IN     LC3b_word ;
      b   : IN     LC3b_word ;
      sel : IN     std_logic ;
      f   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux4
   PORT (
      a   : IN     LC3b_word ;
      b   : IN     LC3b_word ;
      c   : IN     LC3b_word ;
      d   : IN     LC3b_word ;
      sel : IN     std_logic_vector (1 DOWNTO 0);
      f   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ZExt
   PORT (
      F        : IN     LC3b_word ;
      Opcode   : IN     LC3b_opcode ;
      clk      : IN     std_logic ;
      RFMuxout : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ6 USE ENTITY MP2_2.ADJ6;
   FOR ALL : ADJ9 USE ENTITY MP2_2.ADJ9;
   FOR ALL : ALU USE ENTITY MP2_2.ALU;
   FOR ALL : BRadd USE ENTITY MP2_2.BRadd;
   FOR ALL : DestReg USE ENTITY MP2_2.DestReg;
   FOR ALL : GenCC USE ENTITY MP2_2.GenCC;
   FOR ALL : IR USE ENTITY MP2_2.IR;
   FOR ALL : NZP USE ENTITY MP2_2.NZP;
   FOR ALL : NZPsplit USE ENTITY MP2_2.NZPsplit;
   FOR ALL : Plus2 USE ENTITY MP2_2.Plus2;
   FOR ALL : Reg16 USE ENTITY MP2_2.Reg16;
   FOR ALL : RegFile USE ENTITY MP2_2.RegFile;
   FOR ALL : Shift USE ENTITY MP2_2.Shift;
   FOR ALL : StoreMux USE ENTITY MP2_2.StoreMux;
   FOR ALL : StoreMux1 USE ENTITY MP2_2.StoreMux1;
   FOR ALL : WordMux2 USE ENTITY MP2_2.WordMux2;
   FOR ALL : WordMux4 USE ENTITY MP2_2.WordMux4;
   FOR ALL : ZExt USE ENTITY MP2_2.ZExt;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 
   DATAOUT <= MDRout;

   -- Instance port mappings.
   I16 : ADJ6
      PORT MAP (
         Opcode    => Opcode_internal,
         clk       => clk,
         imm5      => imm5,
         index6    => index6,
         trapvect8 => trapvect8,
         adj6out   => adj6out,
         immsel    => immsel
      );
   I8 : ADJ9
      PORT MAP (
         Opcode     => Opcode_internal,
         PCoffset11 => PCoffset11,
         clk        => clk,
         offset9    => offset9,
         ADJ9out    => ADJ9out
      );
   I14 : ALU
      PORT MAP (
         ALUop     => ALUop,
         ShiftOut  => ShiftOut,
         alumuxout => alumuxout,
         clk       => clk,
         ALUout    => ALUout
      );
   I9 : BRadd
      PORT MAP (
         ADJ9out  => ADJ9out,
         PCout    => PCout,
         clk      => clk,
         BRaddout => BRaddout
      );
   I21 : DestReg
      PORT MAP (
         Opcode  => Opcode_internal,
         clk     => clk,
         dest    => dest,
         RegDest => RegDest
      );
   I17 : GenCC
      PORT MAP (
         RFMuxout => RFMuxout,
         clk      => clk,
         GenCCout => GenCCout
      );
   I11 : IR
      PORT MAP (
         LoadIR     => LoadIR,
         MDRout     => MDRout,
         clk        => clk,
         Bit11      => Bit11,
         IRout      => IRout,
         Opcode     => Opcode_internal,
         PCoffset11 => PCoffset11,
         SrcA       => SrcA,
         SrcB       => SrcB,
         dest       => dest,
         imm4       => imm4,
         imm5       => imm5,
         index6     => index6,
         offset9    => offset9,
         trapvect8  => trapvect8
      );
   I18 : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         clk      => clk,
         n        => n,
         p        => p,
         z        => z
      );
   I15 : NZPsplit
      PORT MAP (
         clk    => clk,
         dest   => dest,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   I10 : Plus2
      PORT MAP (
         PCout      => PCout,
         clk        => clk,
         PCPlus2out => PCPlus2out
      );
   I2 : Reg16
      PORT MAP (
         Clk    => clk,
         Input  => MDRMuxout,
         RESET  => RESET_L,
         load   => LoadMDR,
         Output => MDRout
      );
   I1 : Reg16
      PORT MAP (
         Clk    => clk,
         Input  => MARMuxout,
         RESET  => RESET_L,
         load   => LoadMAR,
         Output => ADDRESS
      );
   I0 : Reg16
      PORT MAP (
         Clk    => clk,
         Input  => PCMuxout,
         RESET  => RESET_L,
         load   => LoadPC,
         Output => PCout
      );
   I13 : RegFile
      PORT MAP (
         RESET_L     => RESET_L,
         RFMuxout    => RFMuxout,
         RegDest     => RegDest,
         RegWrite    => RegWrite,
         SrcB        => SrcB,
         StoreMuxout => StoreMuxout,
         clk         => clk,
         RFAout      => RFAout,
         rfbout      => rfbout
      );
   I5 : Shift
      PORT MAP (
         Opcode   => Opcode_internal,
         RFAout   => RFAout,
         clk      => clk,
         imm4     => imm4,
         imm5     => imm5,
         index6   => index6,
         ShiftOut => ShiftOut
      );
   I12 : StoreMux
      PORT MAP (
         SrcA        => SrcA,
         StoreSR     => StoreSR,
         clk         => clk,
         dest        => dest,
         StoreMuxout => StoreMuxout
      );
   I20 : StoreMux1
      PORT MAP (
         adj6out   => adj6out,
         immsel    => immsel,
         rfbout    => rfbout,
         clk       => clk,
         alumuxout => alumuxout,
         alumuxsel => alumuxsel
      );
   I7 : WordMux2
      PORT MAP (
         A   => DATAIN,
         B   => ALUout,
         Sel => MDRMuxSel,
         F   => MDRMuxout
      );
   I3 : WordMux4
      PORT MAP (
         A   => PCPlus2out,
         B   => BRaddout,
         C   => IRout,
         D   => ALUout,
         Sel => PCMuxSel,
         F   => PCMuxout
      );
   I6 : WordMux4
      PORT MAP (
         A   => MDRout,
         B   => ALUout,
         C   => PCout,
         D   => BRaddout,
         Sel => RFMuxSel,
         F   => F
      );
   I4 : WordMux4
      PORT MAP (
         A   => PCout,
         B   => ALUout,
         C   => MDRout,
         D   => MDRout,
         Sel => MARMuxSel,
         F   => MARMuxout
      );
   I19 : ZExt
      PORT MAP (
         F        => F,
         Opcode   => Opcode_internal,
         clk      => clk,
         RFMuxout => RFMuxout
      );

   -- Implicit buffered output assignments
   Opcode <= Opcode_internal;

END struct;
