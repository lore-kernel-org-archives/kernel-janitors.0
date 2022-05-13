Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4309C4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 May 2022 13:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378456AbiEMNSK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 May 2022 09:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380643AbiEMNSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 May 2022 09:18:04 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B51CE0FF
        for <kernel-janitors@vger.kernel.org>; Fri, 13 May 2022 06:17:31 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id D97C421A92;
        Fri, 13 May 2022 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1652447849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hvc2URgoxyyZ40UQD6MT1ao7dS96jkJ3swx4DTMXyRI=;
        b=HpYUetYJCP00D6RFj+d4HxtZe1zH6vBdbzfh9WBf6jIY9zerl+T7R4KWsAwEay9kVGDyvl
        yrzp6Ft4jrxNB70tlfPhg/PoBFJIXo2QVseoFuyn/501BOBdnk5nzTOnM5uIKrXLf0Q544
        PcuJdrW/7z3vgFr34OPq7/ukRemwJb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1652447849;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hvc2URgoxyyZ40UQD6MT1ao7dS96jkJ3swx4DTMXyRI=;
        b=KKMjgASLgn7NB2bSQ62BKXZTVu/JP66FUoyKGkou2+Rmcq+23NOgEv0qyuUljS+it0ZTiY
        u/pBp6qura+sXhCA==
Received: from ggherdovich.udp.ovpn1.nue.suse.de (unknown [10.163.29.78])
        by relay2.suse.de (Postfix) with ESMTP id C18CC2C141;
        Fri, 13 May 2022 13:17:29 +0000 (UTC)
Message-ID: <aed5505a1ae9ec9aab1978ad36c46b1e0acd2aeb.camel@suse.cz>
Subject: Re: [bug report] x86, sched: Bail out of frequency invariance if
 turbo frequency is unknown
From:   Giovanni Gherdovich <ggherdovich@suse.cz>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Date:   Fri, 13 May 2022 15:17:24 +0200
In-Reply-To: <YnN3MwU5lPoNXhWU@kili>
References: <YnN3MwU5lPoNXhWU@kili>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 2022-05-05 at 10:05 +0300, Dan Carpenter wrote:
> Hello Giovanni Gherdovich,
> 
> The patch 51beea8862a3: "x86, sched: Bail out of frequency invariance
> if turbo frequency is unknown" from May 31, 2020, leads to the
> following Smatch static checker warning:
> 
> 	arch/x86/kernel/cpu/aperfmperf.c:274 intel_set_max_freq_ratio()
> 	error: uninitialized symbol 'turbo_freq'.
> 
> arch/x86/kernel/cpu/aperfmperf.c
>     242 static bool __init intel_set_max_freq_ratio(void)
>     243 {
>     244         u64 base_freq, turbo_freq;
>     245         u64 turbo_ratio;
>     246 
>     247         if (slv_set_max_freq_ratio(&base_freq, &turbo_freq))
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Imagine this fails.
> 
>     248                 goto out;

I think this is a false positive of the static checker; I'll send the patch
to initialize the variables anyway as it looks better.

When slv_set_max_freq_ratio() fails, it returns false, and we move on to the
next "if" statement. "goto out" is executed only if slv_set_max_freq_ratio()
succeeds (returns true), and writes data in its input parameters.

I give you that the code looks wrong, because apparently when people (and
static analyzers) read that, they think "if (problem) goto error;" but this
function is written like "if (it_works) goto the_end;".

When I received your report I thought the code was wrong, too.
You already sent me this report two years ago,
https://www.spinics.net/lists/linux-kernel-janitors/msg51372.html
and I didn't reply (I should have).

>     249 
>     250         if (x86_match_cpu(has_glm_turbo_ratio_limits) &&
>     251             skx_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
>     252                 goto out;
>     253 
>     254         if (x86_match_cpu(has_knl_turbo_ratio_limits) &&
>     255             knl_set_max_freq_ratio(&base_freq, &turbo_freq, 1))
>     256                 goto out;
>     257 
>     258         if (x86_match_cpu(has_skx_turbo_ratio_limits) &&
>     259             skx_set_max_freq_ratio(&base_freq, &turbo_freq, 4))
>     260                 goto out;
>     261 
>     262         if (core_set_max_freq_ratio(&base_freq, &turbo_freq))
>     263                 goto out;
>     264 
>     265         return false;

The "return false" above is what happens if none of the "if" matched, and this
is when base_freq and turbo_freq are uninitialized.

>     266 
>     267 out:
>     268         /*
>     269          * Some hypervisors advertise X86_FEATURE_APERFMPERF
>     270          * but then fill all MSR's with zeroes.
>     271          * Some CPUs have turbo boost but don't declare any turbo ratio
>     272          * in MSR_TURBO_RATIO_LIMIT.
>     273          */
> --> 274         if (!base_freq || !turbo_freq) {
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^
> Uninitialized.

I know it looks sketchy (and makes you think I forgot the initialization), but
the condition here is checking for when a *_set_max_freq_ratio() above
matched, but received zeroes from reading the corresponding MSR.

Anyways, patch incoming to make this look better, but I don't think it's a
"fixes: [...]".

> Although I notice that base_freq is also unintialized
> and that predates your patch...  So I should probably send this bug
> report to someone else...  Sorry?
>
>     275                 pr_debug("Couldn't determine cpu base or turbo frequency, necessary for scale-invariant accounting.\n");
>     276                 return false;
>     277         }
>     278 
>     279         turbo_ratio = div_u64(turbo_freq * SCHED_CAPACITY_SCALE, base_freq);
>     280         if (!turbo_ratio) {
>     281                 pr_debug("Non-zero turbo and base frequencies led to a 0 ratio.\n");
>     282                 return false;
>     283         }
>     284 
>     285         arch_turbo_freq_ratio = turbo_ratio;
>     286         arch_set_max_freq_ratio(turbo_disabled());
>     287 
>     288         return true;
>     289 }
> 
> regards,
> dan carpenter

