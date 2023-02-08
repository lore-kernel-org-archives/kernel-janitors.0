Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338ADC636CC
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Feb 2023 07:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjBHHws (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Feb 2023 02:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjBHHwq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Feb 2023 02:52:46 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37B5212B7
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Feb 2023 23:52:45 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id r8so18397450pls.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Feb 2023 23:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zhDJApKtBQcvwymZ5SCtHomIXxqcYYVtYxL3jD0nv8A=;
        b=eqGrOQjEwqnci7sSQ7FMs3Ok0ATLFezDT3iEUXY6o7kh6Z2Ah3wdtWQk9ljBd2sXfX
         7ay1T3MqcGgE8eiymGU4SGIrPRS2Elb5ALGjaZXq8n3K70j3/4yVN6LLZNfTK0c339Yh
         RbNoAlQVxOKVyUcIsXM34bjv7F4KJa2E7uzGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhDJApKtBQcvwymZ5SCtHomIXxqcYYVtYxL3jD0nv8A=;
        b=k5rxRMGZSVKMSGHGjxXNlTjsKJdW0ZIS2ikyIvMcrg2tpEm8c7aoj/XKx5TkhKMlMA
         QSl98R5CFMLSmwg/rM9jIU6CIIJAp+z+9qZalGK2vuWKZH/lrHmIe6fwwgJyTlMWLwh8
         CLY2sBgwJ+jjeSbLekDQz5jBvQc3ZvRXH6OLeSjfO0nxJgtlCczEKrh6OzRotshnGljs
         ztMrCkIHermPdt8q1yRQK3lBdR7Kw91ku0T8H8t9J5w+wEMHd90kirEsVFSfyzLlOytq
         FKq8H0Ut/OjHO8opAP75oHB/JzyTFodCNshnWs9Fbt9caOUGiEKJWOAe6c7qy1zmBIfV
         c9Zg==
X-Gm-Message-State: AO0yUKWDY7uqiXsz+vsUM1vz2arsS0mkLNGPOXZbkIXASUE6YPQ9RKwz
        +928lwkLiCLugpYZM5u0GYZW8jG+Pw+nBVaEc2niWQ==
X-Google-Smtp-Source: AK7set85cPdzxaY0rLNikp+E53fZOD5mAQhhWbvkPlDWSAtyKYtHs7ThVA1FO3XcwaBZAO9Qs/JSARXhC6J9eEVZWXE=
X-Received: by 2002:a17:90a:7483:b0:231:eb7:ece4 with SMTP id
 p3-20020a17090a748300b002310eb7ece4mr448656pjk.26.1675842765263; Tue, 07 Feb
 2023 23:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20230207091443.143995-1-colin.i.king@gmail.com> <Y+NQLOJ9IlbQJttd@google.com>
In-Reply-To: <Y+NQLOJ9IlbQJttd@google.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 7 Feb 2023 23:52:33 -0800
Message-ID: <CACeCKacOiJHMGTaT3J-B1_rYbU=yJQ2Xr7nFjX_1aMcya1xT_Q@mail.gmail.com>
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion"
 -> "attention"
To:     Tzung-Bi Shih <tzungbi@kernel.org>
Cc:     Colin Ian King <colin.i.king@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Feb 7, 2023 at 11:33 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Hi Prashant,
>
> On Tue, Feb 07, 2023 at 09:14:43AM +0000, Colin Ian King wrote:
> > There is a spelling mistake in a dev_warn message, make it lower case
> > and fix the spelling.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> It's about time to cut for the coming merge window.

I thought there would be an rc8...

> I guess you would
> like this simple patch to be included as a fixup for f54c013e7eef
> ("platform/chrome: cros_typec_vdm: Add Attention support").  Please apply
> the patch if it makes sense.

Sure. I'll make the modification you suggest and apply this tomorrow.
Thanks for signal boosting it.

>
> One minor suggestion for the commit title:
> "platform/chrome: cros_ec_typec: Fix spelling mistake" looks more clear
> to me.
>
> With that:
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
