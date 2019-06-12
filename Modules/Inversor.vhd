-------------------------------------------------------------------------------------
-- Description: Inverts an std_logic_vector of 3 bits with a NOT gate.
-- Developer: Uri Leal
-- Board: Arduino Nano
-- GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
-- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Inversor is

	Port(A : in std_logic_vector(2 downto 0);
		 B : out std_logic_vector(2 downto 0));

end Inversor;

architecture Behavioral of Inversor is
begin

	B <= NOT(A);

end Behavioral;