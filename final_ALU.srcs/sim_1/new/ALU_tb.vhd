----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
component ALU 
  Port (A,B : in std_logic_vector(15 downto 0);
        Opcode : in std_logic_vector(2 downto 0);    
        Mode : in std_logic;
        ALUout : out std_logic_vector(15 downto 0);
        Cout : out std_logic    
             );
end component;
    

------------- inputs ---------------------
signal A,B: std_logic_vector (15 downto 0);
signal Opcode : std_logic_vector(2 downto 0);
signal Mode :  std_logic;
---------- out puts -----------------------
signal ALUout :  std_logic_vector(15 downto 0);
signal Cout :  std_logic; 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Mode => Mode,
          Opcode => Opcode,
          A => A,
          B => B,
          ALUout => ALUout,
          Cout => Cout
        );

 
   stim_proc: process
   begin		
    
	 -- test of arithmetic unit
	 
	 A <= x"0003";
	 B <= x"0002";
	 
	 Opcode <= "000";
	 
	 mode <= '1';
	 
	 wait for 10 ns;
	 
	 Opcode <= "001";

	 wait for 10 ns;
	 
	 Opcode <= "010";
	 
	 wait for 10 ns;
	 
	 Opcode <= "011";
	 
	 A <= x"ffff";
	 
	 wait for 10 ns;
	 
	 -- test of logic unit 
	 
	 Opcode <= "000";
	 
	 mode <= '0';
	 
	 wait for 10 ns;
	 
	 Opcode <= "001";
	 
	 A <= x"0007";

	 
	 wait for 10 ns;
	 
	 Opcode <= "010";
	 
	 wait for 10 ns;
	 
	 Opcode <= "011";
	 
	 wait for 10 ns;
	 
	 Opcode <= "100";
	 
	 wait for 10 ns;
	 
	 Opcode <= "101";
	 
	 wait for 10 ns;
	 
	 Opcode <= "110";
	 
	 
	 wait for 10 ns;
	 
	 B <= x"0003";
	 
	 Opcode <= "111";
	 
	 
	 
	 wait for 10 ns;
-- test of shifter unit	 	 
------------------------------------------------------	

	 A <= x"80A1";
	 
	 mode <= '1';
	 
	 Opcode <= "100";
	 
	 
	 wait for 10 ns;
-------------------------------------------------------	 
	 Opcode <= "101";
	 
	 B <= x"0002";
	 
	 wait for 10 ns;
------------------------------------------------------- 
	 Opcode <= "110";
	 
		 
	 wait for 10 ns;
-------------------------------------------------------	 
	 Opcode <= "111";
	 
	 wait for 10 ns;
	 

      wait;
   end process;

END;
