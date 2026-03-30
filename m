Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C23D5241
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878454; cv=none; b=YsX/7lCWUcnlFZwRNlsX+diBXK1VihvO0JSTtMMT7/Ei9cfLBi07MAF0kiaOQPX4oKSI9mKOX0GlS3kOOyBPbHktLHjGmu2Dfmk840gm1rECFoIPf/H2js2Rc4haCpGS0LQJrmSGMKZifo+g2OHPZIC3zIxpTfmT46NYMsyGzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878454; c=relaxed/simple;
	bh=iez5XejcHCsHzAA5JuGvLNAcxqGlpMKj9Hul+hbrels=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dyYvft43Fv1mGl01htjFCcsILxsosWGShRQEWTtopDi7SX067D5+OkpHF0JEuGvD66pjRGRtz+QUFBuTQc5sIqr3HXX8wHTqIs92MzzaeBAml6j45IeUiU6l1DxQTwbG9/AlgK6G6r1OXwdgTNSeVwv7iSYFdQqlDFxCFr9v97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=x4iU61yG; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="x4iU61yG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PNHCzMc6hPVbaW6FIt4WygkEcKJwSMAnaN8A59MhpXs=; b=x4iU61yG8CPSp+cpflQYKiRdSQ
	7WPTBtKzjqSL/3iycy5o+2CTuDuqJSH7K8CGREI2w91FPO7YgmRaX2nkI1WjPhvxIo/fqTMeIwHs0
	piJ1FydrsM4iVI1NDtwxbY5HnS5NGqfMDJo8N4FPwzkZID1JfltFYd5w2FWwwgatr4kTVkK9aT8AJ
	JS+zOjvSCllIrKobojqC0firy7/qfPNrLycfeF+spPR/ygDo0shzHNUM+3qDhq5qY9f7DTMWC5Ddu
	bf/Uu76n65tdu+kQWfuNXwm2L7yJG+FcW9UB/rYDYwGnuUmuMEWeoRZ5+cyqIox9WtRxOqB+KlkuR
	XWG1TLhw==;
Received: from [147.129.179.166] (port=54268 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1w7CdX-00000000jpx-1GzI;
	Mon, 30 Mar 2026 09:26:36 -0400
Date: Mon, 30 Mar 2026 09:27:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Linus Probert <linus.probert@gmail.com>
cc: kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
In-Reply-To: <acpeJQEPtDKQ68uo@mosquito>
Message-ID: <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
References: <acpeJQEPtDKQ68uo@mosquito>
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

On Mon, 30 Mar 2026, Linus Probert wrote:

> Hello,
>
> I've been a long time builder and fiddler of kernel source. Running
> self-compiled kernels and pulling in patches before official release
> etc. Bog standard for most of you I assume.
>
> I'd love to dedicate some spare to help the project. Like so many
> others.
>
> The kernel-janoitors "project" does pop up in various resources such as
> kernelnewbies and I think it might have been mentioned in one of the
> Linux Foundations free courses. But links to potential homepages seem to
> be dead and resources are sometimes dated.
>
> I read somewhere that this has mostly evolved into janitorial work in
> drivers/staging. TODOs were mentioned.
>
> So the actual question. In my mind janitorial code work is a good place
> to dip ones toes when starting out. Is this the right mailing list to
> ask about such things? Any suggestions to find an area where ones
> assistance would be welcome?
>
> I'm aware of checkpatch.pl but for many drivers diverging from these
> rules seem intentional and just blindly fixing checkpatch warnings are
> not helpful to the maintainer.
> Open source is a lot of work so the goal would be to be helpful while
> not stealing too much attention from concerned parties.

  I mention this once in a while ... *many* years ago, I wrote some
admittedly hacky scripts that scanned the kernel source tree looking
for what I considered "obvious" cleanups. One of those cleanups was to
abbreviate the numerous calculations of the length of an array
sprinkled throughout the source code, so I wrote a script that can be
run from the top of the kernel source tree and can take an argument of
which subdirectory to examine, looking for a particular regular
expression that I can barely recognize anymore:

  #!/bin/sh
  DIR=${1-.}
  grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" ${DIR}

For example, if I run:

  $ arraysize.sh drivers/gpu/drm

I get the output:

drivers/gpu/drm/xe/xe_guc_hxg_helpers.h:#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
drivers/gpu/drm/nouveau/nvif/fifo.c:	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
drivers/gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix) / sizeof(struct dpp_input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c:	int arr_size = sizeof(input_csc_matrix)/sizeof(struct input_csc_matrix);
drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c:	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c:	for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))

Note the number of places in that subsystem which calculate the length
of an array; much of that can be abbreviated by now taking advantage
of the kernel header file include/linux/array_size.h (only relevant
line shown here):

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
__must_be_array(arr))

That would seem to be obvious janitor work -- simplifying code a
subsystem at a time (do *not* try to submit a single patch that
covers the entire source tree).

  I have other examples, I should clean them up and post them.

rday

