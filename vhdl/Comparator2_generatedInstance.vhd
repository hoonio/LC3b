-- hds header_start
--
-- VHDL Entity MP2_2.Comparator2.generatedInstance
--
-- Created:
--          by - skim41.stdt (eesn21.ews.uiuc.edu)
--          at - 02:51:03 10/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Comparator2 IS
   PORT( 
      sig2     : OUT    std_logic;
      tag1_out : IN     LC3b_tag9;
      tag      : IN     LC3b_tag9;
      Clk      : IN     std_logic
   );

END Comparator2 ;

-- hds interface_end
-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF Comparator2 IS 
BEGIN


END generatedInstance;
