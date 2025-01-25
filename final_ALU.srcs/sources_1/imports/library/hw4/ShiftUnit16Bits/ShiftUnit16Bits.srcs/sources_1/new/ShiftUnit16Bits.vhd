----------------------------------------------------------------------------------
-- Ruben Ramirez
-- 2694
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity ShiftUnit16Bits is
port(A, B : IN std_logic_vector(15 downto 0):= (others => '0');
  Direction, Op_Type   : IN std_logic := '0';
  ShiftOut   : OUT std_logic_vector(15 downto 0):= (others => '0')); 
end ShiftUnit16Bits;

architecture Behavioral of ShiftUnit16Bits is

begin
    
    process(A,B,Direction,Op_Type)
    
    variable result :std_logic_vector(15 downto 0):=(others => '0');
    variable shift_choice: std_logic_vector(1 downto 0) ;
    variable move_bits: integer;
    
    begin
      
      move_bits := to_integer(unsigned(B));
      shift_choice(1)  := Op_Type;
      shift_choice(0)   := Direction;
        case shift_choice is
        
            when "00" =>
               -- shift left operation
               if move_bits <= 15 then
                 result(15 downto move_bits) := A(15-move_bits downto 0);
                 result(move_bits-1 downto 0) := (others => '0'); 
                 ShiftOut <= result;
               else
                  ShiftOut <= x"0000";
                end if;
             
             when "01" =>  
               -- shift right operation
                if move_bits <= 15 then
                   result(15-move_bits downto 0)  :=  A(15 downto move_bits);
                   result(15 downto 16 - move_bits) := (others => '0');                 
              
                   ShiftOut <= result;
                 else
                   ShiftOut <= x"0000";
                 end if; 
                
              when "10" =>   
                   -- rotate left
                if move_bits <= 15 then
                  result(15 downto move_bits) := A(15-move_bits downto 0);   
                 
                  result(move_bits-1 downto 0)  :=  A(15 downto 16-move_bits);  
                       
                    ShiftOut <= result;
                 else
                    ShiftOut <= A;
                  end if;
                       
              when "11" =>   
                   -- rotate right
                  if move_bits <= 15 then
                  
                  result(15-move_bits downto 0)  :=  A(15 downto move_bits);   
                 
                  result(15 downto 16- move_bits)  :=  A(move_bits-1 downto 0 );  
                                 
                    ShiftOut <= result;
                 else
                    ShiftOut <= A;
                  end if;
               when others => ShiftOut <= x"ffff";
                      
               end case;        
 
    end process;

end Behavioral;
