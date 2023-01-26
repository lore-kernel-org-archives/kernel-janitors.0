Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E626CC05027
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 16:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjAZQjX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbjAZQjW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 11:39:22 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7934A202
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 08:39:19 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t18so2390049wro.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcIULWf1hJO2aSG6ip1Q2Tbo7KEX8l8vfq1u07hQEUU=;
        b=nTJd3UqQHJYIgHfYtrJfyHF3jy6yesQbAxKnBfhlrW7ZZYv5vss1/BwpzGKnU//+pW
         zpEWqlJSU1UJSI1ZnMW1/fpJO+yHRhfSOrbz1DMeeefUw11iYpnJNzq7lutcwL4sdVQA
         M8u0eJoyy7W8bYrQw3m8zo2lACqWAzDw3gWKispcuaQug6tcfxcDGjBfRUSmloFUhxGM
         Sw/XwIM7yxzH/86FHVCW4XrLFoPQQKBIX3LLkuUfneMt47tO5zFJRor1KAkP1FlI503l
         rgytrxiJuJYtCArZvzsNUT3M8ZVe4MODcWS2KQ1S65g210VjD1EB76AaowZCvsQ/VBqY
         zIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcIULWf1hJO2aSG6ip1Q2Tbo7KEX8l8vfq1u07hQEUU=;
        b=rq+wq5Wjz1N9ZI5O8gDSqp22Ig7hVDCt946HNwMIj+ku3UT32R95y4Bm/QL3kznola
         e+8yDUyN8zF+2rW0KbcAhVnllAc1Fq5yKd/LapvRmvtsEmU6je7bQ2lYoVvUe5FFViMX
         /RhZ3BNWa+KUF+puHRbG+Xv5wGLUrSy6c7jy0yP8MD96eezDlRnLVCRVhlMdG9lV2otS
         u1u5afLl6QqAcM1iteZx5+0Ql8bKW9CR69vaC49q06NE2PWsx8AemkDEJzFXsuc5KXG/
         0LQIk7UzhUwceSvNLgIs72OaCNL9UWojlNr79IEV+RiqaYEEfh3gIqSCvbnXy8+F3Cu4
         uSBQ==
X-Gm-Message-State: AFqh2krG+wz3FHQID5Pv2HLJu7QBHJgm5+0EEMO6EnAkBIUpQTJsNTkT
        183QiflKDLYaw9UT32+seNg=
X-Google-Smtp-Source: AMrXdXsrjgrGETIMbiJakho1CzIks0SH953VqlAvOj6xcJEoDaMM1z2UyXPlB7L/3oOwE6z5TxzZag==
X-Received: by 2002:a05:6000:1f95:b0:2bc:371a:8a2 with SMTP id bw21-20020a0560001f9500b002bc371a08a2mr32915198wrb.37.1674751157968;
        Thu, 26 Jan 2023 08:39:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l16-20020adffe90000000b002b8fe58d6desm1716079wrr.62.2023.01.26.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:39:17 -0800 (PST)
Date:   Thu, 26 Jan 2023 19:39:06 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jaroslav Kysela <perex@perex.cz>,
        Maxime Ripard <mripard@kernel.org>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: pci: lx6464es: fix a debug loop
Message-ID: <Y9KsqpFRrlhX57WJ@kadam>
References: <Y9JIGt0HT8mLkUXF@kili>
 <878rhptq36.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rhptq36.wl-tiwai@suse.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jan 26, 2023 at 01:53:01PM +0100, Takashi Iwai wrote:
> On Thu, 26 Jan 2023 10:30:02 +0100,
> Dan Carpenter wrote:
> > 
> > This loop accidentally reuses the "i" iterator for both the inside and
> > the outside loop.  The value of MAX_STREAM_BUFFER is 5.  I believe that
> > chip->rmh.stat_len is in the 2-12 range.  If the value of .stat_len is
> > 4 or more then it will loop exactly one time, but if it's less then it
> > is a forever loop.
> > 
> > Fixes: 8e6320064c33 ("ALSA: lx_core: Remove useless #if 0 .. #endif")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  sound/pci/lx6464es/lx_core.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
> > index d3f58a3d17fb..7c1b380a54c0 100644
> > --- a/sound/pci/lx6464es/lx_core.c
> > +++ b/sound/pci/lx6464es/lx_core.c
> > @@ -493,13 +493,11 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
> >  		dev_dbg(chip->card->dev,
> >  			"CMD_08_ASK_BUFFERS: needed %d, freed %d\n",
> >  			    *r_needed, *r_freed);
> > -		for (i = 0; i < MAX_STREAM_BUFFER; ++i) {
> > -			for (i = 0; i != chip->rmh.stat_len; ++i)
> > -				dev_dbg(chip->card->dev,
> > -					"  stat[%d]: %x, %x\n", i,
> > -					    chip->rmh.stat[i],
> > -					    chip->rmh.stat[i] & MASK_DATA_SIZE);
> > -		}
> > +		for (i = 0; i < chip->rmh.stat_len; ++i)
> 
> Judging from the previous lines, the access over MAX_STREAM_BUFFER
> might be unsafe.  So I guess a more safer change would be something
> like:
> 
> 		for (i = 0; i < MAX_STREAM_BUFFER && chip->rmh.stat_len; ++i)

&& i < chip->rmh.stat_len

TBH, I'd prefer to just delete all this code since it used be ifdef 0.

But I'll resend as you have suggested.

regards,
dan carpenter

