Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BACC07E95
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Jul 2021 06:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83DE560FEE
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Jul 2021 06:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbhGMGDf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Jul 2021 02:03:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58685 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232634AbhGMGDe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Jul 2021 02:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626156044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9bCaNkAj4f1LnLkK/10jGnK5QRfAHPC6zgTttqqRfXY=;
        b=NQeE8ieq0O3redIbYCirQRApQl/x3pWngsQjV5nMw7QI3nu/QglSndv+ZPCssNWoRCnPkA
        C5iklFc/cvbqeX+Y2LPW2Fw2vD4lz/7X8q7vMIrNcOgDJYMsXZDgGHU/JYTdPCF11TTeqI
        gBz5ManSoR2mTZ5IrlHIiXgU96D7TiE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-3VnozxZpPnW9qWl5-mflQQ-1; Tue, 13 Jul 2021 02:00:43 -0400
X-MC-Unique: 3VnozxZpPnW9qWl5-mflQQ-1
Received: by mail-wr1-f71.google.com with SMTP id 32-20020adf82a30000b029013b21c75294so7035584wrc.14
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jul 2021 23:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9bCaNkAj4f1LnLkK/10jGnK5QRfAHPC6zgTttqqRfXY=;
        b=evMpNnb8XZjp1wijQaLFtGkw39FthtYDqtX+tjB3hHy8Nu7iXQOwn1YLhdke0H46oY
         tMSlVDq+lbF/TT5ktybjXYxUYYzPjGir9HoLVdgwh9W90vVxkisMvg22t4eeKXyp8LUR
         sldPWGzyXt76JCDDO9W8TjruE/mP/MwmkfwOYZ6giKKgcApV9sWetsMVSVZU1V8Aldky
         4fApwfpujGIX3xmI3/u4xqxjJaFieA2RPXoxT1oSK/sw6a6kEAMnk7rEOVQJcvIhNnIL
         0ARprBZecSLBI5axMr4YCs+j8hxub0HQJk/++XFEY0Dtl1lOx4qudEsrd5v6j4+xffio
         h3aQ==
X-Gm-Message-State: AOAM533OzP/VM+O+WG6xZFl0NkBNt+N/49OXIEUAP+N/PD8cGEkuEykC
        ieHrCu8Zd7ecU2zdVQ15kSyxl+MZfAYtNWy9UkWNoqz9Al1e5I9qbiEqRxq2ICKzPulMAM7cuhS
        EAnSEcpgadm41zOzR+eWc0SEfb12vM2LBKdSi4/lAozqz
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr3060496wmb.27.1626156041681;
        Mon, 12 Jul 2021 23:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCzQbgh9kCPy6bTMehMxShnwdK8pEgvMZNUVi0DDbMegUNP6IeRgE3zmDkHYgleDuxud58cKPgdT3TkAFz/18=
X-Received: by 2002:a1c:62c4:: with SMTP id w187mr3060445wmb.27.1626156041061;
 Mon, 12 Jul 2021 23:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210712162430.104913-1-colin.king@canonical.com>
In-Reply-To: <20210712162430.104913-1-colin.king@canonical.com>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Tue, 13 Jul 2021 08:00:00 +0200
Message-ID: <CAHc6FU7oj0j=YC9Y06S8jwT_mew+hbbvXSZo55xxuOKZgSEAPA@mail.gmail.com>
Subject: Re: [PATCH] gfs2: Fix memory leak of object lsi on error return path
To:     Colin King <colin.king@canonical.com>
Cc:     Bob Peterson <rpeterso@redhat.com>, Abhi Das <adas@redhat.com>,
        cluster-devel <cluster-devel@redhat.com>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On Mon, Jul 12, 2021 at 6:24 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where IS_ERR(lsi->si_sc_inode) is true the error exit path
> to free_local does not kfree the allocated object lsi leading to a memory
> leak. Fix this by kfree'ing lst before taking the error exit path.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 97fd734ba17e ("gfs2: lookup local statfs inodes prior to journal recovery")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/gfs2/ops_fstype.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 5f4504dd0875..bd3b3be1a473 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -677,6 +677,7 @@ static int init_statfs(struct gfs2_sbd *sdp)
>                         error = PTR_ERR(lsi->si_sc_inode);
>                         fs_err(sdp, "can't find local \"sc\" file#%u: %d\n",
>                                jd->jd_jid, error);
> +                       kfree(lsi);
>                         goto free_local;
>                 }
>                 lsi->si_jid = jd->jd_jid;
> --
> 2.31.1

added to for-next.

Thanks,
Andreas

