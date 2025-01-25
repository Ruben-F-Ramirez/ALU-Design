----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity and_gate is
  Port (A : in std_logic := '0';
        B : in std_logic := '0';
        and_out : out std_logic );
end and_gate;

architecture Behavioral of and_gate is



begin

and_out <= A and B;



end Behavioral;
