Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C72AC41513
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Aug 2023 13:42:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbjHINmf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Aug 2023 09:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjHINme (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Aug 2023 09:42:34 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196471986
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Aug 2023 06:42:32 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so7334034276.0
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Aug 2023 06:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691588551; x=1692193351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aN+FplIKKK7RYr0Y31cgi1AbLRZ5VPs2/8SsV3oWXZ0=;
        b=XVvtPgbVgOyiC6hrUMe13eiOP5fztIj6UZuel4GtNUav1ZdcVI+k7jUSIw9lAWvO4m
         VRblgx1Nlzqjmj7xxk1IoKYfWbtSJrEsmfYogXqqfNTf9c6ATu7k7toI60t4kUygarYz
         C8zzNw2bKzwsaleAH5izLEPSlkqLFMhYK5Y+Khn+W2uzToQ8CJ4qQZLl2UZky3Xu5SB7
         /WNHjoQv7xTiQhmD2/Ym/ilaqsrBUbmeEoAKGPmAq5RWzemzSi/ZUVvxUni5LqcaPdwh
         0+V2Xp5yWHnFDCNNvFK792wRdujD1zk/q8WjZ8qL8YyVDlscsikAcLV7216z8KRqGewr
         XQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691588551; x=1692193351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aN+FplIKKK7RYr0Y31cgi1AbLRZ5VPs2/8SsV3oWXZ0=;
        b=dYfbxnp/fsUlU/KltkzMYh1kf0c7WeLkj2UD/Xd2rwCXGv8nyGFNdNXZucqPuzbls6
         hQs6l+nGHZQ9LMrBF2zkEEkMXK8b6nsi9vPRYqFG7MJ2yfQe7fQCpdHZpn2L2nCqG2n9
         vD3Is4W08qGoAgohGciTcj5O7cWTWiAMpTv5FbYwJ1v1ASCswWGQYVdAaSIzPz1FCNdn
         rIuZcLYzzvfdC/CRkiM9ZeWabRUJQ9H/fg1G12cslq73g7SRDMKDbT9YpuXQZ/rPIdS6
         YldxiYoW4QfiIEv0zkmhmm+aEcBtdWboeSmyRepnLm4pua6FAqHMf5JKijHU4ywQuhYz
         zoHg==
X-Gm-Message-State: AOJu0YwlZ+m5tzRjLjt/eWKEToTbVHmCC0E/RReJUNZ4grzDvoIxonJ0
        QZ5BbOpm9h8AOY9ZJFhFL0Bg1xeTI3Hylpx1BVQBtw==
X-Google-Smtp-Source: AGHT+IGuuUQiZKFCzSMTeH8Sgpfc/zHzkbce8TUWeKlIbJ0VWef7x1QmytTMYmvv8I/DwFGqwX4X/zmkViqiY1WFjic=
X-Received: by 2002:a25:69cc:0:b0:c4e:3060:41f5 with SMTP id
 e195-20020a2569cc000000b00c4e306041f5mr2520373ybc.33.1691588551254; Wed, 09
 Aug 2023 06:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230809071812.547229-1-harshit.m.mogalapalli@oracle.com>
 <20230809071812.547229-2-harshit.m.mogalapalli@oracle.com>
 <CAPDyKFqHnHCpsi+GBAQ2vmESf17rDMGyUK+EtZbhJT5AngvmBg@mail.gmail.com> <9c7a69b1-9ee3-4676-8d3e-9f12e39b37af@kadam.mountain>
In-Reply-To: <9c7a69b1-9ee3-4676-8d3e-9f12e39b37af@kadam.mountain>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 9 Aug 2023 15:41:55 +0200
Message-ID: <CAPDyKFqaF9LhZPke6wEVCqZT0Nx4bBDsf_Qg1knT3UgznrbhpQ@mail.gmail.com>
Subject: Re: [PATCH next v2 2/2] mmc: sunplus: Fix platform_get_irq() error checking
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        tonyhuang.sunplus@gmail.com, lhjeff911@gmail.com, arnd@arndb.de,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        error27@gmail.com, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 9 Aug 2023 at 13:51, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Wed, Aug 09, 2023 at 01:33:51PM +0200, Ulf Hansson wrote:
> > On Wed, 9 Aug 2023 at 09:19, Harshit Mogalapalli
> > <harshit.m.mogalapalli@oracle.com> wrote:
> > >
> > > The platform_get_irq() function returns negative error codes on failure.
> > >
> > > Fixes: 4e268fed8b18 ("mmc: Add mmc driver for Sunplus SP7021")
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/all/a3829ed3-d827-4b9d-827e-9cc24a3ec3bc@moroto.mountain/
> > > Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> >
> > Applied for fixes and by adding a stable tag, thanks!
>
> It's not really a fix.  The platform_get_irq() function can't actually
> return zero.
>
> I asked Arnd about this and he said that there were some arches where
> zero was a valid IRQ but they're not in the upstream kernel any more and
> we're hopefully not going to do that again.

Alright, I moved this to the next branch and dropped the fixes and stable tags.

Kind regards
Uffe
