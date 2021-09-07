Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B1FC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 08:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 314CF6105A
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 08:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242844AbhIGImy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 04:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242786AbhIGImy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 04:42:54 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD99C061575
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 01:41:47 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id h9so18204820ejs.4
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6TrP9cI1rNlHc5B6HqN5eXGpM4yRTDGjWN8XiqRj8ZI=;
        b=P80yXlDi83r71wCNRhEMuKi1cDpxVnnFiBQRoN+QuVXqOkOwhd2YaLQvdH0++gJNe7
         izqI+Y2Cd3vaspkyNR3i1RyBvu5mZys9xoyKK+nIXceG6ULil1InQYnUZHdzBXm3uBhf
         WiEDzMim9MDBuGRWbjZe/liK7Cw2fvOwliEWMwn4Ez43Wxx6/cusrlrT1uKaIyyHc2/R
         LdtZXpG0nZpNsEprLGA35SEVBhJNmlWaTOJDoYdyQNoyQhFjtrjkGntyr+GWZ+9ZRLmX
         V5JtQHTfaTguIA9WOlh8zqYlsKvfNbAvWsfZCL2n/Z12/KMg3y7FXbY0rme5w1eTx/oI
         i1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6TrP9cI1rNlHc5B6HqN5eXGpM4yRTDGjWN8XiqRj8ZI=;
        b=T29R/13Z/plNDUlCQcvc3KAaCO6FynmvxVBCrqtLA6LFeF5wQy5+TBZLej/YOmt12P
         M3YuHyDk3fi2FOvks6Ot2Ox8+cQuR2aJ3gSAfixjVKch3dWNX7Pm+797PzBlqVPYAZMU
         WDSLD7ax6T87exlOnLZck0clksIgXPaDghftWhPKjSp6VxtZ5gEr23cLXb8tEgH2Txt1
         kJgj2EfK0ZNC8oNqkuCLe6PSNZDI2IIL8PqAVP/sgiAzzi7xG8jUvdjJ5VwS8ets46MA
         pe1MKzuk0NdX112fM3T3AbNfTEoCII39EG+mrK9sq8cII3X4N6swKcgIdwTlWHu6nFaA
         lq2Q==
X-Gm-Message-State: AOAM531vsEHhIqADCDNdmQeOFdIGWp8CMhaze1TQNvST/P5M/EhzL+Hd
        DdGRP2Fi4Brl/6cu7vrqdz3kRDkuuIYmgF9jqeoG
X-Google-Smtp-Source: ABdhPJwcPC2XIZ/Uh1nWFNjKsZlBwveMqSC7P96erbRmuuQQSsWtJYORuNg7XIayTslLK8BpjyhRACEvnas8XaVTdks=
X-Received: by 2002:a17:906:2cd6:: with SMTP id r22mr17303469ejr.398.1631004106564;
 Tue, 07 Sep 2021 01:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210907073253.GB18254@kili>
In-Reply-To: <20210907073253.GB18254@kili>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Tue, 7 Sep 2021 16:41:35 +0800
Message-ID: <CACycT3vROtG7_=zpDtZ0KDO9MgtbA_kBUrbBnLXWe0q9gtOnmA@mail.gmail.com>
Subject: Re: [PATCH] vdpa: potential uninitialized return in vhost_vdpa_va_map()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 7, 2021 at 3:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The concern here is that "ret" can be uninitialized if we hit the
> "goto next" condition on every iteration through the loop.
>
> Fixes: 41ba1b5f9d4b ("vdpa: Support transferring virtual addressing during DMA mapping")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/vhost/vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
