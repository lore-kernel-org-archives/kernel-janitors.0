Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D91C2AA
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 20:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902758; cv=none; b=sA+oPMB5zJ5ue9l1Rv50viLNjISTJl1/Mj5O0MnmKQAVTHDwNF6hf+ugcz7lHHMqIPe0GR2zi/0l2B2X55P19DtOiTy5qISDw5AJPy9WrhckFQWiC5Oi22dc9KwbZHQaaKQ6YvzRoW+Nv68WzljL+DRpz+Ldrvd6AormTkQHROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902758; c=relaxed/simple;
	bh=5H5GIR2t3nxZTTmxPLAr9IYxSQ19hDA+jR9PITD4Hps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+5xrlnNfk7QlNxjNXCe3o7lRtHj6FYzltt5/b3cWrpav4p9eSiT/WAJmW5fZTCt+ucSgXnsv3cWsnvhiC6c6WWQkeyg8TBI2Y9sSxdlA4yRzH+nhcrSxCeXbeKkBev24PqSad719QIjzg6BbjbKWSdOiT7KVSLQjBn6648pWCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRiP/Xra; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRiP/Xra"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2ad56dbb2so2968020e87.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774902755; x=1775507555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRna11gUuxb0bz0P+2YW7Rs14bXzL6Fz8YrrsOXaEtk=;
        b=cRiP/XraoQY/HDy1wB3DjBCxbIYgkdP4qpOxlnbaRce3rvethIWojT25CQhawjGvO4
         Zk9SEugl0LS7x43rDCuAMBD0fUMWsUnqYrKVYAo66qSARHITk6pC8J5fCUPlXZ+6kD+A
         YTg5JchhdnZE26X+Gd/K+J2JARcsuHru7EmG9Tbr7quA3zSYYULrUOFwj2Fznqxq0tEz
         zatW1Kn2xJeJBajQeyNH7dDDwZyPe0nfpDLj+8Nt3xJn2eicXpElbeXUhfe9x45HKX0a
         skxn8naL45JYMJldEQ6LHot6WS9sl0DUiWnRq3J38IHutliCTkMSMm+vTHzkUf5Itkmv
         ZRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902755; x=1775507555;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRna11gUuxb0bz0P+2YW7Rs14bXzL6Fz8YrrsOXaEtk=;
        b=T4QP1+Zr00pP8gkd2mOuyN68l/MVQy4yqZu6C7M6cU4Oku3GbcIYqvs9rTaYP22tGx
         LPha+iyPQO7yg3U2LnckiD+xqBCVQvvrzifxcWVqeUQdbRRQavlLX2rbv4rKpYMKgH69
         AD83rtfWrSX1Z4HXpphkgRvq14cWDcaxAYurOyI6FThyNUakiMhKhz6LuP+Hrt1Z+jg2
         ZX4DPj/2IgNLwwBN4s8DbO9oyic35UOPUdELXwkVzyb4kjTi/krbvPzyMHStr4v0JgPO
         qOkD6yDtij3+dhz39OPTuNxTrRsky99bz90NpaISRQ5xGQ1fh5eywom/tC6GZa9o8whd
         WReg==
X-Gm-Message-State: AOJu0YxRViZMqLENftAAfWeBnkLMP90hFQMsY3Jc0jdSaY4ss+h7N3Fx
	Qr66TkD/75gpgY14MGA7LNCoSQi9+Um5V79NuXv5aToaTSeu1RtS+OBeJGGuIQ==
X-Gm-Gg: ATEYQzzo8do9iBQOdEdvFHjz4mr3OXps6Zt3Dn0NtJi+Jkjg7CeIwSHK58PTesjDjgP
	uTCCv0m9OT7dra4Ou61EufyQ9TErENkQ3fDVx8EImqPkPhKQshSrknYEv0zBQr27l4/LespOiYB
	BiIV97lG6enJtTVvDegAItYFCRP+ZWhWYxW8t3Du9DF2lH6ZdjqOq+7aI5mK2jVuwdHnfes/EWS
	ik9kLRHMMcc6DpsNI0e2ci05mVIAqxZXbzE5R5mrWvweE03lYGYvK+P3msxHH+u/TbmI7ZWnChl
	KlSnMdwKUy7MD3tsCSKBXm0/RrX5HokLKJLPQ+bREbycwhpvN3dtjxkMqfqKldiXY/XPpT3tu/a
	908CMuVdYQr/ktxpG1AT2AO6tA6X3Z7Su6zDlTK3bZxsEVi9VCSscIzS/Diw7umtZErwKzJc8+j
	oqzWXNEijjFx8GsaSi5xxxTVzDL4trchKRqkZOiONyBCBFrdTJJqh3edkRj7ZJxw==
X-Received: by 2002:a05:6512:1599:b0:5a1:4c8:a632 with SMTP id 2adb3069b0e04-5a2ab8039e1mr5354692e87.13.1774902754725;
        Mon, 30 Mar 2026 13:32:34 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403e64sm1897778e87.30.2026.03.30.13.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:32:34 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:32:33 +0200
From: Linus Probert <linus.probert@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: Status of kernel-janitors?
Message-ID: <acrcLLzBOSOyz9mz@mosquito>
Mail-Followup-To: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	kernel-janitors@vger.kernel.org
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>

On Mon, Mar 30, 2026 at 09:27:25AM -0400, Robert P. J. Day wrote:
> On Mon, 30 Mar 2026, Linus Probert wrote:
> 
> > Hello,
> >
> > I've been a long time builder and fiddler of kernel source. Running
> > self-compiled kernels and pulling in patches before official release
> > etc. Bog standard for most of you I assume.
> >
> > I'd love to dedicate some spare to help the project. Like so many
> > others.
> >
> > The kernel-janoitors "project" does pop up in various resources such as
> > kernelnewbies and I think it might have been mentioned in one of the
> > Linux Foundations free courses. But links to potential homepages seem to
> > be dead and resources are sometimes dated.
> >
> > I read somewhere that this has mostly evolved into janitorial work in
> > drivers/staging. TODOs were mentioned.
> >
> > So the actual question. In my mind janitorial code work is a good place
> > to dip ones toes when starting out. Is this the right mailing list to
> > ask about such things? Any suggestions to find an area where ones
> > assistance would be welcome?
> >
> > I'm aware of checkpatch.pl but for many drivers diverging from these
> > rules seem intentional and just blindly fixing checkpatch warnings are
> > not helpful to the maintainer.
> > Open source is a lot of work so the goal would be to be helpful while
> > not stealing too much attention from concerned parties.
> 
>   I mention this once in a while ... *many* years ago, I wrote some
> admittedly hacky scripts that scanned the kernel source tree looking
> for what I considered "obvious" cleanups. One of those cleanups was to
> abbreviate the numerous calculations of the length of an array
> sprinkled throughout the source code, so I wrote a script that can be
> run from the top of the kernel source tree and can take an argument of
> which subdirectory to examine, looking for a particular regular
> expression that I can barely recognize anymore:
> 
>   #!/bin/sh
>   DIR=${1-.}
>   grep -Er "sizeof ?\(?([^\)]+)\)? ?/ ?sizeof ?\(?.*\1.*" ${DIR}

Is there ever a regex that you do understand after *many* years?

> For example, if I run:
> 
>   $ arraysize.sh drivers/gpu/drm
> 
> I get the output:
> 
> drivers/gpu/drm/xe/xe_guc_hxg_helpers.h:#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
> drivers/gpu/drm/nouveau/nvif/fifo.c:	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
> drivers/gpu/drm/amd/display/dc/mpc/dcn30/dcn30_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn20/dcn20_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix)/sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c:	int arr_size = sizeof(dpp_input_csc_matrix) / sizeof(struct dpp_input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c:	int arr_size = sizeof(input_csc_matrix)/sizeof(struct input_csc_matrix);
> drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c:	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
> drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c:	for (k = 0; k < sizeof(wb_arb_params->cli_watermark)/sizeof(wb_arb_params->cli_watermark[0]); k++) {
> drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c:#define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
> 
> Note the number of places in that subsystem which calculate the length
> of an array; much of that can be abbreviated by now taking advantage
> of the kernel header file include/linux/array_size.h (only relevant
> line shown here):
> 
> #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
> __must_be_array(arr))
> 
> That would seem to be obvious janitor work -- simplifying code a
> subsystem at a time (do *not* try to submit a single patch that
> covers the entire source tree).

Noted.

>   I have other examples, I should clean them up and post them.

This sounds like a good idea. I assume there are many like me who don't
mind some scout work in the name of OSS.

> rday

Thanks for the reply. I'll make a note of this and make one or two
patches based on this info.

-- Linus
