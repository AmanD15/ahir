------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.utilities.all;

entity marked_join is
  generic(number_of_predecessors: integer; number_of_marked_predecessors: integer;
		place_capacity : integer := 1; bypass : boolean := true; name : string; marked_predecessor_bypass: BooleanArray);
  port ( preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
         marked_preds : in BooleanArray(number_of_marked_predecessors-1 downto 0);
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end marked_join;

architecture default_arch of marked_join is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal place_sigs: BooleanArray(preds'range);
  signal mplace_sigs: BooleanArray(marked_preds'range);  
  constant H: integer := preds'high;
  constant L: integer := preds'low;

  constant MH: integer := marked_preds'high;
  constant ML: integer := marked_preds'low;  

  constant mbypass: BooleanArray(MH downto ML) := marked_predecessor_bypass;

begin  -- default_arch
  
  placegen: for I in H downto L generate
    placeBlock: block
	signal place_pred: BooleanArray(0 downto 0);
    begin
	place_pred(0) <= preds(I);
      bypassgen: if (bypass) generate
	pI: place_with_bypass
		generic map(capacity => place_capacity, 
				marking => 0,
				name => name & ":(bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end generate bypassgen;

      nobypassgen: if (not bypass) generate
	pI: place
		generic map(capacity => place_capacity, 
				marking => 0,
				name => name & ":(no-bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end generate nobypassgen;
    end block;
  end generate placegen;

  -- the marked places
  mplacegen: for I in MH downto ML generate
    mplaceBlock: block
	signal place_pred: BooleanArray(0 downto 0);
    begin
	place_pred(0) <= marked_preds(I);
	bypassGen: if mbypass(I)  generate
	   mpI: place_with_bypass generic map(capacity => place_capacity, marking => 1, 
				 name => name & ":marked(bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,mplace_sigs(I),clk,reset);
	end generate bypassGen;
	NobypassGen: if (not mbypass(I))  generate
	  mpI: place generic map(capacity => place_capacity, marking => 1, 
				 name => name & ":marked(no-bypass):" & Convert_To_String(I) )
		port map(place_pred,symbol_out_sig,mplace_sigs(I),clk,reset);
	end generate NobypassGen;

    end block;
  end generate mplacegen;
  
  -- The transition is enabled only when all preds are true.
  symbol_out_sig(0) <= AndReduce(place_sigs) and AndReduce(mplace_sigs);
  symbol_out <= symbol_out_sig(0);

end default_arch;
