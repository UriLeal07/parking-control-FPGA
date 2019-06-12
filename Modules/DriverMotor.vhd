-------------------------------------------------------------------------------------
-- Description: Driver unit to control the speed, rotation and direction of the
-- stepper motor.
-- Developer: Uri Leal
-- Board: Arduino Nano
-- GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
-- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity DriverMotor is

	Port (StepDrive : out std_logic_vector(3 downto 0);		-- Salida al Driver
		  Done		: out std_logic;						-- Indica cuando termino de rotar el motor
		  Direction : in std_logic; 						-- Direccion de giro
		  StepEnable : in std_logic;						-- Activar giro
		  CLK : in std_logic);								-- Reloj

end DriverMotor;

architecture Behavioral of DriverMotor is

signal state : std_logic_vector(1 downto 0) := "00"; 	-- Estado del motor (# de paso)
signal stepCounter : integer range 0 to 419 := 0;		-- Cuenta el numero de pasos dados por el motor 419
signal tMotor : std_logic_vector(3 downto 0) := "0000";	-- Auxiliar para salida al motor
signal tDone : std_logic := '0';						-- Auxiliar para salida a Done

begin

process(CLK, StepEnable)
begin

	if (StepEnable = '0') then
	
		tMotor <= "0000";
		tDone <= '0';
		stepCounter <= 0;
	
	elsif rising_edge(CLK) then
	
	if (StepEnable = '1') then
	
		if (Direction = '1') then
			state <= state - "01";
		else
			state <= state + "01";
		end if;

				-- El movimiento que se ejecuta es el normal ("Par Maximo")
		case state is
		
			when "00" => tMotor <= "1100";
			when "01" => tMotor <= "0110";
			when "10" => tMotor <= "0011";
			when others => tMotor <= "1001";
			
		end case;
		
		stepCounter <= stepCounter + 1; -- Avanzamos 1 paso
		
		if (stepCounter >= 3) then -- Terminamos rotacion
		
			stepCounter <= 0;
			tDone <= '1';
			
		end if;
	end if;
	end if;
end process;

StepDrive <= tMotor;
Done <= tDone;

end Behavioral;