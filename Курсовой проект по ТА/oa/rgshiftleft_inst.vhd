rgshiftleft_inst : rgshiftleft PORT MAP (
		clock	 => clock_sig,
		data	 => data_sig,
		enable	 => enable_sig,
		load	 => load_sig,
		shiftin	 => shiftin_sig,
		q	 => q_sig
	);
