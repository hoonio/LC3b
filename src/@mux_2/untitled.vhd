-- hds header_start
--
-- VHDL Architecture MP2_2.Mux_2.untitled
--
-- Created:
--          by - skim41.stdt (glsn46.ews.uiuc.edu)
--          at - 17:52:35 10/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Mux_2 IS
   PORT( 
      CacheLine0    : IN     LC3b_CacheLine64;
      Cacheline1    : IN     LC3b_CacheLine64;
      Clk           : IN     std_logic;
      LineSel       : IN     std_logic;
      Data_cacheout : OUT    LC3b_CacheLine64
   );

-- Declarations

END Mux_2 ;

-- hds interface_end
ARCHITECTURE untitled OF Mux_2 IS
BEGIN

	PROCESS (CacheLine0, CacheLine1, LineSel)
		variable state : LC3b_CacheLine64;
	BEGIN
		case LineSel is
			when '0' =>
				state := CacheLine0;
			when '1' =>
				state := CacheLine1;
			when others =>
				state := (OTHERS => 'X');
		end case;
		Data_cacheout <= state after delay_MUX2;
	END PROCESS;

END untitled;
