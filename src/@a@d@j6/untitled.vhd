-- hds header_start
--
-- VHDL Architecture MP1.ADJ6.untitled
--
-- Created:
--          by - ykim29.stdt (eesn11.ews.uiuc.edu)
--          at - 18:10:41 09/08/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY ADJ6 IS
   PORT( 
      Opcode    : IN     LC3b_opcode;
      clk       : IN     std_logic;
      imm5      : IN     LC3b_imm5;
      index6    : IN     LC3b_index6;
      trapvect8 : IN     LC3b_trapvect8;
      adj6out   : OUT    LC3b_word;
      immsel    : OUT    std_logic
   );

-- Declarations

END ADJ6 ;

-- hds interface_end
ARCHITECTURE untitled OF ADJ6 IS
BEGIN
  vhdl_ADJ6 : process (index6, imm5, Opcode)
  begin  
	IF (Opcode = "0111" or Opcode = "0110" or Opcode = "1010" or Opcode = "1011") then  
            IF (index6(5) = '1') then
             	ADJ6out <= ("111111111" & index6 & '0') after delay_MUX2;
            ELSIF (index6(5) = '0') then
             	ADJ6out <= ("000000000" & index6 & '0') after delay_MUX2;
            end IF;
	ELSIF (Opcode = "0010" or Opcode = "0011") then
	    IF (index6(5) = '1') then
  		ADJ6out <= ("1111111111" & index6) after delay_MUX2;
	    ELSIF (index6(5) = '0') then
		ADJ6out <= ("0000000000" & index6) after delay_MUX2;
	    end IF;
	ElSIF (Opcode = "0001" or Opcode = "0101") then
	    IF (index6(5) = '1') then
                immSel <= '1';
	    ELSE 
                immSel <= '0';
            end IF;

	    IF (imm5(4) = '1') then
	     	ADJ6out <= ("11111111111" & imm5 ) after delay_MUX2;
	    ELSIF (imm5(4) = '0') then
	     	ADJ6out <= ("00000000000" & imm5 ) after delay_MUX2;
	    end IF;
	ELSIF (opcode = "1111") then
	    ADJ6out <= ("0000000" & trapvect8 & '0') ;
	END IF;
  end process vhdl_ADJ6;  
END untitled;