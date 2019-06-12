LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

ENTITY Main_Main_sch_tb IS
END Main_Main_sch_tb;

ARCHITECTURE behavioral OF Main_Main_sch_tb IS 

   COMPONENT Main
   PORT( IR1	:	IN	STD_LOGIC; 
          IR2	:	IN	STD_LOGIC; 
          CLK	:	IN	STD_LOGIC; 
          SALIDA_MT	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          RESET	:	IN	STD_LOGIC; 
          IR_IN	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          LUGARES_DISP	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          DISPLAY_OUT	:	OUT	STD_LOGIC_VECTOR (10 DOWNTO 0));
   END COMPONENT;

   SIGNAL IR1	:	STD_LOGIC := '0';
   SIGNAL IR2	:	STD_LOGIC := '0';
   SIGNAL CLK	:	STD_LOGIC := '0';
   SIGNAL RESET	:	STD_LOGIC := '0';
   SIGNAL IR_IN	:	STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
   
   SIGNAL SALIDA_MT	:	STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
   SIGNAL LUGARES_DISP	:	STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
   SIGNAL DISPLAY_OUT	:	STD_LOGIC_VECTOR (10 DOWNTO 0) := (others => '0');
   
   -- Clock period definitions
   CONSTANT clk_period : TIME := 20 ns;

BEGIN

   UUT: Main PORT MAP(
		IR1 => IR1, 
		IR2 => IR2, 
		CLK => CLK, 
		SALIDA_MT => SALIDA_MT, 
		RESET => RESET, 
		IR_IN => IR_IN, 
		LUGARES_DISP => LUGARES_DISP, 
		DISPLAY_OUT => DISPLAY_OUT
   );
   
   -- Clock process definitions
   clk_process :process
   begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;
   end process;   

   -- Stimulus process
   stim_proc: process
   begin		
	   -- 1er auto llega a la entrada
       IR1 <= '1';
	   wait for 100 ms; -- Espera que se abran las puertas
	   
	   -- El auto entra al estacionamiento
	   IR1 <= '0';
       IR2 <= '1';
	   wait for 100 ms;
	   IR2 <= '0';
	   
	   -- Se estaciona en la posicion 3 (ultimo espacio) del estacionamiento
	   IR_IN <= "100";
	   wait for 50 ms;
	   
	   -- 2do auto llega a la entrada
       IR1 <= '1';
	   wait for 100 ms; -- Espera que se abran las puertas
	   
	   -- El auto entra al estacionamiento
	   IR1 <= '0';
       IR2 <= '1';
	   wait for 100 ms;
	   IR2 <= '0';
	   
	   -- Se estaciona en la posicion 1 (primer espacio) del estacionamiento
	   IR_IN <= "101";
	   wait for 50 ms;
	   
	   -- 3er auto llega a la entrada
       IR1 <= '1';
	   wait for 100 ms; -- Espera que se abran las puertas
	   
	   -- El auto entra al estacionamiento
	   IR1 <= '0';
       IR2 <= '1';
	   wait for 100 ms;
	   IR2 <= '0';
	   
	   -- Se estaciona en la posicion 2 del estacionamiento
	   IR_IN <= "111";
	   wait for 50 ms;
	   
	   -- 4to auto llega a la entrada
       IR1 <= '1';
	   wait for 100 ms; -- Intenta entrar al estacionamiento 

      wait;
   end process;

END;