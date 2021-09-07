Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0057EC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 08:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D517D60F45
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 08:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242801AbhIGIla (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 04:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242649AbhIGIl3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 04:41:29 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330DFC061575
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Sep 2021 01:40:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id eb14so12804418edb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=moB6gzF9a/iODpL9+JSeq+y2fuYA53sWzMpy6laceag=;
        b=OvTsb4umxclqCm85yvZpZfrCJmEcyGYcQICrq5CdYkXIDi7ftViHnkaIo7kJwMb1AI
         VcJwCGeTDQD01XLaCmwhSKmD4+oKKFSu8IUjZTsgZ1QnOSQk04uCAZnhnenR4THqt+Wy
         oahReMWJd7aN5nDYU1/4Y5eupNbdKDBV33YFKxNliLyKsNgNRThzKsJSL3tkiIDi/MNF
         eM/XJ+EiQgui3HsTULuLayob4Hy3PrrwKiIahMG9g/1XGfo8hu/ApCGkBtOtnjBuRFWL
         qHsUVi4WM63FPlS1gF/N8pSBLekpiQ6vH64XIhXzBdyiIJgRZytd+owyGrzHA6lMDW+D
         kOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=moB6gzF9a/iODpL9+JSeq+y2fuYA53sWzMpy6laceag=;
        b=cU2BwD+HMLuZ+WP169XWHHaD7RX4Gx8WuWBPzGISALJNVakWNKH5JXA3VmCG3dnfbj
         vNMl8GBuMnAXOBULeZSd8CACOy5NV6d+wh8OjhWwv+ak66dZfJH6P1LIsUC5w6ChqVLv
         g6i7bkqRAdttI+DVnVo2/X5n6/VQnu1ifClCcLyJP3zxjBsrMDs4RWpiMx5rug1cQH8W
         V8CO4tdOtW86l+ctVsIIYcYDEz+Xs0mZ0/ZpRB97rx/h09vyKJL7vDPZZLOr57DtDecn
         NGmW6u9zm/SMBbOpQ06S4pGSXt0qg3yyHkGjAgyQf3PbGecVkkJdfyNglXZV9iYupyXw
         V+3Q==
X-Gm-Message-State: AOAM5332li5t/RjvYb9niKoe6If5SLn25WNohohLoDrqop1vF7VFJqLI
        VK9vAAcPHcmvOdBlEao/3fTkt/Quu3AWVWSWT/No
X-Google-Smtp-Source: ABdhPJwZgTubjhS7IfgYErtfSqKD/xj+RA/JnUrQO9b9Nk/daCfL/HOkSIeAzo0lwQW10Bgj7K5ZLs0JcSVRflqmDTE=
X-Received: by 2002:a05:6402:2686:: with SMTP id w6mr14798667edd.231.1631004021172;
 Tue, 07 Sep 2021 01:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210907073223.GA18254@kili>
In-Reply-To: <20210907073223.GA18254@kili>
From:   Yongji Xie <xieyongji@bytedance.com>
Date:   Tue, 7 Sep 2021 16:40:10 +0800
Message-ID: <CACycT3sy7kU5tHfSxQ_P796t7X_rywPWePOs3UVAZ9ssdAZEQw@mail.gmail.com>
Subject: Re: [PATCH] vduse: missing error code in vduse_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 7, 2021 at 3:32 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This should return -ENOMEM if alloc_workqueue() fails.  Currently it
> returns success.
>
> Fixes: b66219796563 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Thank you for the fix.

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>
