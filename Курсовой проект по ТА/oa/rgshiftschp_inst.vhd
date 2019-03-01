rgshiftschp_inst : rgshiftschp PORT MAP (
		clock	 => clock_sig,
		data	 => data_sig,
		enable	 => enable_sig,
		load	 => load_sig,
		sclr	 => sclr_sig,
		shiftin	 => shiftin_sig,
		q	 => q_sig
	);
