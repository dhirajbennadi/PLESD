library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fourBitCounter_vhdl is port (
	CP		: in std_logic; 								-- clock
	SR		: in std_logic; 								-- Active low, synchronous reset
	P		: in std_logic_vector(3 downto 0); 		-- Parallel input
	PE		: in std_logic; 								-- Parallel Enable (Load)
	CEP	: in std_logic; 								-- Count enable parallel input
	CET	: in std_logic; 								-- Count enable trickle input
	Q		: out std_logic_vector(3 downto 0);		-- Parallel output
	TC		: out std_logic 								-- Terminal Count
);
end fourBitCounter_vhdl;

--CEP & CET should be high
--PE & SR also high
--TC (Temincal Count) high when output = 1111
--when SR = 0, all reset
--when PE low, we can store value in register
--

architecture behavioral of fourBitCounter_vhdl is	

signal count : std_logic_vector(0 to 3);

begin

	binaryCounter: process (CP, SR, PE, CET, CEP, P)
	begin
	


	if (CP'event and CP = '1') then	
	
		if (PE = '1') and (CET = '1') and (CEP = '1') then
			case count is
				when "0000" => count <= "0001";
				when "0001" => count <= "0010";
				when "0010" => count <= "0011";
				when "0011" => count <= "0100";
				when "0100" => count <= "0101";
				when "0101" => count <= "0110";
				when "0110" => count <= "0111";
				when "0111" => count <= "1000";
				when "1000" => count <= "1001";
				when "1001" => count <= "1010";
				when "1010" => count <= "1011";
				when "1011" => count <= "1100";
				when "1100" => count <= "1101";
				when "1101" => count <= "1110";
				when "1110" => count <= "1111";
				when "1111" => count <= "0000";
				when others => count <= "0000"; 
			end case; 
	
		elsif (PE = '0') then 
			--Store the value of the P vector into count
			count <= P; 
		
		else
			--CET CEP 0
		end if; 
		
		if (SR = '0') then
			count <= "0000";
		end if;
		
		if (count = "1111") then
			TC <= '1';
		else
			TC <= '0';
		end if;
		
		Q <= count;
		
	end if;
		
	end process binaryCounter;

end behavioral;