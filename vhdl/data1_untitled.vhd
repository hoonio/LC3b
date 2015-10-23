-- hds header_start
--
-- VHDL Architecture MP2_2.Data1.untitled
--
-- Created:
--          by - skim41.stdt (glsn46.ews.uiuc.edu)
--          at - 18:39:59 10/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Data1 IS
   PORT( 
      Clk        : IN     std_logic;
      PMDataIn   : IN     LC3b_CacheLine64;
      WriteEn1   : IN     std_logic;
      index      : IN     LC3b_index4;
      Cacheline1 : OUT    LC3b_CacheLine64
   );

-- Declarations

END Data1 ;

-- hds interface_end
ARCHITECTURE untitled OF Data1 IS
     TYPE data_array IS array (0 to 15) of LC3b_CacheLine64;
     signal data_array0 : data_array;
BEGIN

   -------------------------------------------------------------------
   vhdl_Data1 : PROCESS (WriteEn1, index, PMDataIn) 
   -------------------------------------------------------------------
     
     variable int_address : integer;
   BEGIN
     int_address := to_integer(unsigned(index));

     If (WriteEn1 = '1') then
        data_array0(int_address) <= PMDataIn;
     end if;

     CacheLine1 <= data_array0(int_address) after 22ns;
     	
     END PROCESS vhdl_Data1;

END untitled;
