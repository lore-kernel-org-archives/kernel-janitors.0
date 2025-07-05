Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712A81C5D59
	for <kernel-janitors@vger.kernel.org>; Sat,  5 Jul 2025 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751739065; cv=none; b=S7oeBQkW9Zofri1OakYP/S5hIMUI/VaMccUJcEifbycw2SI8uFHW1phSmd/d5vpsvc00nMB5XMzk0OqXdrEQ3nHqY93SH3DtRnpXEbJT0eqYiRrq9SXciax9wbI7dCi43Q9Yz8AaNEW2sjXnVGqYGtXNYpR1cPPV24fKaqFZLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751739065; c=relaxed/simple;
	bh=gInexjOdSgaoWzDCL+0nJbPHXYyeveDpubVk5hf3glU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=p5ANllM/Ml6/LOs6fZyDpsc1cHQbwbBHmJkfr9XZj5bwKUMtKXYkt+Fev9C0dEzYPX1DgnaYfLk/2QEKibUZSltva+d5yK0IG7q3FbBMl91DX0g4JhNJyiWSIIJYIqqBCga6hixuvdrpWSI4bzjysDp/uuzNkJd9ErS9LvNShds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=MWvhx6RV; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="MWvhx6RV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hzdWG7VOSmZ6fPGwPnw6pnPKimm7aMvUQB6fFoyWDHg=; b=MWvhx6RV5Ls8v+w/aex9Xn5ZFd
	Z7T3LM83+Q7PV5ZY17TCUgfwuUxCraLNxTRjWGhehR27yRBnq+Fmvp3xJvPfzZomTlSN6HRmj2xRg
	JGvdCPpq2Jy5Nd5fpXJsJMopKql4oxGl9MRUIBgkCJoJLwZaZ+FaxOj5dDj8GH5r/engM3C4s05Ue
	+wjnWhjAfuU9swWHHtlVvDfGLy/UnJDsfBylgAKG8q5X/0BKVccDQ3UObnSKyOTxxSvZM8tmTxUcB
	ea2yK+lhZtLgsrg0PxBSzDmBi9v0I8cfX5GLdKNBqsqSeBZsSetyLXt8dgfyH1h3394ExIxT5odn/
	CA15jq0Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:45454 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uY7Lb-00000008IMi-28Lz
	for kernel-janitors@vger.kernel.org;
	Sat, 05 Jul 2025 14:10:52 -0400
Date: Sat, 5 Jul 2025 14:10:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Kernel Janitors List <kernel-janitors@vger.kernel.org>
Subject: revisiting some of my janitor scripts -- "arraysize"
 simplification
Message-ID: <4296a486-ee3f-6e79-b4c1-f944834f18b5@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


  i'm still adding to my kernel janitors page here:

  https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup

and after poking around some more this weekend, it seems like there's
still a pile of potential cleanup related to simplifying the
calculation of the length of an array.

  recall, this is the explanation of how to calculate the length of an
array in C:

 https://crashcourse.ca/doku/doku.php?id=linux_kernel_cleanup#calculating_the_length_of_an_array

  recall that the script supplied there allows you to restrict your
search to a subdirectory or subsystem, so i chose to focus on:

  $ cd drivers/gpu/drm/amd/display/dc

i ran my script:

$ arraysize.sh
./dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
./dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
./dpp/dcn401/dcn401_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix) / sizeof(struct dpp_input_csc_matrix);
./dpp/dcn30/dcn30_dpp.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
./dpp/dcn20/dcn20_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
./dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
./dpp/dcn10/dcn10_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
./core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
./dml/dcn20/dcn20_fpu.c:	for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
./dml/dsc/rc_calc_fpu.c:	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
./dce110/dce110_opp_csc_v.c:	int arr_size = sizeof(input_csc_matrix)/sizeof(struct input_csc_matrix);
./mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
./mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))


  so what does the above tell us? first, there's obvious
simplification, but don't stop there. note that some of those files
define "NUM_ELEMENTS()", so that's a hint that that can be simplified,
but let's go further and see how many of those files actually *use*
the macro they just defined:

$ grep -rw NUM_ELEMENTS *
core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
core/dc_hw_sequencer.c:	int arr_size = NUM_ELEMENTS(output_csc_matrix);
dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
dce/dce_clock_source.c:	for (i = 0; i < NUM_ELEMENTS(video_optimized_pixel_rates); i++) {
dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))

  so it seems that at least a couple of files define that macro
without actually using it. this is the sort of analysis you should do.
don't blindly submit patches; rather, take your time, and examine the
files in their entirety in a subdirectory or subsystem, and check the
Git log and/or run "git blame" to see why things are the way they are.

  thoughts?

rday
