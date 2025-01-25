----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity LogicUnit16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           Opcode : in STD_LOGIC_VECTOR (2 downto 0);
           logicout : out STD_LOGIC_VECTOR (15 downto 0));
end LogicUnit16bit;

architecture Behavioral of LogicUnit16bit is

begin
--                  the select statement will determine which logic operation will be output
    with Opcode select
        logicout <= a NOR b when "000",
                    a NAND b when "001",
                    a OR b when "010",
                    a AND b when "011",
                    a XOR b when "100",
                    a XNOR b when "101",
                    NOT a when "110",
                    NOT b when "111",
                    a when others;


end Behavioral;
