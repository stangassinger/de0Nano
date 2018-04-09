library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity runninglight is

port (
     clk:  in  std_logic := '0';
     led1: out std_logic := '0';
	 led2: out std_logic := '0';
	 led3: out std_logic := '0';
	 led4: out std_logic := '0';
	 led5: out std_logic := '0';
	 led6: out std_logic := '0';
	 led7: out std_logic := '0';
	 led8: out std_logic := '0'
);

end runninglight;

architecture rtl of runninglight is

  constant CLK_FREQ    : integer := 50000000;
  constant BLINK_FREQ  : integer := 20;
  constant CNT_MAX     : integer := CLK_FREQ/BLINK_FREQ/2-1;

  signal   cnt         : unsigned(24 downto 0) := (others => '0');
  signal   blink_vec   : std_logic_vector(8 downto 1);
  
  

begin
   
   process(clk)
 	variable         inc : integer range -1 to 1 := 1;
	variable running_lightCnt: integer := 3;  	
   begin
     
     if rising_edge(clk) then       
       if cnt=CNT_MAX then
          report "aaa";
          cnt   <= (others => '0');             
			 case running_lightCnt is
				 when 1 => blink_vec <= (others => '0');							  
							  blink_vec(1) <= '1';
							                         
				 when 2 => blink_vec <= (others => '0');							  
							  blink_vec(2) <= '1';

				 when 3 => blink_vec <= (others => '0');							  
							  blink_vec(3) <= '1';

				 when 4 => blink_vec <= (others => '0');							  
							  blink_vec(4) <= '1';

				 when 5 => blink_vec <= (others => '0');							  
							  blink_vec(5) <= '1';

				 when 6 => blink_vec <= (others => '0');							  
							  blink_vec(6) <= '1';

				 when 7 => blink_vec <= (others => '0');							  
							  blink_vec(7) <= '1';

				 when 8 => blink_vec <= (others => '0');							  
							  blink_vec(8) <= '1';
							  
				 when others => blink_vec <= (others => '0');		
				     if inc = 1 then
					      blink_vec(7) <= '1';
					      running_lightCnt := 7;
					      inc := -1;
				     else			 
					      blink_vec(2) <= '1';
					      running_lightCnt := 2;					  
							inc := 1;
					  end if;									  			           
			 end case;
			 running_lightCnt := running_lightCnt + inc;
			 
       else
         cnt  <= cnt + 1;			
       end if;

    end if;

  end process;

  led1 <= blink_vec(1);
  led2 <= blink_vec(2);
  led3 <= blink_vec(3);
  led4 <= blink_vec(4);
  led5 <= blink_vec(5);
  led6 <= blink_vec(6);
  led7 <= blink_vec(7);
  led8 <= blink_vec(8);
  

end rtl;
