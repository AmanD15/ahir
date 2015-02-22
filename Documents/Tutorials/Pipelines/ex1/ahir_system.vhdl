-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity vectorSum is -- 
  generic (tag_length : integer); 
  port ( -- 
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic;
    in_data_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data_pipe_pipe_read_data : in   std_logic_vector(31 downto 0);
    out_data_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data_pipe_pipe_write_data : out  std_logic_vector(31 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
  );
  -- 
end entity vectorSum;
architecture Default of vectorSum is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal default_zero_sig: std_logic;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal vectorSum_CP_1112_start: Boolean;
  signal vectorSum_CP_1112_symbol: Boolean;
  -- links between control-path and data-path
  signal WPIPE_out_data_pipe_280_inst_ack_1 : boolean;
  signal WPIPE_out_data_pipe_280_inst_ack_0 : boolean;
  signal MUL_f32_f32_278_inst_req_1 : boolean;
  signal ADD_f32_f32_270_inst_ack_0 : boolean;
  signal ADD_f32_f32_270_inst_req_0 : boolean;
  signal W_iNsTr_3_201_delayed_24_272_inst_req_0 : boolean;
  signal MUL_f32_f32_278_inst_ack_1 : boolean;
  signal RPIPE_in_data_pipe_265_inst_ack_1 : boolean;
  signal RPIPE_in_data_pipe_265_inst_req_1 : boolean;
  signal WPIPE_out_data_pipe_280_inst_req_1 : boolean;
  signal WPIPE_out_data_pipe_280_inst_req_0 : boolean;
  signal ADD_f32_f32_270_inst_req_1 : boolean;
  signal W_iNsTr_3_201_delayed_24_272_inst_req_1 : boolean;
  signal RPIPE_in_data_pipe_265_inst_req_0 : boolean;
  signal ADD_f32_f32_270_inst_ack_1 : boolean;
  signal RPIPE_in_data_pipe_265_inst_ack_0 : boolean;
  signal MUL_f32_f32_278_inst_req_0 : boolean;
  signal do_while_stmt_262_branch_req_0 : boolean;
  signal do_while_stmt_262_branch_ack_1 : boolean;
  signal W_iNsTr_3_201_delayed_24_272_inst_ack_0 : boolean;
  signal MUL_f32_f32_278_inst_ack_0 : boolean;
  signal do_while_stmt_262_branch_ack_0 : boolean;
  signal W_iNsTr_3_201_delayed_24_272_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "vectorSum_input_buffer", -- 
      buffer_size => 1,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  vectorSum_CP_1112_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "vectorSum_out_buffer", -- 
      buffer_size => 1,
      data_width => tag_length + 0, 
      kill_counter_range => 1) -- 
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      kill => default_zero_sig,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= vectorSum_CP_1112_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= vectorSum_CP_1112_start & tag_ilock_write_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= vectorSum_CP_1112_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  vectorSum_CP_1112: Block -- control-path 
    signal vectorSum_CP_1112_elements: BooleanArray(57 downto 0);
    -- 
  begin -- 
    vectorSum_CP_1112_elements(0) <= vectorSum_CP_1112_start;
    vectorSum_CP_1112_symbol <= vectorSum_CP_1112_elements(57);
    -- CP-element group 0 transition  place  bypass 
    -- predecessors 
    -- successors 7 
    -- members (14) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262__entry__
      -- 	branch_block_stmt_259/do_while_stmt_262/$entry
      -- 	branch_block_stmt_259/bb_0_bb_1
      -- 	branch_block_stmt_259/do_while_stmt_262__entry__
      -- 	$entry
      -- 	branch_block_stmt_259/merge_stmt_261__exit__
      -- 	branch_block_stmt_259/$entry
      -- 	branch_block_stmt_259/merge_stmt_261_PhiAck/$exit
      -- 	branch_block_stmt_259/merge_stmt_261_PhiAck/$entry
      -- 	branch_block_stmt_259/merge_stmt_261_PhiAck/dummy
      -- 	branch_block_stmt_259/merge_stmt_261_PhiReqMerge
      -- 	branch_block_stmt_259/bb_0_bb_1_PhiReq/$exit
      -- 	branch_block_stmt_259/bb_0_bb_1_PhiReq/$entry
      -- 	branch_block_stmt_259/branch_block_stmt_259__entry__
      -- 
    -- CP-element group 1 merge  place  bypass 
    -- predecessors 
    -- successors 57 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262__exit__
      -- 
    -- Element group vectorSum_CP_1112_elements(1) is bound as output of CP function.
    -- CP-element group 2 merge  place  bypass 
    -- predecessors 
    -- successors 6 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_back
      -- 
    -- Element group vectorSum_CP_1112_elements(2) is bound as output of CP function.
    -- CP-element group 3 branch  place  bypass 
    -- predecessors 9 
    -- successors 55 53 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/condition_done
      -- 
    vectorSum_CP_1112_elements(3) <= vectorSum_CP_1112_elements(9);
    -- CP-element group 4 branch  place  bypass 
    -- predecessors 48 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_body_done
      -- 
    vectorSum_CP_1112_elements(4) <= vectorSum_CP_1112_elements(48);
    -- CP-element group 5 fork  transition  bypass 
    -- predecessors 8 
    -- successors 12 20 39 47 31 10 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/$entry
      -- 
    vectorSum_CP_1112_elements(5) <= vectorSum_CP_1112_elements(8);
    -- CP-element group 6 transition  bypass 
    -- predecessors 2 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/back_edge_to_loop_body
      -- 
    vectorSum_CP_1112_elements(6) <= vectorSum_CP_1112_elements(2);
    -- CP-element group 7 transition  bypass 
    -- predecessors 0 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/first_time_through_loop_body
      -- 
    vectorSum_CP_1112_elements(7) <= vectorSum_CP_1112_elements(0);
    -- CP-element group 8 fork  transition  bypass 
    -- predecessors 
    -- successors 5 9 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/loop_body_start
      -- 
    -- Element group vectorSum_CP_1112_elements(8) is bound as output of CP function.
    -- CP-element group 9 transition  output  bypass 
    -- predecessors 8 
    -- successors 3 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/condition_evaluated
      -- 
    vectorSum_CP_1112_elements(9) <= vectorSum_CP_1112_elements(8);
    condition_evaluated_1138_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(9), ack => do_while_stmt_262_branch_req_0); -- 
    -- CP-element group 10 join  transition  bypass 
    -- predecessors 5 
    -- marked predecessors 11 
    -- successors 14 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_sample_start_
      -- 
    cp_element_group_10: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 19) := "cp_element_group_10"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(5) & vectorSum_CP_1112_elements(11);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(10), clk => clk, reset => reset); --
    end block;
    -- CP-element group 11 fork  transition  bypass 
    -- predecessors 15 
    -- successors 
    -- marked successors 10 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_sample_completed_
      -- 
    vectorSum_CP_1112_elements(11) <= vectorSum_CP_1112_elements(15);
    -- CP-element group 12 join  transition  bypass 
    -- predecessors 5 
    -- marked predecessors 19 30 
    -- successors 16 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_update_start_
      -- 
    cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 63,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_12"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(5) & vectorSum_CP_1112_elements(19) & vectorSum_CP_1112_elements(30);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13 fork  transition  bypass 
    -- predecessors 17 
    -- successors 28 23 22 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_update_completed_
      -- 
    vectorSum_CP_1112_elements(13) <= vectorSum_CP_1112_elements(17);
    -- CP-element group 14 transition  output  bypass 
    -- predecessors 10 
    -- successors 15 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Sample/$entry
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Sample/rr
      -- 
    vectorSum_CP_1112_elements(14) <= vectorSum_CP_1112_elements(10);
    rr_1147_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(14), ack => RPIPE_in_data_pipe_265_inst_req_0); -- 
    -- CP-element group 15 transition  input  bypass 
    -- predecessors 14 
    -- successors 11 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Sample/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Sample/ra
      -- 
    ra_1148_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_pipe_265_inst_ack_0, ack => vectorSum_CP_1112_elements(15)); -- 
    -- CP-element group 16 transition  output  bypass 
    -- predecessors 12 
    -- successors 17 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Update/cr
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Update/$entry
      -- 
    vectorSum_CP_1112_elements(16) <= vectorSum_CP_1112_elements(12);
    cr_1152_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(16), ack => RPIPE_in_data_pipe_265_inst_req_1); -- 
    -- CP-element group 17 transition  input  bypass 
    -- predecessors 16 
    -- successors 13 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Update/ca
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/RPIPE_in_data_pipe_265_Update/$exit
      -- 
    ca_1153_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_pipe_265_inst_ack_1, ack => vectorSum_CP_1112_elements(17)); -- 
    -- CP-element group 18 join  transition  bypass 
    -- predecessors 23 22 
    -- marked predecessors 19 
    -- successors 24 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_sample_start_
      -- 
    cp_element_group_18: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 63,1 => 63,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 19) := "cp_element_group_18"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(23) & vectorSum_CP_1112_elements(22) & vectorSum_CP_1112_elements(19);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(18), clk => clk, reset => reset); --
    end block;
    -- CP-element group 19 fork  transition  bypass 
    -- predecessors 25 
    -- successors 
    -- marked successors 12 18 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_sample_completed_
      -- 
    vectorSum_CP_1112_elements(19) <= vectorSum_CP_1112_elements(25);
    -- CP-element group 20 join  transition  bypass 
    -- predecessors 5 
    -- marked predecessors 38 
    -- successors 26 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_update_start_
      -- 
    cp_element_group_20: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_20"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(5) & vectorSum_CP_1112_elements(38);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(20), clk => clk, reset => reset); --
    end block;
    -- CP-element group 21 transition  bypass 
    -- predecessors 27 
    -- successors 37 
    -- members (5) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_4_277_update_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_4_277_sample_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_4_277_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_4_277_sample_start_
      -- 
    vectorSum_CP_1112_elements(21) <= vectorSum_CP_1112_elements(27);
    -- CP-element group 22 transition  bypass 
    -- predecessors 13 
    -- successors 18 
    -- members (4) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_268_sample_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_268_sample_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_268_update_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_268_update_completed_
      -- 
    vectorSum_CP_1112_elements(22) <= vectorSum_CP_1112_elements(13);
    -- CP-element group 23 transition  bypass 
    -- predecessors 13 
    -- successors 18 
    -- members (4) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_269_sample_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_269_update_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_269_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_269_sample_completed_
      -- 
    vectorSum_CP_1112_elements(23) <= vectorSum_CP_1112_elements(13);
    -- CP-element group 24 transition  output  bypass 
    -- predecessors 18 
    -- successors 25 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Sample/rr
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Sample/$entry
      -- 
    vectorSum_CP_1112_elements(24) <= vectorSum_CP_1112_elements(18);
    rr_1169_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(24), ack => ADD_f32_f32_270_inst_req_0); -- 
    -- CP-element group 25 transition  input  bypass 
    -- predecessors 24 
    -- successors 19 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Sample/ra
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Sample/$exit
      -- 
    ra_1170_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_270_inst_ack_0, ack => vectorSum_CP_1112_elements(25)); -- 
    -- CP-element group 26 transition  output  bypass 
    -- predecessors 20 
    -- successors 27 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Update/$entry
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Update/cr
      -- 
    vectorSum_CP_1112_elements(26) <= vectorSum_CP_1112_elements(20);
    cr_1174_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(26), ack => ADD_f32_f32_270_inst_req_1); -- 
    -- CP-element group 27 transition  input  bypass 
    -- predecessors 26 
    -- successors 21 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Update/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/ADD_f32_f32_270_Update/ca
      -- 
    ca_1175_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ADD_f32_f32_270_inst_ack_1, ack => vectorSum_CP_1112_elements(27)); -- 
    -- CP-element group 28 transition  bypass 
    -- predecessors 13 
    -- successors 29 
    -- members (4) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_273_sample_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_273_sample_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_273_update_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_273_update_completed_
      -- 
    vectorSum_CP_1112_elements(28) <= vectorSum_CP_1112_elements(13);
    -- CP-element group 29 join  transition  bypass 
    -- predecessors 28 
    -- marked predecessors 30 
    -- successors 33 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_sample_start_
      -- 
    cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 19) := "cp_element_group_29"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(28) & vectorSum_CP_1112_elements(30);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30 fork  transition  bypass 
    -- predecessors 34 
    -- successors 
    -- marked successors 12 29 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_sample_completed_
      -- 
    vectorSum_CP_1112_elements(30) <= vectorSum_CP_1112_elements(34);
    -- CP-element group 31 join  transition  bypass 
    -- predecessors 5 
    -- marked predecessors 38 
    -- successors 35 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_update_start_
      -- 
    cp_element_group_31: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_31"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(5) & vectorSum_CP_1112_elements(38);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(31), clk => clk, reset => reset); --
    end block;
    -- CP-element group 32 transition  bypass 
    -- predecessors 36 
    -- successors 37 
    -- members (5) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_201_delayed_24_276_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_201_delayed_24_276_update_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_201_delayed_24_276_sample_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_3_201_delayed_24_276_sample_start_
      -- 
    vectorSum_CP_1112_elements(32) <= vectorSum_CP_1112_elements(36);
    -- CP-element group 33 transition  output  bypass 
    -- predecessors 29 
    -- successors 34 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Sample/req
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Sample/$entry
      -- 
    vectorSum_CP_1112_elements(33) <= vectorSum_CP_1112_elements(29);
    req_1187_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(33), ack => W_iNsTr_3_201_delayed_24_272_inst_req_0); -- 
    -- CP-element group 34 transition  input  bypass 
    -- predecessors 33 
    -- successors 30 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Sample/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Sample/ack
      -- 
    ack_1188_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => W_iNsTr_3_201_delayed_24_272_inst_ack_0, ack => vectorSum_CP_1112_elements(34)); -- 
    -- CP-element group 35 transition  output  bypass 
    -- predecessors 31 
    -- successors 36 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Update/$entry
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Update/req
      -- 
    vectorSum_CP_1112_elements(35) <= vectorSum_CP_1112_elements(31);
    req_1192_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(35), ack => W_iNsTr_3_201_delayed_24_272_inst_req_1); -- 
    -- CP-element group 36 transition  input  bypass 
    -- predecessors 35 
    -- successors 32 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Update/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/assign_stmt_274_Update/ack
      -- 
    ack_1193_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => W_iNsTr_3_201_delayed_24_272_inst_ack_1, ack => vectorSum_CP_1112_elements(36)); -- 
    -- CP-element group 37 join  transition  bypass 
    -- predecessors 32 21 
    -- marked predecessors 38 
    -- successors 41 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_sample_start_
      -- 
    cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 63,1 => 63,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 0,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 1);
      constant joinName: string(1 to 19) := "cp_element_group_37"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(32) & vectorSum_CP_1112_elements(21) & vectorSum_CP_1112_elements(38);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38 fork  transition  bypass 
    -- predecessors 42 
    -- successors 
    -- marked successors 20 37 31 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_sample_completed_
      -- 
    vectorSum_CP_1112_elements(38) <= vectorSum_CP_1112_elements(42);
    -- CP-element group 39 join  transition  bypass 
    -- predecessors 5 
    -- marked predecessors 46 
    -- successors 43 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_update_start_
      -- 
    cp_element_group_39: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_39"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(5) & vectorSum_CP_1112_elements(46);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(39), clk => clk, reset => reset); --
    end block;
    -- CP-element group 40 transition  bypass 
    -- predecessors 44 
    -- successors 45 
    -- members (5) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_5_281_sample_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_5_281_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_5_281_sample_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/R_iNsTr_5_281_update_start_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_update_completed_
      -- 
    vectorSum_CP_1112_elements(40) <= vectorSum_CP_1112_elements(44);
    -- CP-element group 41 transition  output  bypass 
    -- predecessors 37 
    -- successors 42 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Sample/$entry
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Sample/rr
      -- 
    vectorSum_CP_1112_elements(41) <= vectorSum_CP_1112_elements(37);
    rr_1209_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(41), ack => MUL_f32_f32_278_inst_req_0); -- 
    -- CP-element group 42 transition  input  bypass 
    -- predecessors 41 
    -- successors 38 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Sample/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Sample/ra
      -- 
    ra_1210_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_278_inst_ack_0, ack => vectorSum_CP_1112_elements(42)); -- 
    -- CP-element group 43 transition  output  bypass 
    -- predecessors 39 
    -- successors 44 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Update/$entry
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Update/cr
      -- 
    vectorSum_CP_1112_elements(43) <= vectorSum_CP_1112_elements(39);
    cr_1214_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(43), ack => MUL_f32_f32_278_inst_req_1); -- 
    -- CP-element group 44 transition  input  bypass 
    -- predecessors 43 
    -- successors 40 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Update/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/MUL_f32_f32_278_Update/ca
      -- 
    ca_1215_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => MUL_f32_f32_278_inst_ack_1, ack => vectorSum_CP_1112_elements(44)); -- 
    -- CP-element group 45 join  transition  bypass 
    -- predecessors 40 
    -- marked predecessors 46 
    -- successors 49 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_sample_start_
      -- 
    cp_element_group_45: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 19) := "cp_element_group_45"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(40) & vectorSum_CP_1112_elements(46);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(45), clk => clk, reset => reset); --
    end block;
    -- CP-element group 46 fork  transition  bypass 
    -- predecessors 50 
    -- successors 
    -- marked successors 45 39 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_sample_completed_
      -- 
    vectorSum_CP_1112_elements(46) <= vectorSum_CP_1112_elements(50);
    -- CP-element group 47 join  transition  bypass 
    -- predecessors 5 
    -- marked predecessors 48 
    -- successors 51 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_update_start_
      -- 
    cp_element_group_47: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 63,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 19) := "cp_element_group_47"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= vectorSum_CP_1112_elements(5) & vectorSum_CP_1112_elements(48);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => vectorSum_CP_1112_elements(47), clk => clk, reset => reset); --
    end block;
    -- CP-element group 48 fork  transition  bypass 
    -- predecessors 52 
    -- successors 4 
    -- marked successors 47 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_update_completed_
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/$exit
      -- 
    vectorSum_CP_1112_elements(48) <= vectorSum_CP_1112_elements(52);
    -- CP-element group 49 transition  output  bypass 
    -- predecessors 45 
    -- successors 50 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Sample/req
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Sample/$entry
      -- 
    vectorSum_CP_1112_elements(49) <= vectorSum_CP_1112_elements(45);
    req_1227_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(49), ack => WPIPE_out_data_pipe_280_inst_req_0); -- 
    -- CP-element group 50 transition  input  bypass 
    -- predecessors 49 
    -- successors 46 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Sample/ack
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Sample/$exit
      -- 
    ack_1228_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_pipe_280_inst_ack_0, ack => vectorSum_CP_1112_elements(50)); -- 
    -- CP-element group 51 transition  output  bypass 
    -- predecessors 47 
    -- successors 52 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Update/req
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Update/$entry
      -- 
    vectorSum_CP_1112_elements(51) <= vectorSum_CP_1112_elements(47);
    req_1232_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => vectorSum_CP_1112_elements(51), ack => WPIPE_out_data_pipe_280_inst_req_1); -- 
    -- CP-element group 52 transition  input  bypass 
    -- predecessors 51 
    -- successors 48 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Update/ack
      -- 	branch_block_stmt_259/do_while_stmt_262/do_while_stmt_262_loop_body/WPIPE_out_data_pipe_280_Update/$exit
      -- 
    ack_1233_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_pipe_280_inst_ack_1, ack => vectorSum_CP_1112_elements(52)); -- 
    -- CP-element group 53 transition  bypass 
    -- predecessors 3 
    -- successors 54 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_exit/$entry
      -- 
    vectorSum_CP_1112_elements(53) <= vectorSum_CP_1112_elements(3);
    -- CP-element group 54 transition  input  bypass 
    -- predecessors 53 
    -- successors 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_exit/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_exit/ack
      -- 
    ack_1237_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_262_branch_ack_0, ack => vectorSum_CP_1112_elements(54)); -- 
    -- CP-element group 55 transition  bypass 
    -- predecessors 3 
    -- successors 56 
    -- members (1) 
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_taken/$entry
      -- 
    vectorSum_CP_1112_elements(55) <= vectorSum_CP_1112_elements(3);
    -- CP-element group 56 transition  input  bypass 
    -- predecessors 55 
    -- successors 
    -- members (2) 
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_taken/$exit
      -- 	branch_block_stmt_259/do_while_stmt_262/loop_taken/ack
      -- 
    ack_1241_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_262_branch_ack_1, ack => vectorSum_CP_1112_elements(56)); -- 
    -- CP-element group 57 transition  place  bypass 
    -- predecessors 1 
    -- successors 
    -- members (5) 
      -- 	$exit
      -- 	branch_block_stmt_259/do_while_stmt_262__exit__
      -- 	branch_block_stmt_259/do_while_stmt_262/$exit
      -- 	branch_block_stmt_259/$exit
      -- 	branch_block_stmt_259/branch_block_stmt_259__exit__
      -- 
    vectorSum_CP_1112_elements(57) <= vectorSum_CP_1112_elements(1);
    do_while_stmt_262_terminator_1242: loop_terminator -- 
      generic map (max_iterations_in_flight =>63) 
      port map(loop_body_exit => vectorSum_CP_1112_elements(4),loop_continue => vectorSum_CP_1112_elements(56),loop_terminate => vectorSum_CP_1112_elements(54),loop_back => vectorSum_CP_1112_elements(2),loop_exit => vectorSum_CP_1112_elements(1),clk => clk, reset => reset); -- 
    entry_tmerge_1139_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= vectorSum_CP_1112_elements(6);
        preds(1)  <= vectorSum_CP_1112_elements(7);
        entry_tmerge_1139 : transition_merge -- 
          port map (preds => preds, symbol_out => vectorSum_CP_1112_elements(8));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal expr_284_wire_constant : std_logic_vector(0 downto 0);
    signal iNsTr_3_201_delayed_24_274 : std_logic_vector(31 downto 0);
    signal iNsTr_3_266 : std_logic_vector(31 downto 0);
    signal iNsTr_4_271 : std_logic_vector(31 downto 0);
    signal iNsTr_5_279 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    expr_284_wire_constant <= "1";
    W_iNsTr_3_201_delayed_24_272_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_iNsTr_3_201_delayed_24_272_inst_req_0;
      W_iNsTr_3_201_delayed_24_272_inst_ack_0<= wack(0);
      rreq(0) <= W_iNsTr_3_201_delayed_24_272_inst_req_1;
      W_iNsTr_3_201_delayed_24_272_inst_ack_1<= rack(0);
      W_iNsTr_3_201_delayed_24_272_inst : InterlockBuffer generic map ( -- 
        name => "W_iNsTr_3_201_delayed_24_272_inst",
        buffer_size => 24,
        flow_through =>  false ,
        in_data_width => 32,
        out_data_width => 32
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => iNsTr_3_266,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => iNsTr_3_201_delayed_24_274,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_262_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= expr_284_wire_constant;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_262_branch_req_0,
          ack0 => do_while_stmt_262_branch_ack_0,
          ack1 => do_while_stmt_262_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared split operator group (0) : ADD_f32_f32_270_inst 
    ApFloatAdd_group_0: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 24);
      -- 
    begin -- 
      data_in <= iNsTr_3_266 & iNsTr_3_266;
      iNsTr_4_271 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= ADD_f32_f32_270_inst_req_0;
      ADD_f32_f32_270_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ADD_f32_f32_270_inst_req_1;
      ADD_f32_f32_270_inst_ack_1 <= ackR_unguarded(0);
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatAdd_group_0",
          operator_id => "ApFloatAdd",
          exponent_width => 8,
          fraction_width => 23, 
          no_arbitration => false,
          num_reqs => 1,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared split operator group (1) : MUL_f32_f32_278_inst 
    ApFloatMul_group_1: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 24);
      -- 
    begin -- 
      data_in <= iNsTr_3_201_delayed_24_274 & iNsTr_4_271;
      iNsTr_5_279 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= MUL_f32_f32_278_inst_req_0;
      MUL_f32_f32_278_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= MUL_f32_f32_278_inst_req_1;
      MUL_f32_f32_278_inst_ack_1 <= ackR_unguarded(0);
      reqL <= reqL_unregulated;
      ackL_unregulated <= ackL;
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL_unregulated,
        sa_in => ackL_unregulated,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatMul_group_1",
          operator_id => "ApFloatMul",
          exponent_width => 8,
          fraction_width => 23, 
          no_arbitration => false,
          num_reqs => 1,
          use_input_buffering => true,
          detailed_buffering_per_input => inBUFs,
          detailed_buffering_per_output => outBUFs -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 1
    -- shared inport operator group (0) : RPIPE_in_data_pipe_265_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data_pipe_265_inst_req_0;
      RPIPE_in_data_pipe_265_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data_pipe_265_inst_req_1;
      RPIPE_in_data_pipe_265_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      iNsTr_3_266 <= data_out(31 downto 0);
      in_data_pipe_read_0: InputPortFullRate -- 
        generic map ( name => "in_data_pipe_read_0", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data_pipe_pipe_read_req(0),
          oack => in_data_pipe_pipe_read_ack(0),
          odata => in_data_pipe_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_out_data_pipe_280_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 2);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data_pipe_280_inst_req_0;
      WPIPE_out_data_pipe_280_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data_pipe_280_inst_req_1;
      WPIPE_out_data_pipe_280_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      data_in <= iNsTr_5_279;
      out_data_pipe_write_0: OutputPortFullRate -- 
        generic map ( name => "out_data_pipe", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data_pipe_pipe_write_req(0),
          oack => out_data_pipe_pipe_write_ack(0),
          odata => out_data_pipe_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end Default;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    in_data_pipe_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    out_data_pipe_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture Default of ahir_system is -- system-architecture 
  -- declarations related to module vectorSum
  component vectorSum is -- 
    generic (tag_length : integer); 
    port ( -- 
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      in_data_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data_pipe_pipe_read_data : in   std_logic_vector(31 downto 0);
      out_data_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data_pipe_pipe_write_data : out  std_logic_vector(31 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
    -- 
  end component;
  -- argument signals for module vectorSum
  signal vectorSum_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal vectorSum_tag_out   : std_logic_vector(1 downto 0);
  signal vectorSum_start_req : std_logic;
  signal vectorSum_start_ack : std_logic;
  signal vectorSum_fin_req   : std_logic;
  signal vectorSum_fin_ack : std_logic;
  -- aggregate signals for read from pipe in_data_pipe
  signal in_data_pipe_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data_pipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data_pipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data_pipe
  signal out_data_pipe_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module vectorSum
  vectorSum_instance:vectorSum-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => vectorSum_start_req,
      start_ack => vectorSum_start_ack,
      fin_req => vectorSum_fin_req,
      fin_ack => vectorSum_fin_ack,
      clk => clk,
      reset => reset,
      in_data_pipe_pipe_read_req => in_data_pipe_pipe_read_req(0 downto 0),
      in_data_pipe_pipe_read_ack => in_data_pipe_pipe_read_ack(0 downto 0),
      in_data_pipe_pipe_read_data => in_data_pipe_pipe_read_data(31 downto 0),
      out_data_pipe_pipe_write_req => out_data_pipe_pipe_write_req(0 downto 0),
      out_data_pipe_pipe_write_ack => out_data_pipe_pipe_write_ack(0 downto 0),
      out_data_pipe_pipe_write_data => out_data_pipe_pipe_write_data(31 downto 0),
      tag_in => vectorSum_tag_in,
      tag_out => vectorSum_tag_out-- 
    ); -- 
  -- module will be run forever 
  vectorSum_tag_in <= (others => '0');
  vectorSum_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => vectorSum_start_req, start_ack => vectorSum_start_ack,  fin_req => vectorSum_fin_req,  fin_ack => vectorSum_fin_ack);
  in_data_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 2 --
    )
    port map( -- 
      read_req => in_data_pipe_pipe_read_req,
      read_ack => in_data_pipe_pipe_read_ack,
      read_data => in_data_pipe_pipe_read_data,
      write_req => in_data_pipe_pipe_write_req,
      write_ack => in_data_pipe_pipe_write_ack,
      write_data => in_data_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 2 --
    )
    port map( -- 
      read_req => out_data_pipe_pipe_read_req,
      read_ack => out_data_pipe_pipe_read_ack,
      read_data => out_data_pipe_pipe_read_data,
      write_req => out_data_pipe_pipe_write_req,
      write_ack => out_data_pipe_pipe_write_ack,
      write_data => out_data_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end Default;
