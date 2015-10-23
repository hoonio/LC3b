-- hds header_start
--
-- VHDL Architecture MP2_2.Valid_bit1.untitled
--
-- Created:
--          by - skim41.stdt (glsn46.ews.uiuc.edu)
--          at - 16:24:59 10/15/04
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2001.5 (Build 170)
--
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


LIBRARY MP2_2;
USE MP2_2.LC3b_types.all;

ENTITY Valid_bit1 IS
   PORT( 
      Clk      : IN     std_logic;
      Reset_L  : IN     std_logic;
      WriteEn1 : IN     std_logic;
      index    : IN     LC3b_index4;
      Valid1   : OUT    std_logic
   );

-- Declarations

END Valid_bit1 ;

-- hds interface_end
ARCHITECTURE untitled OF Valid_bit1 IS
BEGIN

   -------------------------------------------------------------------
   vhdl_Valid_bit1 : PROCESS (WriteEn1, index) 
   -------------------------------------------------------------------
     TYPE valid_array IS array (0 to 15) of std_logic;
     VARIABLE val0 : valid_array;
     VARIABLE int_address : integer;
   BEGIN
     int_address := to_integer(unsigned(index));

     IF RESET_L = '0' then
        For i in 15 downto 0 loop
           val0(i) := '0';
        END loop;

     ELSIF (WriteEn1 = '1') then
        val0(int_address) := '1';

     END IF;

     Valid1 <= val0(int_address) after 22ns;
	
     END PROCESS vhdl_Valid_bit1;


END untitled;