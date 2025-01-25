----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/07/2020 08:24:29 PM
-- Design Name: 
-- Module Name: mux_2_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2_1 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0); -- this will be low input for mux
           b : in STD_LOGIC_VECTOR (15 downto 0); -- this will be high input for mux
           y : out STD_LOGIC_VECTOR (15 downto 0);   -- ouput of mux dependent on sel
           sel: in STD_LOGIC);      -- input which will determine which input a or b will pass to output
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin

process(a,b,sel)

    begin
    
    if sel = '0' then y <= a;  -- sel input set low output gets a
    
    else y <= b;                -- -- sel input set high output gets b
        
    end if;
    end process;

end Behavioral;
