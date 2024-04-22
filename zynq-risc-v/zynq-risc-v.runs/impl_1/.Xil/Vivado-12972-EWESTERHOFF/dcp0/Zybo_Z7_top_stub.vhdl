-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zybo_Z7_top is
  Port ( 
    sysclk : in STD_LOGIC;
    r_btn : in STD_LOGIC;
    btn : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sw : in STD_LOGIC_VECTOR ( 3 downto 0 );
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ja : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    jc : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    jd : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    je : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end Zybo_Z7_top;

architecture stub of Zybo_Z7_top is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
