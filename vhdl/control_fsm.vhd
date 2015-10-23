-- hds header_start
--
-- VHDL Entity MP2_2.Control.interface
--
-- Created:
--          by - skim41.stdt (remsun1.ews.uiuc.edu)
--          at - 08:01:56 10/17/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Control IS
   PORT( 
      CheckN    : IN     std_logic;
      CheckP    : IN     std_logic;
      CheckZ    : IN     std_logic;
      MRESP_H   : IN     std_logic;
      Opcode    : IN     LC3b_opcode;
      RESET_L   : IN     std_logic;
      START_H   : IN     std_logic;
      bit11     : IN     std_logic;
      clk       : IN     std_logic;
      n         : IN     std_logic;
      p         : IN     std_logic;
      z         : IN     std_logic;
      ALUMuxSel : OUT    std_logic;
      ALUop     : OUT    LC3b_aluop;
      LoadIR    : OUT    std_logic;
      LoadMAR   : OUT    std_logic;
      LoadMDR   : OUT    std_logic;
      LoadNZP   : OUT    std_logic;
      LoadPC    : OUT    std_logic;
      MARMuxSel : OUT    std_logic_vector (1 DOWNTO 0);
      MDRMuxSel : OUT    std_logic;
      MREAD_L   : OUT    std_logic;
      MWRITEH_L : OUT    std_logic;
      MWRITEL_L : OUT    std_logic;
      PCMuxSel  : OUT    std_logic_vector (1 DOWNTO 0);
      RFMuxSel  : OUT    std_logic_vector (1 DOWNTO 0);
      RegWrite  : OUT    std_logic;
      StoreSR   : OUT    std_logic
   );

-- Declarations

END Control ;

-- hds interface_end
--
-- VHDL Architecture MP2_2.Control.fsm
--
-- Created:
--          by - skim41.stdt (remsun1.ews.uiuc.edu)
--          at - 08:01:56 10/17/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ARCHITECTURE fsm OF Control IS

   -- Architecture Declarations
   TYPE STATE_TYPE IS (
      Reset,
      Decode,
      L_NOT,
      L_AND,
      ADD,
      BR1,
      BR2,
      LEA1,
      LEA2,
      s2,
      s3,
      s4,
      s5,
      s6,
      s7,
      s0,
      IF1,
      IF2,
      IF3,
      CalcAddr,
      ST1,
      ST2,
      LD1,
      LD2,
      CalcAddr2,
      LD7,
      ST6,
      LD8,
      s1,
      ST4,
      CalcAddr1,
      LD4,
      LD6,
      LD3,
      LD5
   );

   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state" ;


   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE ;
   SIGNAL next_state : STATE_TYPE ;

BEGIN

   ----------------------------------------------------------------------------
   clocked : PROCESS(
      clk,
      RESET_L
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= Reset;
         -- Reset Values
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
         -- Default Assignment To Internals

      END IF;

   END PROCESS clocked;

   ----------------------------------------------------------------------------
   nextstate : PROCESS (
      CheckN,
      CheckP,
      CheckZ,
      MRESP_H,
      Opcode,
      START_H,
      bit11,
      current_state,
      n,
      p,
      z
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE current_state IS
      WHEN Reset =>
         IF (START_H = '1') THEN
            next_state <= IF1;
         ELSE
            next_state <= Reset;
         END IF;
      WHEN Decode =>
         IF (Opcode = op_add) THEN
            next_state <= ADD;
         ELSIF (Opcode = op_and) THEN
            next_state <= L_AND;
         ELSIF (Opcode = op_not) THEN
            next_state <= L_NOT;
         ELSIF ((Opcode = op_ldr) OR 
         (Opcode = op_str)) THEN
            next_state <= CalcAddr;
         ELSIF ((Opcode = op_ldb) OR
         (Opcode = op_stb)) THEN
            next_state <= CalcAddr2;
         ELSIF ((Opcode = op_ldi) OR
         (Opcode = op_sti)) THEN
            next_state <= CalcAddr1;
         ELSIF (Opcode = op_br) THEN
            next_state <= BR1;
         ELSIF (Opcode = op_lea) THEN
            next_state <= LEA1;
         ELSIF ((opcode = op_jmp) OR (opcode = op_ret)) THEN
            next_state <= s2;
         ELSIF ((opcode = op_jsr) OR (opcode = op_jsrr)
         OR (opcode = op_trap)) THEN
            next_state <= s4;
         ELSIF (opcode = op_shf) THEN
            next_state <= s0;
         ELSE
            next_state <= IF1;
         END IF;
      WHEN L_NOT =>
            next_state <= IF1;
      WHEN L_AND =>
            next_state <= IF1;
      WHEN ADD =>
            next_state <= IF1;
      WHEN BR1 =>
         IF (((n AND CheckN) OR
         (p AND CheckP) OR
         (z AND CheckZ)) = '1') THEN
            next_state <= BR2;
         ELSE
            next_state <= IF1;
         END IF;
      WHEN BR2 =>
            next_state <= IF1;
      WHEN LEA1 =>
            next_state <= LEA2;
      WHEN LEA2 =>
            next_state <= IF1;
      WHEN s2 =>
            next_state <= s3;
      WHEN s3 =>
            next_state <= IF1;
      WHEN s4 =>
         IF ((opcode = op_jsr) and (Bit11 = '1')) THEN
            next_state <= s6;
         ELSIF ((opcode = op_jsrr) and (Bit11 = '0')) THEN
            next_state <= s5;
         ELSIF (Opcode = op_trap) THEN
            next_state <= s7;
         ELSE
            next_state <= s4;
         END IF;
      WHEN s5 =>
            next_state <= IF1;
      WHEN s6 =>
            next_state <= IF1;
      WHEN s7 =>
            next_state <= IF1;
      WHEN s0 =>
            next_state <= IF1;
      WHEN IF1 =>
            next_state <= IF2;
      WHEN IF2 =>
         IF (MRESP_H = '1') THEN
            next_state <= IF3;
         ELSE
            next_state <= IF2;
         END IF;
      WHEN IF3 =>
            next_state <= Decode;
      WHEN CalcAddr =>
         IF (Opcode = op_str) THEN
            next_state <= ST1;
         ELSIF (Opcode = op_ldr) THEN
            next_state <= LD1;
         ELSE
            next_state <= CalcAddr;
         END IF;
      WHEN ST1 =>
            next_state <= ST2;
      WHEN ST2 =>
         IF (MRESP_H = '1') THEN
            next_state <= IF1;
         ELSE
            next_state <= ST2;
         END IF;
      WHEN LD1 =>
         IF (MRESP_H = '1') THEN
            next_state <= LD2;
         ELSE
            next_state <= LD1;
         END IF;
      WHEN LD2 =>
            next_state <= IF1;
      WHEN CalcAddr2 =>
         IF (Opcode = op_ldb) THEN
            next_state <= LD7;
         ELSIF (Opcode = op_stb) THEN
            next_state <= ST6;
         ELSE
            next_state <= CalcAddr2;
         END IF;
      WHEN LD7 =>
         IF (MRESP_H = '1') THEN
            next_state <= LD8;
         ELSE
            next_state <= LD7;
         END IF;
      WHEN ST6 =>
         IF (MRESP_H = '1') THEN
            next_state <= IF1;
         ELSE
            next_state <= ST6;
         END IF;
      WHEN LD8 =>
            next_state <= IF1;
      WHEN s1 =>
            next_state <= ST4;
      WHEN ST4 =>
         IF (MRESP_H = '1') THEN
            next_state <= IF1;
         ELSE
            next_state <= ST4;
         END IF;
      WHEN CalcAddr1 =>
            next_state <= LD3;
      WHEN LD4 =>
         IF (Opcode = op_ldi) THEN
            next_state <= LD5;
         ELSIF (Opcode = op_sti) THEN
            next_state <= s1;
         ELSE
            next_state <= LD4;
         END IF;
      WHEN LD6 =>
            next_state <= IF1;
      WHEN LD3 =>
         IF (MRESP_H = '1') THEN
            next_state <= LD4;
         ELSE
            next_state <= LD3;
         END IF;
      WHEN LD5 =>
         IF (MRESP_H = '1') THEN
            next_state <= LD6;
         ELSE
            next_state <= LD5;
         END IF;
      WHEN OTHERS =>
         next_state <= Reset;
      END CASE;

   END PROCESS nextstate;

   ----------------------------------------------------------------------------
   output : PROCESS (
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      -- Default Assignment
      ALUMuxSel <= '0';
      ALUop <= "000";
      LoadIR <= '0';
      LoadMAR <= '0';
      LoadMDR <= '0';
      LoadNZP <= '0';
      LoadPC <= '0';
      MARMuxSel <= "00";
      MDRMuxSel <= '0';
      MREAD_L <= '1';
      MWRITEH_L <= '1';
      MWRITEL_L <= '1';
      PCMuxSel <= "00";
      RFMuxSel <= "00";
      RegWrite <= '0';
      StoreSR <= '1';
      -- Default Assignment To Internals

      -- Combined Actions
      CASE current_state IS
      WHEN L_NOT =>
         ALUop <= alu_not;
         RegWrite <= '1';
         LoadNZP <= '1';
         RFMuxSel <= "01";
      WHEN L_AND =>
         ALUop <= alu_and;
         RegWrite <= '1';
         LoadNZP <= '1';
         RFMuxSel <= "01";
      WHEN ADD =>
         ALUop <= alu_add;
         RegWrite <= '1';
         LoadNZP <= '1';
         RFMuxSel <= "01";
      WHEN BR2 =>
         PCMuxSel <= "01";
         LoadPC <= '1';
      WHEN LEA1 =>
         RFMuxSel <= "11";
         RegWrite <= '1';
      WHEN LEA2 =>
         LoadNZP <= '1';
      WHEN s2 =>
         StoreSR <= '1';
         RegWrite <= '0';
         ALUop <= alu_pass;
         MARMuxSel <= "01";
         loadMAR <= '1';
      WHEN s3 =>
         aluop <= alu_pass;
         MDRMuxSel <= '1';
         LoadMDR <= '1';
         LoadIR <= '1';
         PCMuxSel <= "11";
         LoadPC <= '1';
      WHEN s4 =>
         RFMuxSel <= "10";
         RegWrite <= '1';
      WHEN s5 =>
         StoreSR <= '1';
         ALUop <= alu_pass;
         MDRMuxSel <= '1';
         LoadMDR <= '1';
         LoadIR <= '1';
         PCMuxSel <= "11";
         LoadPC <= '1';
      WHEN s6 =>
         PCMuxSel <= "01";
         LoadPC <= '1';
      WHEN s7 =>
         ALUMuxSel <= '1';
         ALUop <= alu_pass2;
         MARMuxSel <= "01";
         LoadMAR <= '1';
         MDRMuxSel <= '1';
         LoadMDR <= '1';
         LoadIR <= '1';
         PCMuxSel <= "11";
         LoadPC <= '1';
      WHEN s0 =>
         StoreSR <= '1';
         ALUop <= alu_pass;
         RFMuxSel <= "01";
         LoadNZP <= '1';
         RegWrite <= '1';
      WHEN IF1 =>
         LoadMAR <= '1';
         LoadPC <= '1';
      WHEN IF2 =>
         LoadMDR <= '1';
         MREAD_L <= '0' after 6 ns;
      WHEN IF3 =>
         LoadIR <= '1';
      WHEN CalcAddr =>
         ALUMuxSel <= '1';
         ALUop <= alu_add;
         MARMuxSel <= "01";
         LoadMAR <= '1';
      WHEN ST1 =>
         StoreSR <= '0';
         ALUop <= alu_pass;
         LoadMDR <= '1';
         MDRMuxSel <= '1';
      WHEN ST2 =>
         MWRITEH_L <= '0' after 6 ns;
         MWRITEL_L <= '0' after 6 ns;
      WHEN LD1 =>
         MDRMuxSel <= '0';
         LoadMDR <= '1';
         MREAD_L <= '0' after 6 ns;
      WHEN LD2 =>
         RegWrite <= '1';
         LoadNZP <= '1';
      WHEN CalcAddr2 =>
         StoreSR <= '1';
         ALUMuxSel <= '1';
         ALUop <= alu_add;
         MARMuxSel <= "01";
         LoadMAR <= '1';
      WHEN LD7 =>
         MDRMuxSel <= '0';
         LoadMDR <= '1';
         RFMuxSel <= "00";
         MREAD_L <= '0' after 6 ns;
      WHEN ST6 =>
         StoreSR <= '0';
         ALUop <= alu_pass;
         MDRMuxSel <= '1';
         LoadMDR <= '1';
         MWRITEL_L <= '0' after 6 ns;
      WHEN LD8 =>
         RegWrite <= '1';
         LoadNZP <= '1';
      WHEN s1 =>
         StoreSR <= '0';
         ALUop <= alu_pass;
         MDRMuxSel <= '1';
         LoadMDR <= '1';
      WHEN ST4 =>
         MWRITEH_L <= '0' after 8 ns;
         MWRITEL_L <= '0' after 8 ns;
      WHEN CalcAddr1 =>
         StoreSR <= '1';
         ALUMuxSel <= '1';
         ALUop <= alu_add;
         MARMuxSel <= "01";
         LoadMAR <= '1';
      WHEN LD4 =>
         MDRMuxSel <= '0';
         LoadMDR <= '1';
         MARMuxSel <= "10";
         LoadMAR <= '1';
      WHEN LD6 =>
         RFMuxSel <= "00";
         RegWrite <= '1';
         LoadNZP <= '1';
      WHEN LD3 =>
         MDRMuxSel <= '0';
         LoadMDR <= '1';
         MREAD_L <= '0' after 6 ns;
      WHEN LD5 =>
         LoadMDR <= '1';
         MDRMuxSel <= '0';
         MREAD_L <= '0' after 6 ns;
      WHEN OTHERS =>
         NULL;
      END CASE;

   END PROCESS output;

   -- Concurrent Statements

END fsm;