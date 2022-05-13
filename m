Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3548C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 May 2022 08:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353656AbiEMIQ3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 May 2022 04:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378110AbiEMIQB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 May 2022 04:16:01 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1325B17E24
        for <kernel-janitors@vger.kernel.org>; Fri, 13 May 2022 01:15:57 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 629B421AC4;
        Fri, 13 May 2022 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1652429756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b6YQVexX7UTJnWEVnXu5bkoEQ1UT4a+bkAdGITJy2EM=;
        b=tzp+IIiFpeOvr6BU4MVhh8SaS5qCHMPGJDWdNAWyUiysNAO7v6MVBH6bF4vLh87FbkX5yE
        AXKo19g2/V5pQ4E2fsXAAlGJn8z2TAbLfxOOc4MLn/LVaaxM2IYoZ1rgykU7M5Ytf43Cpf
        h6DRICWG9wuSJIyYdXXPU5NoMw/iPVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1652429756;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b6YQVexX7UTJnWEVnXu5bkoEQ1UT4a+bkAdGITJy2EM=;
        b=VStzwuEsbJjim10sEvgFYTJ7nqYCvnxcdh8/sH/wvFOMGDshDaD2ARGLUVD0X0tncKMlkT
        wEbeAoI6xJbF6MDA==
Received: from ggherdovich.udp.ovpn1.nue.suse.de (unknown [10.163.29.78])
        by relay2.suse.de (Postfix) with ESMTP id 4926C2C142;
        Fri, 13 May 2022 08:15:56 +0000 (UTC)
Message-ID: <3007dd9b64c71c1b9c1f219ddb51ab950ac9d17e.camel@suse.cz>
Subject: Re: [bug report] x86, sched: Bail out of frequency invariance if
 turbo frequency is unknown
From:   Giovanni Gherdovich <ggherdovich@suse.cz>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Date:   Fri, 13 May 2022 10:15:50 +0200
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
> Uninitialized.  Although I notice that base_freq is also unintialized
> and that predates your patch...  So I should probably send this bug
> report to someone else...  Sorry?
> 

Hello Dan,

I'm the right person for this report, as I think I wrote both the buggy
patch and the buggy code that predates it. I'm taking a moment to check
what's going on, as that really look like a dumb mistake.

Thanks for the report, I'll follow up.

Giovanni

