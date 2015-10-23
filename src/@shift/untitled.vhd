-- hds header_start
--
-- VHDL Architecture MP2.Shift.untitled
--
-- Created:
--          by - skim41.stdt (remsun2.ews.uiuc.edu)
--          at - 21:23:44 09/26/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Shift IS
   PORT( 
      Opcode   : IN     LC3b_opcode;
      RFAout   : IN     LC3b_word;
      clk      : IN     std_logic;
      imm4     : IN     LC3b_imm4;
      imm5     : IN     LC3b_imm5;
      index6   : IN     LC3b_index6;
      ShiftOut : OUT    LC3b_word
   );

-- Declarations

END Shift ;

-- hds interface_end
ARCHITECTURE untitled OF Shift IS
BEGIN

   vhdl_shift : PROCESS(imm5, imm4, index6, Opcode, RFAout)
        variable COUNT : integer;
	variable temp_shift : LC3b_word;

   BEGIN
     IF(Opcode = "1101") then
	IF(imm5(4) = '0') then
		ShiftOut <= std_logic_vector("sll"(unsigned(RFAout), to_integer(unsigned(imm4)))) after 2 ns;
	ELSIF(index6(5) = '0') then
		ShiftOut <= std_logic_vector("srl"(unsigned(RFAout), to_integer(unsigned(imm4)))) after 2 ns;
	ELSE
		COUNT := to_integer(unsigned(imm4(3 downto 0)));
		IF(imm4(3 downto 0) = "0000") then
			ShiftOut <= RFAout after 2 ns;
		ELSE
			temp_shift((15 - COUNT) downto 0) := RFAout(15 downto COUNT);
			temp_shift(15 downto (15 - COUNT + 1)) := (others => RFAout(15));
			ShiftOut <= temp_shift after 2 ns;
		end IF;
	end IF;
     ELSE
        ShiftOut <= RFAout after 2 ns;
     end IF;
   END PROCESS vhdl_shift;
END untitled;
