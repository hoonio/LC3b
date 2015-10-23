-- hds header_start
--
-- VHDL Architecture MP1.Reg16.untitled
--
-- Created:
--          by - ykim29.stdt (glsn45.ews.uiuc.edu)
--          at - 22:35:39 09/07/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Reg16 IS
   PORT( 
      clk    : IN     std_logic;
      input  : IN     LC3b_word;
      reset  : IN     std_logic;
      load   : IN     std_logic;
      output : OUT    LC3b_word
   );

-- Declarations

END Reg16 ;

-- hds interface_end
ARCHITECTURE untitled OF Reg16 IS
	signal pre_out : LC3b_word;
BEGIN
	process (clk, RESET, Input)
	begin
		if RESET = '0' then
			pre_out <= (others => '0');
		elsif clk'event and clk = '1' then
			if (load = '1') then
				pre_out <= Input;
			end if;
		end if;
	end process;
	
	Output <= pre_out after delay_reg;
END untitled;