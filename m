Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDDCC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Nov 2021 09:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1838C615E1
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Nov 2021 09:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhKOJor (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Nov 2021 04:44:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhKOJop (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Nov 2021 04:44:45 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C0CC061767
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Nov 2021 01:41:49 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id c8so68718067ede.13
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Nov 2021 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AYqbeZ2mpQmpuB6ksQc8ohOCYowaIxnorZPGKiryA0c=;
        b=JdMnykfVIKiiMfL2VFgEJRbHZB7MfwD71DqvHpdzQbO4tmxNago+L3p/1h7ESjNjyu
         oxO3rtK9kRAb2z/eOpuFUIiMi43U4dSeXoNKMy3cgMKNfn3ZVa86cGUixekGfuUCLsxm
         /7nMCOBspoDbYJ3JgGZL15HZc7ypC4LNbKMnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AYqbeZ2mpQmpuB6ksQc8ohOCYowaIxnorZPGKiryA0c=;
        b=eiZVttIQOEQcDF1nR/Ycns2M2rl02pzOfwD8eLX5lu/9z52xzC4WTFhRAgRFHffmMb
         icXkMw1qCOPJF89vQ0teY6buC7T1G2RfExKyeCnk43dv2iVnN6MhVE7jdRSvXI8u3Kvr
         h2Gtbya4vy40nMpb+8sWtyURwIK5zadQG5fi99y8VDMdUkkGHjwioUAzwWXvj4qW8DcP
         XOgrRyZWlbLLIBQztpG+doq2cxOkK7qfwxR92t4fqvVaAv0kTGm0bG2kYDdrbKNAtv8e
         E2RlRJYQFV8fA6jZPK9QUTZk6m6S4Pn/U/ykDbIE9ckefNUvnVezAYoplorZ2ui7aeHd
         bblA==
X-Gm-Message-State: AOAM532avfupiNC4mRY0W1mScif312IGYNru7Zdz6DIdbab5wXd56WOF
        3ahifX+1n/13uyIcd0aNxcIQeg9edT9uDdrQraHGTA==
X-Google-Smtp-Source: ABdhPJxLrlF28FgYkomzR4UH3SqUDvOokPN1DVYuV1rM6mujj1DJG9mFRIRGyNDhu/4m275cebUKYM4RiMCcXsJPkpM=
X-Received: by 2002:aa7:c719:: with SMTP id i25mr16210158edq.157.1636969307866;
 Mon, 15 Nov 2021 01:41:47 -0800 (PST)
MIME-Version: 1.0
References: <47ed717c3070a1d0f53e7b4c768a4fd11caf365d.1636707421.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <47ed717c3070a1d0f53e7b4c768a4fd11caf365d.1636707421.git.christophe.jaillet@wanadoo.fr>
From:   Selvin Xavier <selvin.xavier@broadcom.com>
Date:   Mon, 15 Nov 2021 15:11:36 +0530
Message-ID: <CA+sbYW3WNJNWSNL84XgZ+PPSbR+_S93HV1u0CGS+3uNTpDp-WQ@mail.gmail.com>
Subject: Re: [PATCH] RDMA/bnxt_re: Scan the whole bitmap when checking if
 "disabling RCFW with pending cmd-bit"
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
        Eddie Wai <eddie.wai@broadcom.com>,
        Somnath Kotur <somnath.kotur@broadcom.com>,
        Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Nov 12, 2021 at 2:36 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The 'cmdq->cmdq_bitmap' bitmap is 'rcfw->cmdq_depth' bits long.
> The size stored in 'cmdq->bmap_size' is the size of the bitmap in bytes.
>
> Remove this erroneous 'bmap_size' and use 'rcfw->cmdq_depth' directly in
> 'bnxt_qplib_disable_rcfw_channel()'. Otherwise some error messages may
> be missing.
>
> Other uses of 'cmdq_bitmap' already take into account 'rcfw->cmdq_depth'
> directly.
>
> Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Selvin Xavier <selvin.xavier@broadcom.com>
