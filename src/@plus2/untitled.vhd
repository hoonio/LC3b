-- hds header_start
--
-- VHDL Architecture MP1.Plus2.untitled
--
-- Created:
--          by - ykim29.stdt (eesn11.ews.uiuc.edu)
--          at - 18:16:50 09/08/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Plus2 IS
   PORT( 
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
   );

-- Declarations

END Plus2 ;

-- hds interface_end

ARCHITECTURE untitled OF Plus2 IS
BEGIN
  vhdl_ADD_2 : process (PCout)
  begin  -- process

    PCPlus2out <= std_logic_vector( unsigned(PCout) + 2 ) after delay_adder;
  
  end process;
  
END untitled;