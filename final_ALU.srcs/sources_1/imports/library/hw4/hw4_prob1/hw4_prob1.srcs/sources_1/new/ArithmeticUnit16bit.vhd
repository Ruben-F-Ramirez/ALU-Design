----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ArithmeticUnit16bit is
    Port(A : IN  std_logic_vector(15 downto 0); -- Input
         B : IN  std_logic_vector(15 downto 0); -- Input
         Op_Sel: IN std_logic_vector(1 downto 0);--operation selection
         ArithOut: OUT std_logic_vector(15 downto 0); -- Result
         Cout    : OUT std_logic); --carry out bit of operation 
end ArithmeticUnit16bit;

architecture Behavioral of ArithmeticUnit16bit is


begin



process(A,B,Op_Sel)

variable Val_A:  integer; 
variable Val_B: integer;
variable calc : unsigned(15 downto 0);
variable Mult_A: integer;
variable Mult_B: integer;

 
    begin
       Val_A :=  to_integer(unsigned(a));
       Val_B := to_integer(unsigned(b));   
       Mult_A :=to_integer(unsigned(A(7 downto 0)));
       Mult_B :=to_integer(unsigned(b(7 downto 0)));
         
              
       case Op_Sel is
          when "00" => calc  := to_unsigned((Mult_A*Mult_B),16);      -- multiply A*B
          when "01" => calc  := to_unsigned((Val_A+Val_B),16);        -- add A+B
          when "10" => calc  :=to_unsigned((Val_A)-(Val_B),16);         --subtract A-B
          when "11" => calc  := to_unsigned(Val_A+1,16);             -- increment A = A + 1
          when others =>  calc  := to_unsigned(Val_A+1,16);
    
        end case;
        
        if Op_Sel ="11" AND A = x"ffff" then
            ArithOut <= x"0000";
            Cout <= '1';
        else
            cout <= '0';
        end if;
        
        ArithOut <= std_logic_vector(calc);       
              
    end process;

end Behavioral;
