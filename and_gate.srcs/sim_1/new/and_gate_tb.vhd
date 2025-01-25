----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity and_gate_tb is
--  Port ( );
end and_gate_tb;

architecture Behavioral of and_gate_tb is

component and_gate 
  Port (A : in std_logic := '0';
        B : in std_logic := '0';
        and_out : out std_logic  );
end component;

signal A,B :std_logic;
signal and_out: std_logic;


begin

----------------- port map of component and gate ----------------------
uut: and_gate port map(A,B,and_out);
            
stimulus : process
begin

wait for 10 ns; -- reset period

------------------------ test of and gate -----------------------------

------------------ description ----------------------------------------
--  test of  an and gate which will logical and two inputs
--  and then output a 0 or 1 dependent of and gate behavior
------------------------------------------------------------------------

------------------------- test case 0 ----------------------------------
-- A = 0, B = 0, output should be 0 ------------------------------------

    A <= '0';
    B <= '0';
    
    wait for 20 ns;
------------------------ end test 0 -------------------------------------

------------------------- test case 1 ----------------------------------
-- A = 0, B = 1, output should be 0 ------------------------------------

    A <= '0';
    B <= '1';
    
    wait for 20 ns;
------------------------ end test 1 -------------------------------------


------------------------- test case 2 ----------------------------------
-- A = 1, B = 0, output should be 0 ------------------------------------

    A <= '1';
    B <= '0';
    
    wait for 20 ns;
------------------------ end test 2 -------------------------------------

------------------------- test case 3 ----------------------------------
-- A = 1, B = 1, output should be 1 ------------------------------------

    A <= '1';
    B <= '1';
    
    wait for 20 ns;
------------------------ end test 3 -------------------------------------



end process;
end Behavioral;
