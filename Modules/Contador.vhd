-------------------------------------------------------------------------------------
-- Description: Counter that counts the "ones" in a std_logic_vector given
-- Developer: Uri Leal
-- Board: Arduino Nano
-- GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
-- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Contador is

    Port (A : in  STD_LOGIC_VECTOR (2 downto 0);
          unos : out  STD_LOGIC_VECTOR (1 downto 0));

end Contador;

architecture Behavioral of Contador is

signal cont : STD_LOGIC_VECTOR(1 downto 0):= "00";

begin

process(A)
	variable count : unsigned(1 downto 0) := "00";
	begin
		count := "00";   -- initialize count variable.
		for i in 0 to 2 loop   -- check for all the bits.
			if(A(i) = '1') then -- check if the bit is '1'
				count := count + 1; -- if its one, increment the count.
			end if;
		end loop;
		unos <= std_logic_vector(count);    -- Assign the count to output.
end process;

end Behavioral;