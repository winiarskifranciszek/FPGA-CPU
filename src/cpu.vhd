library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cpu is
generic(
	N: integer := 32; 		--how many bits width
	M: integer := 8			--how many bits width element is
);
port(
	SCL: in std_logic; 		--clock
	RST: in std_logic := '1' 	--reset
);
end entity cpu;

architecture Behavioral of cpu is

--inner signals for registers
signal R0: std_logic_vector(N-1 DOWNTO 0);-- := x"00000000";
signal R1: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R2: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R3: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R4: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R5: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R6: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R7: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal R8: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal SP: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";
signal IP: std_logic_vector(N-1 DOWNTO 0);--  := x"00000000";

--signals for ram
signal RAM_DATA: std_logic_vector(M-1 DOWNTO 0);
signal RAM_ADDR: std_logic_vector(N-1 DOWNTO 0);
signal RAM_RW: std_logic;

--RAM
entity ram is
port(
	SCL: in std_logic; 				--clock
	RST: in std_logic := '1'; 			--reset
	RAM_IN: in std_logic_vector(M-1 DOWNTO 0);
	RAM_OUT: out std_logic_vector(M-1 DOWNTO 0);
	RAM_ADDR: in std_logic_vector(N-1 DOWNTO 0);
	RAM_RW: in std_logic 				--1 means read, 0 means write
);
end entity ram
--RAM END

begin

--RAM MAP
RAM: ram port map (
	SCL => SCL,
	RST => RST,
	RAM_IN => RAM_DATA,
	RAM_OUT => RAM_DATA,
	RAM_ADDR => RAM_ADDR,
	RAM_RW => RAM_RW
);
--RAM MAP END

process(SCL)
begin

--reset whole cpu	
if RST='0' then
	RAM_RW <= '1';
	RAM_ADDR <= x"00000000";
	RAM_DATA <= x"00000000";
	R0 <= x"00000000";
	R1 <= x"00000000";
	R2 <= x"00000000";
	R3 <= x"00000000";
	R4 <= x"00000000";
	R5 <= x"00000000";
	R6 <= x"00000000";
	R7 <= x"00000000";
	R8 <= x"00000000";
	SP <= x"00000000";
	IP <= x"00000000";
end if;

end process;

end architecture Behavioral;
