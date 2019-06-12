-------------------------------------------------------------------------------------
-- Description: Simple HEX to seven segment decoder.
-- Developer: Uri Leal
-- Board: Arduino Nano
-- GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
-- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Decodificador BCD a 7 Segmentos
--
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6
--  4 |   | 2
--     ---
--      3

entity Decodificador is

	Port(HEX : in STD_LOGIC_VECTOR (1 downto 0);
		 LED : out STD_LOGIC_VECTOR (10 downto 0));

end Decodificador;

architecture Behavioral of Decodificador is

begin

	-- We only use 3 spaces of the parking lot so we just need to count to 3
    with HEX SELect
    LED<= "01111111001" when "01",   -- "1111001-1001111" when "001",    -- 1
		  "01110100100" when "10",   -- "0100100-0010010" when "010",    -- 2
		  "01110110000" when "11",   -- "0110000-0000110" when "011",    -- 3
          "01111000000" when others;  -- "1000000-0000001" when others;   -- 0

end Behavioral;