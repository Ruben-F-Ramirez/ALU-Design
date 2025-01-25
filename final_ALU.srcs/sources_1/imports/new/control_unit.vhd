----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity control_unit is
    Port ( 
           Arith_sel : out STD_LOGIC_VECTOR (1 downto 0);
           sel1 : out STD_LOGIC;
           sel2 : out STD_LOGIC;
           sel_cout : out STD_LOGIC;
           direction : out STD_LOGIC;
           shift_type : out STD_LOGIC;
           mode : in STD_LOGIC;
           op_code : in STD_LOGIC_VECTOR (2 downto 0));
end control_unit;

architecture Behavioral of control_unit is

begin




-- pass for direction in shifter unit
direction <= op_code(0);

-- pass for op type in shifter unit
shift_type <= op_code(1);

-- passes selection operation type in arithmetic unit
Arith_sel <= op_code(1 downto 0);

-- determine whether arithmetic unit or shifter unit will output to next mux
sel1 <= op_code(2);

-- determine whether output of first mux or logic unit will be output
sel2 <= mode;


cout : process(mode,op_code)

begin
sel_cout <= '0';

-- determine whether carry out from arithmetic unit is output
-- set to 1 if mode = 1 and Opcode(2) = 0, else set to 0

if ( mode = '1') and (op_code(2) = '0') then

    sel_cout <= '1';

end if;
end process;


end Behavioral;
