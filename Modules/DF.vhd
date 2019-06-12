-------------------------------------------------------------------------------------
-- Description: Frequency divider
-- Input clock: 50 MHz (20 ns)
-- Output clock: 40 Hz (400 ms)
-- Developer: Uri Leal
-- Board: Arduino Nano
-- GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
-- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- Formula to calculate the value of the counter to output a certain frequency:
--
-- counter = clk_in / Frequency_desired_(Hertz)
--
-- In this particular case:
--
-- counter = (50_MHz / 40_Hz) / 2
-- counter = 625000
--
-- To ensure exactitude in the output clock
-- the counter value is set on: 625000 - 1 = 624999
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DF is

    Port(clk_in : in  STD_LOGIC;
         reset  : in  STD_LOGIC;
         clk_out: out STD_LOGIC);
	
end DF;

architecture Behavioral of DF is

    signal temporal: STD_LOGIC := '0';					-- Auxiliar para generar reloj de salida (LOW -> HIGH logic)
    signal counter : integer range 0 to 624999 := 0;	-- Contador para controlar se�al de salida (counter to generate output signal)

begin
    
	process (reset, clk_in) begin
	
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
			
		-- Solo funciona en ciclos positivos de reloj y cuando reset esta en LOW
        elsif rising_edge(clk_in) then
            
			if (counter >= 624999) then		
                temporal <= NOT(temporal); 	-- Conmutamos se�al de salida (generate clock signal)
                counter <= 0;				-- Reset counter
            else
                counter <= counter + 1;
            end if;
        end if;
    
	end process;
        
	clk_out <= temporal; -- Salida de reloj (resulting clock signal)

end Behavioral;