library ieee;                                -- line 1
use ieee.std_logic_1164.all;                 -- line 2
                                             -- line 3
entity HW2P2 is port(                        -- line 4
    a: in bit_vector(0 to 3);                -- line 5
    b: out std_logic_vector(3 downto 0);     -- line 6
    c: in bit_vector(3 downto 0));           -- line 7
end HW2P2;                                   -- line 8
                                             -- line 9
architecture not_good of HW2P2 is            -- line 10
  begin                                      -- line 11
  my_label: process(a,c)                     -- line 12
    begin                                    -- line 13
    if c = x"F" then                         -- line 14
      b <= to_stdlogicvector(a);             -- line 15
    else                                     -- line 16
     b <= "0101";                            -- line 17
    end if;                                  -- line 18
  end process;                               -- line 19
end not_good;                                -- line 20