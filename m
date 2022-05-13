Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3120C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 May 2022 14:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381345AbiEMOoY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 May 2022 10:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382822AbiEMOnQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 May 2022 10:43:16 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDD051E47
        for <kernel-janitors@vger.kernel.org>; Fri, 13 May 2022 07:40:57 -0700 (PDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id E70F721A6C;
        Fri, 13 May 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1652452855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ul9j6Dz0VY1TkGvV1v39hZxGCIw/fiHXekHYix4fw7A=;
        b=vRKkdMPu+poEbl8bxT9tUUXrMpOYVh2xB50or0sEGIlX1qnDuFEOWbRKBqu1rJ6yTbzShf
        pY/h2mDRwsjpXkMXSTj51KWU9lueOM/HVKXnbJyBJNJ30on1f/uiLsRQlrba0jF8FjFaVQ
        UIefKQlEfUSFwxixhn0nEA/St5OKUaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1652452855;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ul9j6Dz0VY1TkGvV1v39hZxGCIw/fiHXekHYix4fw7A=;
        b=dAGClNP82DdpXkPTV0FGH8Z8DOy5jaBgS5Aq9X+Snns2SGAfwU1Zbh0tMIp25gIWvKNfZn
        oNyigWSOax74+DCQ==
Received: from [10.163.29.78] (unknown [10.163.29.78])
        by relay2.suse.de (Postfix) with ESMTP id D22242C141;
        Fri, 13 May 2022 14:40:55 +0000 (UTC)
Message-ID: <da085e3213f02714a590907634fb41eec31c4f2e.camel@suse.cz>
Subject: Re: [bug report] x86, sched: Bail out of frequency invariance if
 turbo frequency is unknown
From:   Giovanni Gherdovich <ggherdovich@suse.cz>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Date:   Fri, 13 May 2022 16:40:54 +0200
In-Reply-To: <20220513140549.GF29930@kadam>
References: <YnN3MwU5lPoNXhWU@kili>
         <aed5505a1ae9ec9aab1978ad36c46b1e0acd2aeb.camel@suse.cz>
         <20220513140549.GF29930@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2022-05-13 at 17:05 +0300, Dan Carpenter wrote:
> On Fri, May 13, 2022 at 03:17:24PM +0200, Giovanni Gherdovich wrote:
> > On Thu, 2022-05-05 at 10:05 +0300, Dan Carpenter wrote:
> > > Hello Giovanni Gherdovich,
> > > 
> > > The patch 51beea8862a3: "x86, sched: Bail out of frequency invariance
> > > if turbo frequency is unknown" from May 31, 2020, leads to the
> > > following Smatch static checker warning:
> > > 
> > > 	arch/x86/kernel/cpu/aperfmperf.c:274 intel_set_max_freq_ratio()
> > > 	error: uninitialized symbol 'turbo_freq'.
> > > 
> > > arch/x86/kernel/cpu/aperfmperf.c
> > >     242 static bool __init intel_set_max_freq_ratio(void)
> > >     243 {
> > >     244         u64 base_freq, turbo_freq;
> > >     245         u64 turbo_ratio;
> > >     246 
> > >     247         if (slv_set_max_freq_ratio(&base_freq, &turbo_freq))
> > >                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > 
> > > Imagine this fails.
> > > 
> > >     248                 goto out;
> > 
> > I think this is a false positive of the static checker; I'll send the patch
> > to initialize the variables anyway as it looks better.
> > 
> > When slv_set_max_freq_ratio() fails, it returns false, and we move on to the
> > next "if" statement. "goto out" is executed only if slv_set_max_freq_ratio()
> > succeeds (returns true), and writes data in its input parameters.
> > 
> > I give you that the code looks wrong, because apparently when people (and
> > static analyzers) read that, they think "if (problem) goto error;" but this
> > function is written like "if (it_works) goto the_end;".
> 
> I read this wrong.  But looking at it closer, I think the static analyzer is
> actually correct (definitely correct-ish for sure).  Smatch is complaining about
> knl_set_max_freq_ratio().
> 
>    149  static bool __init knl_set_max_freq_ratio(u64 *base_freq, u64 *turbo_freq,
>    150                                            int num_delta_fratio)
>    151  {
>    152          int fratio, delta_fratio, found;
>    153          int err, i;
>    154          u64 msr;
>    155  
>    156          err = rdmsrl_safe(MSR_PLATFORM_INFO, base_freq);
>    157          if (err)
>    158                  return false;
>    159  
>    160          *base_freq = (*base_freq >> 8) & 0xFF;      /* max P state */
>    161  
>    162          err = rdmsrl_safe(MSR_TURBO_RATIO_LIMIT, &msr);
>    163          if (err)
>    164                  return false;
>    165  
>    166          fratio = (msr >> 8) & 0xFF;
>    167          i = 16;
>    168          found = 0;
>    169          do {
>    170                  if (found >= num_delta_fratio) {
>    171                          *turbo_freq = fratio;
>    172                          return true;
>    173                  }
>    174  
>    175                  delta_fratio = (msr >> (i + 5)) & 0x7;
>    176  
>    177                  if (delta_fratio) {
>    178                          found += 1;
>    179                          fratio -= delta_fratio;
>    180                  }
>    181  
>    182                  i += 8;
>    183          } while (i < 64);
>    184  
>    185          return true;
> 
> If we reach this "return true" then turbo_freq is not set.  This may not be
> reachable in real life.  Should it be return false?
> 

That's right, it's a bug. It should return false at the end.
I'll send a fix, thanks.

Giovanni

