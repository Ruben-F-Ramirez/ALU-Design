----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--use IEEE.NUMERIC_STD.ALL;


entity ALU is
  Port (A,B : in std_logic_vector(15 downto 0);
        Opcode : in std_logic_vector(2 downto 0);    
        Mode : in std_logic;
        ALUout : out std_logic_vector(15 downto 0);
        Cout : out std_logic    
             );
end ALU;



architecture Behavioral of ALU is

-------- alu controller -----------

component control_unit is
    Port ( 
           Arith_sel : out STD_LOGIC_VECTOR (1 downto 0);
           sel1 : out STD_LOGIC;
           sel2 : out STD_LOGIC;
           sel_cout : out STD_LOGIC;
           direction : out STD_LOGIC;
           shift_type : out STD_LOGIC;
           mode : in STD_LOGIC;
           op_code : in STD_LOGIC_VECTOR (2 downto 0));
end component;

-- shifter unit
component ShiftUnit16Bits is
port(A, B : IN std_logic_vector(15 downto 0):= (others => '0');
  Direction, Op_Type   : IN std_logic := '0';
  ShiftOut   : OUT std_logic_vector(15 downto 0)); 
end component;

-- arithmetic unit
component ArithmeticUnit16bit is
    Port(A : IN  std_logic_vector(15 downto 0); -- Input
         B : IN  std_logic_vector(15 downto 0); -- Input
         Op_Sel: IN std_logic_vector(1 downto 0);--operation selection
         ArithOut: OUT std_logic_vector(15 downto 0); -- Result
         Cout    : OUT std_logic);  --carry out bit of operation 
          
end component;

-- logic unit
component LogicUnit16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           Opcode : in STD_LOGIC_VECTOR (2 downto 0);
           logicout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

-- 2-1 16 bit mux
component mux_2_1 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0); -- this will be low input for mux
           b : in STD_LOGIC_VECTOR (15 downto 0); -- this will be high input for mux
           y : out STD_LOGIC_VECTOR (15 downto 0);   -- ouput of mux dependent on sel
           sel: in STD_LOGIC);      -- input which will determine which input a or b will pass to output
end component;

-------------------------- and gate ---------------------------------------
component and_gate is
    port ( A : in std_logic;
            B: in std_logic;
            and_out: out std_logic);
end component;

----------------------------------------------------------------------------
-------------------------- output signals ----------------------------------
signal muxA_B:std_logic_vector(15 downto 0);
signal shift_out:STD_LOGIC_VECTOR (15 downto 0);
signal logic_out:std_logic_vector(15 downto 0);
signal arith_out:std_logic_vector(15 downto 0);
signal sel_cout: std_logic;
signal arith_select:std_logic_vector(1 downto 0);
signal direction:std_logic;
signal shift_type:std_logic;
signal sel1:std_logic;
signal sel2 :STD_LOGIC;
signal au_Cout:std_logic;
signal and_Cout:std_logic;
signal alu_out:std_logic_vector(15 downto 0);
---------------------------------------------------------------------

begin



------------------ controller port mapping --------------------------
Controller_Comp: control_unit port map(
           Arith_sel => arith_select,
           sel1 => sel1,
           sel2 => sel2,
           sel_cout => sel_cout,
           direction => direction,
           shift_type => shift_type,
           mode => Mode ,
           op_code => Opcode);
           
--------------------- arithmetic port mapping -------------------
arith_comp: ArithmeticUnit16bit Port map(
         A => A,
         B => B,
         Op_Sel =>arith_select,
         ArithOut => arith_out,
         Cout =>au_Cout);
---------------------- logic port mapping -----------------------
logic_comp: LogicUnit16bit port map(
           a => A ,
           b => B,
           Opcode => Opcode,
           logicout => logic_out);
           
---------------------- shifter port mapping -----------------------           
shift_comp: ShiftUnit16Bits port map (
           A => A, 
           B => B,
           Direction => direction,
           Op_Type => shift_type,
           ShiftOut => shift_out);

------------------------ mux from arithmetic/shifter port mapping ----------------------
mux_comp_arith_shift: mux_2_1 Port map ( a => arith_out,
           b => shift_out, -- this will be high input for mux
           y => muxA_B,   -- ouput of mux dependent on sel
           sel =>sel1);
           
------------------------ mux from logic port mapping ----------------------
mux_comp_out: mux_2_1 Port map ( a => logic_out,
           b => muxA_B, -- this will be high input for mux
           y => ALUout,   -- ouput of mux dependent on sel
           sel =>sel2);

------------------------ and gate port mapping --------------------
and_gate_comp: and_gate Port map (
          A => au_Cout,
          B => sel_cout,
          and_out => Cout);
          



end Behavioral;
