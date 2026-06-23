Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D7359A81
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782192988; cv=none; b=FQZZzXxPkNJV1APXqApH04uuV1p8u7cq2dJ22IwHpsyKPFt4Or+/F7BGq6pR5GofgNYSwfv3uxQCemA7VGwjLf4dxxMkXo4YLntgET5M+Zfk9gZ9gFZh1NGspt/ddPSDNRQ8S/5OkZgLOpgTGRlABDg0RKsYYKwweGT/+sqIYTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782192988; c=relaxed/simple;
	bh=E9PaT4ktJQlmfw39/OI8QY2BfRmLENqrqr1K0stBSD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K63XxUN/Mt9muYT3+urSjFGdMQVew6dOKZioEdL6BpRvx0bQ1rb4Ke8bDLG3T8rMMvXKCB7nChvkWPjdossdFdxfzgq3TWsXRnhPuKWKXPqWgOgGzlmXRO4V7+yUHYAQ0OE/vCusxQ4I/dFjOgXW3jEQkzyUqaVQ62vYjIlgrkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYLKL0em; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYLKL0em"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697dc263e5fso398788a12.2
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Jun 2026 22:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192985; x=1782797785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OaxV6GgEVyL0zz/zTFoFcvflrDxYKTmOf8mAQ4j2Lro=;
        b=AYLKL0em83R8WpG4vo4//OobN9OKH/I8NH2f2d8MdU9fkHBs+wp5PoOepUUi+0toHV
         kyziW1mjkWk8hdIAo/hUi6ex3vjpLjaHeGNGLVo0VVLBEkskXoM1CTX0QUHQno7/zVJG
         yUjsXXVzAxz8s4PrljkopSXMPkR7BBHvyLGhlDf87aOmuzUyxWQw2gq/kBU7THdlPjJZ
         5mCGmrvuq3lcHI/YK2DQTfr/4dhXzIP91Ew5TOa34Ijz7MFYv4dd2Gj5T7hsbPHwUEqS
         T69t1xZf+0WqVEgHheRIMPrLik9pW5fzyX4N95a0N671D9/1SxSDCShaJZ+yRdyQWfKg
         exyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192985; x=1782797785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaxV6GgEVyL0zz/zTFoFcvflrDxYKTmOf8mAQ4j2Lro=;
        b=VZLTnvy4EClfE1N55qWOy/Yb9krwL0dNN8WF8GeubMurW7r6vVogideWLEUmZjWjIO
         OmoczQX5MYevOae18lvccrzG84XLFFfhNHyoUB2KnHpx1xrsbmT4znrJifkSi5WLG2jn
         yGGHg2AgYmWSGWyoHDz48+YywyE/tXt7H5ErlB6B2HlHhFfRP+Uhfq5/BKVLy0l15bRU
         F4Flk0xp+e7dAAlv0yU/k+86SWyhX9NId3mDNJeO7MGJ8yvGgmC2lmzXKrxc16GFcCHM
         r0rJvRuWqeZE5wlDUpR92Fi3ZJNxbvK+QGA7ygD5v70qfTvCJEL8xhG86HiKmlwLQjmL
         2q5g==
X-Forwarded-Encrypted: i=1; AFNElJ/96k9s8k6cpm4JjltOI1KJ1auTvpuUkhDwAEi0bX12mLxpw8U4lxsVx5dkGtpGnAi6kj3Cma+Q8GP86ykfRts=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGDZ9ygY73s7sRWZTrNwX7/kf5UkEOkZrRkXYqrE5upu0/xPwM
	126hbW27+YsCs78LdGXcHIHmMIHeFcjkzerue8IeStS944O3L+q7IJnp
X-Gm-Gg: AfdE7ckZLjcdicpoJbShcQKE60B3YZK2WSS6GwXKNuXbep3kpzBAILuUYMValyiq8pY
	w5kzkxnwg7VF4byYKGvMrf6Z4ui7eKrIiLzbxaetcgoR0Y90kSBYRiQYRBpFm6BKVOohK8XGpNP
	kv54+acjcu8X/oXdj8cYlf0AlJRtQoe1ToSz+MQFumyBMcPvivJrvR4kAxZVDDkysE4QxYV/RMM
	rWYipWeMM671674YU0FQ3e/2ix/v7xiv6nRGm0nzU8I469xK6a9jEQbPxr5AwjnbdmI2UXBBsqj
	+UfITQytWXnDApEno0ZvrW1NRSvEN+wRClSI/TW6yLJ1OscOLn69gRc3kMxTzFx0U1rwsCMdMR7
	nytgi/L8nzEhyao9UGl3ctBHkGbMYYPNCgy0QE2ezEgvGjaUiNLQdsk5KLYst9upiwT+hrTCeqE
	uO3RlzDBKT
X-Received: by 2002:a17:907:c008:b0:bed:5774:7c17 with SMTP id a640c23a62f3a-c108c7fdaafmr35648466b.5.1782192985279;
        Mon, 22 Jun 2026 22:36:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e9994d5sm455915866b.15.2026.06.22.22.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:36:24 -0700 (PDT)
Date: Tue, 23 Jun 2026 08:36:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up style and dead code in
 rtw_recv.c
Message-ID: <ajobVOpSu1PMHaNo@stanley.mountain>
References: <20260622200239.14683-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622200239.14683-1-andrem.33333@gmail.com>

On Mon, Jun 22, 2026 at 05:02:39PM -0300, André Moreira wrote:
> Fix checkpatch.pl warnings in rtw_recv.c by removing an explicit '== true'
> comparison with extra parentheses from check_fwstate() and dropping a
> redundant 'else' block after an early return.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index f78194d508dfc..3fb48a8a52b17 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
>  	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
>  	pattrib->eth_type = eth_type;
>  
> -	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
> +	if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {


Someone already did this.

>  		ptr += rmv_len;
>  		*ptr = 0x87;
>  		*(ptr + 1) = 0x12;
> @@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  			/* Duplicate entry is found!! Do not insert current entry. */
>  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
>  			return false;
> -		else
> -			break;
> +		break;

This change introduces a bug.  I created a Smatch check based on the
new bug.  It's in the Smatch devel branch.
https://github.com/error27/smatch/blob/devel/check_pointless_loop.c

KTODO: review loops that are really if statements

Some of these have comments where it was originally intended to be
a loop but it lead to bugs so they hacked around it by only looping
one time.  These are mostly quite old code and they seem to be working
okay so probably they are false positives in one way or another but
just I feel like most would be more readable as an if statement.

kernel/rcu/tasks.h:1521 rcu_tasks_verify_self_tests() warn: replace while loop with if statement?
kernel/bpf/btf.c:7383 btf_struct_access() warn: replace while loop with if statement?
drivers/net/wireguard/selftest/ratelimiter.c:170 wg_ratelimiter_selftest() warn: replace while loop with if statement?
drivers/video/fbdev/sis/sis_main.c:2226 sisfb_sense_crt1() warn: replace while loop with if statement?
drivers/video/fbdev/sis/sis_main.c:2228 sisfb_sense_crt1() warn: replace while loop with if statement?
drivers/video/fbdev/aty/radeon_base.c:1556 radeon_calc_pll_regs() warn: replace while loop with if statement?
drivers/media/pci/tw686x/tw686x-video.c:133 tw686x_memcpy_buf_refill() warn: replace while loop with if statement?
drivers/media/pci/tw686x/tw686x-video.c:159 tw686x_contig_buf_refill() warn: replace while loop with if statement?
drivers/ntb/test/ntb_perf.c:462 perf_cmd_recv() warn: replace while loop with if statement?
fs/afs/rxrpc.c:526 afs_deliver_to_call() warn: replace while loop with if statement?
fs/xfs/scrub/attr_repair.c:532 xrep_xattr_find_buf() warn: replace while loop with if statement?

regards,
dan carpenter
