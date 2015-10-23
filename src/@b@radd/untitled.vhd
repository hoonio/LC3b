-- hds header_start
--
-- VHDL Architecture MP1.BRadd.untitled
--
-- Created:
--          by - ykim29.stdt (glsn24.ews.uiuc.edu)
--          at - 20:11:40 09/08/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY BRadd IS
   PORT( 
      ADJ9out  : IN     LC3b_word;
      PCout    : IN     LC3b_word;
      clk      : IN     std_logic;
      BRaddout : OUT    LC3b_word
   );

-- Declarations

END BRadd ;

-- hds interface_end
ARCHITECTURE untitled OF BRadd IS
BEGIN
    PROCESS (ADJ9out, PCout)
      variable temp : LC3b_word;
	BEGIN
		temp := std_logic_vector(signed(ADJ9out) + signed(PCout));
		BRaddout <= temp after delay_adder;
    	END PROCESS;
END untitled;
