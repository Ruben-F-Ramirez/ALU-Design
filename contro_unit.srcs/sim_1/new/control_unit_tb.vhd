----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit_tb is
 -- Port (
   --     logic_out : out STD_LOGIC_VECTOR (2 downto 0) := (others => '0') );
end control_unit_tb;


architecture Behavioral of control_unit_tb is

component control_unit is
    Port ( 
           Arith_sel : out STD_LOGIC_VECTOR (1 downto 0);
           sel1 : out STD_LOGIC ;
           sel2 : out STD_LOGIC;
           sel_cout : out STD_LOGIC;
           direction : out STD_LOGIC;
           shift_type : out STD_LOGIC;
           mode : in STD_LOGIC;
           op_code : in STD_LOGIC_VECTOR (2 downto 0));
end component;
------------------ signals for output ----------------------
signal     Arith_sel :  STD_LOGIC_VECTOR (1 downto 0);
signal     sel1 :  STD_LOGIC;
signal     sel2 :  STD_LOGIC;
signal     sel_cout :  STD_LOGIC;
signal     direction :  STD_LOGIC;
signal     shift_type :  STD_LOGIC;

------------------- signals for inputs ---------------------------
signal     mode :  STD_LOGIC :='1';
signal     op_code :  STD_LOGIC_VECTOR (2 downto 0) :=(others=>'0');







begin

uut : control_unit port map(
                
                Arith_sel =>Arith_sel,
                sel1 =>sel1,
                sel2 =>sel2,
                sel_cout => sel_cout,
                direction => direction,
                shift_type => shift_type,
                mode =>mode,
                op_code => op_code);

stim_proc: process 
begin
--  hold reset state for 10 ns.
  wait for 10 ns;

---------------------test for logical unit ---------------

----------------- DESCRIPTION --------------------------
--  generate signal for logical unit and select which
--  operation will be output for unit
--  mode will remain zero for the following test cases
--------------------------------------------------------
		-- LOGIC UNIT OUTPUTS
		
		-- TEST CASE: 0
			-- LOGIC UNIT A NOR B SELECT 
			
			mode <= '0';
			op_code <= "000";
			
			wait for 10 ns;
			
		-- TEST CASE: 1
			-- LOGIC UNIT A NAND B SELECT 
			
			mode <= '0';
			op_code <= "001";
			
			wait for 10 ns;
		-- TEST CASE: 2
			-- LOGIC UNIT A OR B SELECT
			
			mode <= '0';
			op_code <= "010";
			
			wait for 10 ns;
			
		-- TEST CASE: 3
			-- LOGIC UNIT A AND B SELECT
			
			mode <= '0';
			op_code <= "011";
			
			wait for 10 ns;
			
		-- TEST CASE: 4
			-- LOGIC UNIT A XOR B SELECT
			
			mode <= '0';
			op_code <= "100";
			
			wait for 10 ns;
			
		-- TEST CASE: 5
			-- LOGIC UNIT A XNOR B SELECT
			
			mode <= '0';
			op_code <= "101";
			
			wait for 10 ns;
			
		-- TEST CASE: 6
			-- LOGIC UNIT NOT A  SELECT
			
			mode <= '0';
			op_code <= "110";
			
			wait for 10 ns;
			
		-- TEST CASE: 7
			-- LOGIC UNIT NOT B SELECT
			
			mode <= '0';
			op_code <= "111";
			
			wait for 10 ns;
			
-------------------------------- end of logic unit test ----------------------------------

---------------------test for arithmetic unit ---------------

----------------- DESCRIPTION --------------------------
--  generate signal for arithmetic unit and select which
--  operation will be output for unit
--  mode will remain one for the following test cases
--------------------------------------------------------
			
			-- ARITHMETIC UNIT OUTPUTS
		-- TEST CASE: 0
			-- ARITHMETIC UNIT A*B
			
			mode <= '1';
			op_code <= "000";
			
			wait for 10 ns;
			
		-- TEST CASE: 1
			-- ARITHMETIC UNIT A+B
			
			mode <= '1';
			op_code <= "001";
			
			wait for 10 ns;

		-- TEST CASE: 2
			-- ARITHMETIC UNIT A-B
			
			mode <= '1';
			op_code <= "010";
			
			wait for 10 ns;
			
		-- TEST CASE: 3
			-- ARITHMETIC UNIT INCREMENT A
			
			mode <= '1';
			op_code <= "011";
			
			wait for 10 ns;
			
--------------------------------- end of arithmetic unit test -----------------------------
			


---------------------test for shifter unit ---------------

----------------- DESCRIPTION --------------------------
--  generate signal for shifter unit and select which
--  operation will be output for unit
--  mode will remain one for the following test cases
--------------------------------------------------------


			-- SHIFTER UNIT OUTPUTS
			
		-- TEST CASE: 0
			-- SHIFTER UNIT SHIFT LEFT
			
			mode <= '1';
			op_code <= "100";
			
			wait for 10 ns;

		-- TEST CASE: 1
			-- SHIFTER UNIT SHIFT RIGHT
			
			mode <= '1';
			op_code <= "101";
			
			wait for 10 ns;
			
		-- TEST CASE: 2
			-- SHIFTER UNIT ROTATE LEFT
			
			mode <= '1';
			op_code <= "110";
			
			wait for 10 ns;
			
		-- TEST CASE: 3
			-- SHIFTER UNIT ROTATE RIGHT
			
			mode <= '1';
			op_code <= "111";
			
			wait for 10 ns;

--------------------------------- end of shifter unit test -----------------------------







wait;
end process;
end Behavioral;
