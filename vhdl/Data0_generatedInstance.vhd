-- hds header_start
--
-- VHDL Entity MP2_2.Data0.generatedInstance
--
-- Created:
--          by - skim41.stdt (glsn46.ews.uiuc.edu)
--          at - 18:15:08 10/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Data0 IS
   PORT( 
      CacheLine0 : OUT    LC3b_CacheLine64;
      index      : IN     LC3b_index4;
      PMDataIn   : IN     LC3b_CacheLine64;
      WriteEn0   : IN     std_logic;
      Clk        : IN     std_logic
   );

END Data0 ;

-- hds interface_end
-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF Data0 IS 
BEGIN


END generatedInstance;