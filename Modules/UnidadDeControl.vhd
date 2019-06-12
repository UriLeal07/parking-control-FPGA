-------------------------------------------------------------------------------------
-- Description: Brain of the system, controls the sensors and actuators that allow the
-- entrance and exit of the cars as well as the counting of the avaliable spaces of the
-- parking lot.
-- Developer: Uri Leal
-- Board: Arduino Nano
-- GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
-- Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
-------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadDeControl is

    Port(IR_LEDS      : in  STD_LOGIC_VECTOR(2 downto 0);  -- Entrada de los infrarrojos
		 numLug_Disp  : in  STD_LOGIC_VECTOR(1 downto 0);  -- Indica CUANTOS lugares hay (3 max)
		 IR_Entrada1  : in  STD_LOGIC;					   -- IR LED de entrada afuera del Estacionamiento
		 IR_Entrada2  : in  STD_LOGIC;					   -- IR LED de entrada adentro del Estacionamiento
		 Stop_MT      : in  STD_LOGIC;					   -- Entrada para saber cuando detener el motor
         reset        : in  STD_LOGIC;					   -- Entrada del reset
		 CLK          : in  STD_LOGIC;					   -- Entrada del reloj
		 Enable_MT    : out STD_LOGIC;				 	   -- Salida para activar motor
		 Dir_MT       : out STD_LOGIC;					   -- Indica la Direccion de giro del motor
		 Lug_Disp     : out STD_LOGIC_VECTOR(2 downto 0)   -- Indica QUE lugares estan ocupados
		 );
		 
end UnidadDeControl;

architecture Behavioral of UnidadDeControl is

type estados is (ESPERANDO, ABRIENDO, ENTRANDO, CERRANDO);
signal est_actual : estados := ESPERANDO;

signal enableMT : std_logic := '0';
signal sDir : std_logic := '0';

begin

process(CLK, reset, IR_Entrada1, IR_Entrada2, numLug_Disp, Stop_MT) begin

	if (reset = '1') then
		
		enableMT <= '0';
		sDir <= '0';
	
	elsif rising_edge(CLK) then
	
		case est_actual is
			
			when ESPERANDO => if((IR_Entrada1 = '1') AND (IR_Entrada2 = '0') AND (numLug_Disp < "11")) then
			
								  enableMT <= '1'; 			-- Mandamos orden para prender el motor
								  sDir <= '1';				-- Direccion de giro opuesto (anti-clockwise)
								  est_actual <= ABRIENDO;	-- Cambiamos de estado
							  
							  else
						 
								  enableMT <= '0';			-- Mantenemos motor apagado
								  est_actual <= ESPERANDO;	-- Permanecemos en el estado esperado
			
							  end if;
							  
			when ABRIENDO => if(Stop_MT = '1') then
			
								  enableMT <= '0'; 			-- Apagamos motor
								  est_actual <= ENTRANDO;	-- Cambiamos de estado
			
							  else
						 
								  est_actual <= ABRIENDO;	-- Esperamos a que la pluma abra totalmente
			
							  end if;							  
							  
						 
			when ENTRANDO => if((IR_Entrada2 = '1') AND (IR_Entrada1 = '0')) then -- Si el carro ya entro al estacionamiento
			
								  enableMT <= '1'; 			-- Mandamos orden para prender el motor
								  sDir <= '0';				-- Direccion de giro normal (clockwise)
								  est_actual <= CERRANDO;	-- Cambiamos de estado
							  
							  else
						 
								  est_actual <= ENTRANDO;	-- Esperamos a que el auto entre al estacionamiento
			
							  end if;
							  
			when CERRANDO => if(Stop_MT = '1') then		-- Cuando terminamos de rotar la pluma
			
								  enableMT <= '0'; 				-- Apagamos motor
								  est_actual <= ESPERANDO;		-- Cambiamos de estado
			
							  else
						 
								  est_actual <= CERRANDO;		-- Esperamos a que el motor gire los grados necesarios
			
							  end if;								  
						 
			end case;
	end if;
end process;

Enable_MT <= enableMT;
Dir_MT <= sDir;
Lug_Disp <= IR_LEDS;

end Behavioral;