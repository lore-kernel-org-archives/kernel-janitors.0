Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A714A1F4E3E
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267330; cv=none; b=jb78huMuh6dw8kfcDXfcBvvTjnGNW5oyM7OUCWm/isr1M2hyRDi0kZDfLxA8SGimyYyFGQiS1xnaMTDFzvVURrNvhDNlNeUX8hrxhGqlnfG3gm9i/tJOEpOulFRACb80Vz/PQhaMiFzCPyJ+9NXyt+lPqe/eQ+cmsBLMHjSL7sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267330; c=relaxed/simple;
	bh=XdSqzdeDKUYE8sh5Fvr/ZWWLDUGpsJnXPO5X+bN0wB8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gBMpS+1OUuegN4CIK5SAUbTNOLUIqg/6K6SpGemKS7cHqBJq5xhXFRu+Cot63BKrijQhU4QhJIgoz1IgpLK9b64FwbN2QNHUp0xniKX1ztiK8LxKdHvdhgHwZ9MN08tTxqSbWaGyqZRmc0Mv5axihc56BClDR8APds0zRZgQ73Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HhDizXXg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oTZxkYiL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HhDizXXg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oTZxkYiL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HhDizXXg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oTZxkYiL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HhDizXXg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oTZxkYiL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B92231F385
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736267324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=E6Y3XZCIxend4g8dtqbj32Zqy+LvH0ye4XczvuinouI=;
	b=HhDizXXgarA2w+kUJJIbj1Bth1sZreU3IXlq8y/nDtzY/iUfYNZX2YQuE4BqTkhdr1Lqpf
	cAixWHxLFA2jcQZYywHIr9b0dHDI7jhUShXj9V8eM7LNFOdoe4CDMUvXaLLjKBbNT0GAOw
	JqFOVPLYYItV+f+BTEozMvIw8d7dwUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736267324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=E6Y3XZCIxend4g8dtqbj32Zqy+LvH0ye4XczvuinouI=;
	b=oTZxkYiLhfa9wYNmxwcqdV8B6/pVm/BHlVVSo2R6n41am8YzJPwAn8gczy931acEdd0i6v
	zzES8mKMk3C7XDBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736267324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=E6Y3XZCIxend4g8dtqbj32Zqy+LvH0ye4XczvuinouI=;
	b=HhDizXXgarA2w+kUJJIbj1Bth1sZreU3IXlq8y/nDtzY/iUfYNZX2YQuE4BqTkhdr1Lqpf
	cAixWHxLFA2jcQZYywHIr9b0dHDI7jhUShXj9V8eM7LNFOdoe4CDMUvXaLLjKBbNT0GAOw
	JqFOVPLYYItV+f+BTEozMvIw8d7dwUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736267324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=E6Y3XZCIxend4g8dtqbj32Zqy+LvH0ye4XczvuinouI=;
	b=oTZxkYiLhfa9wYNmxwcqdV8B6/pVm/BHlVVSo2R6n41am8YzJPwAn8gczy931acEdd0i6v
	zzES8mKMk3C7XDBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A31A13763
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 16:28:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8mXfIzxWfWcJXgAAD6G6ig
	(envelope-from <pperego@suse.de>)
	for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2025 16:28:44 +0000
Date: Tue, 7 Jan 2025 17:28:43 +0100
From: Paolo Perego <pperego@suse.de>
To: Kernel Janitor Project <kernel-janitors@vger.kernel.org>
Subject: How to fill "Fixes" when sending a patch
Message-ID: <cjh33awxfhtt3sgck6rrh4zf3ewn6z6svrj36el5ky4kg66y6o@b37k3hj5hosp>
X-Responsible-Disclosure: https://en.opensuse.org/openSUSE:Security_disclosure_policy
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w6yild2frb5z4553"
Content-Disposition: inline
X-Spam-Score: -5.90
X-Spamd-Result: default: False [-5.90 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	PREVIOUSLY_DELIVERED(0.00)[kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 


--w6yild2frb5z4553
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: How to fill "Fixes" when sending a patch
MIME-Version: 1.0

Hi all, I'm new to the kernel development world. I submitted
successfully the first patch last November but I'm trying to improve my
kernel development workflow.

My question is about the "Fixes" git commit hash. How can easily find
where the piece of code I'm patching was first introduced?

Sorry if this is a very n00b question.
Paolo
--=20
(*_  Paolo Perego                           @thesp0nge
//\  Software security engineer               suse.com
V_/_ 0A1A 2003 9AE0 B09C 51A4 7ACD FC0D CEA6 0806 294B

--w6yild2frb5z4553
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEad0ki8u8+tnCnxjUEWmTq+eyM3gFAmd9VjcACgkQEWmTq+ey
M3jLsQ/9FMt8Kh4WL+NvzbWZ0U27YwvdJQr1HUC/p9Xmf6XzL3R/vye+zV/TmG3/
RhkLqQoAdsIQXYtoxjX/rtzAJGcV70Z0NY0k4NgSEfCnJzIZ+vGCVP7sT9tVQRhV
KlXw0CqYrp2pYJkrQC4wIfA4Mh8ZEv28gtN59hWWvvfmb8nQ89qh4qOuF/IgbFNh
0IxS67kECtECf/PRCEGVMTgJLxF0Mce4F6q3Uvq+Jvv++RFg49E0skL2Ygo1UfqD
1OwM+dW9OU9XRmNU4h498j8ls927HrmC1TyH2sYADTVuf3Nz9lw9gzWThJP7KrZF
VDJmj4BvVxiznwZ+uOdsGCDXnojHxcWOfmmb0OKXDDVPs1naYMyBnQQxDmxtgVyd
Qei8C6fXffldfqT7RSdV6ixa4dICk0dgY0gxLo2pQUx6P/8omHtlfx3j2h/1iuSr
W0S8UOyc4Aep8BWEo37NL1pSYocSodUk9nOaGcMptY0h69vr6bVXLLYbD2/Wpjfz
6k0sK6ZZBV1xMSC2+zhaPWeUTG8vnWHdwTkq2R//N2cIEnPpRW5BH/GZb1091PPo
XR1rZaZCyPfImylAuSgKmNC2kGUv9Lwy3ksuaqCGyUU2VpYcJC+h6LbMHNKqUTcE
6eCeRNKgPghwEGztspSvnRhTA8LKnnzPLaajcoq0VPpXdysh5mM=
=5h/D
-----END PGP SIGNATURE-----

--w6yild2frb5z4553--
