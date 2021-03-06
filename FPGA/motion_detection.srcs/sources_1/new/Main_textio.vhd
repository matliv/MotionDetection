library IEEE;
library STD;
use STD.textio.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Main_textio is
--  Port ( );
end Main_textio;

architecture Behavioral of Main_textio is


signal c_out: character;
signal status_out: boolean;

begin

 ---write

--stufftofile: process  
--variable message1 : string (1 to 36) := "***> starting circuit initialization";
--variable charvalue : character := '-';
--variable intvalue : integer range 0 to 100 := 45;
--file image_inputs_file : text open write_mode is "file_output_on_disk.txt";
--variable lineout : line;

--begin
--wait for 1ps; 


--write(lineout, time'image(now) & ": " & message1);
--writeline(image_inputs_file,lineout);
--wait for 50ns;

--write(lineout, time'image(now) & ": " & charvalue & ' ' & integer'image(intvalue));
--writeline(image_inputs_file,lineout);
--wait;

--end process stufftofile; 

------------------------------------------------

--reading file

char_from_file: process

variable c: character := '?';
file image_inputs_file: text open read_mode is "image_Inputs.txt";
variable line_of_text_from_file: line;
variable status: boolean := false;

begin

while (not endfile (image_inputs_file)) loop
readline (image_inputs_file, line_of_text_from_file);
    for i in 1 to line_of_text_from_file'length loop
        read (line_of_text_from_file, c);
--    read (line_of_text_from_file, c, status);
--    status_out <= status;
--        if (status) then
--        c_out <= c;
--        else
--        c_out <= '?';
--        end if;
--        wait for 10ns;
     end loop;
end loop;        
      
assert false
report "end of data file reached - simulation stop normally"
severity failure;
     
end process char_from_file; 



end Behavioral;
