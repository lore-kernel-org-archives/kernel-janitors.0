Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFF4C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 16:25:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31BEE60720
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Aug 2021 16:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhHCQ0F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Aug 2021 12:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46498 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233389AbhHCQ0F (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Aug 2021 12:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628007953;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PX1LzUZWxMbs1Ca7xK69ADGz7p1q7p6YCY63lvBalNw=;
        b=LYSuv4TqtkuubTqg+Gn48GlQjJ8OvoBRYldA6PTgGEmS1J6DoPEQYD6/7hFeupjLkP7YeY
        3mztCMHToqdqwMGiNuHcJtZRroVSuO6TQFUwgSTp5vq1Kq6tdSJxIN5ASpA9gRFxmCAaoV
        jNhNWeFflW5VaW28vQG7sPu4tbbR65A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-Qe5b0unXOHqPjq305F4Bwg-1; Tue, 03 Aug 2021 12:25:48 -0400
X-MC-Unique: Qe5b0unXOHqPjq305F4Bwg-1
Received: by mail-ed1-f69.google.com with SMTP id y39-20020a50bb2a0000b02903bc05daccbaso10710102ede.5
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Aug 2021 09:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PX1LzUZWxMbs1Ca7xK69ADGz7p1q7p6YCY63lvBalNw=;
        b=N02Cu79oo1/bXYqjV+tzJnYpMjLyoYzt7PCDQ3lwnoWrd2CfyxgEf6E8I4C+IQ3nWD
         oZiX79AbuEVigW9GsAzdVQvquRuXjXKBqrwuK5XWV7000hauPmzbDa6+xaJZ3Iw1jVME
         2YBsdF+DQiIT5P2jpThKsPFWt2jpGbKmOjxu/Pq3bmGPCsRrfwT7xV2teMacxw6iUsWr
         cxtK3Z46FZxmkRr0uIW9Ra2SUJmcUfXUUtxZVTGEbB1zvmv6XVI/Mlt8dD4XKmL4OzDF
         yxEUEbvoeeVM/0xZOo7ogOEVAOLGfuC6PGP5f1wN2I41TCDs6lSvYZ5nlRXqMXrciXKq
         QE/A==
X-Gm-Message-State: AOAM531/UOFwRkjLyJrj9ov/c1yxW5zHPVJ0kFi5Yhcpu5tnahdX2CAm
        DqaO9Eu+kd5qLM8U/2QGAyT3v/Y12bw2NH8pgWLoWtzF+SlaCoPT6Z7A8RvlhiA6Hz5AohuRVk9
        JLqYtt7o4hfKDvovgdIioUGa9w7OqOKUbq3vk/4xXgSiU
X-Received: by 2002:a05:6402:524b:: with SMTP id t11mr11950692edd.330.1628007947719;
        Tue, 03 Aug 2021 09:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg43XLgMPgISftDeQNnxLei4ATAz5KaWzBpvDfDPJzBydSSOnZqBEnNwkMjhKLPahW48KKX+cuEaDMjXh7ZRg=
X-Received: by 2002:a05:6402:524b:: with SMTP id t11mr11950679edd.330.1628007947602;
 Tue, 03 Aug 2021 09:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210803155625.GA22735@kili>
In-Reply-To: <20210803155625.GA22735@kili>
From:   Ewan Milne <emilne@redhat.com>
Date:   Tue, 3 Aug 2021 12:25:36 -0400
Message-ID: <CAGtn9r=cVQ8wM_aLW0hYOkUvDnN9AGkf5wf2ee0YbqLkHjjH4g@mail.gmail.com>
Subject: Re: [PATCH] scsi: qla2xxx: Fix use after free in debug code
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Nilesh Javali <njavali@marvell.com>,
        GR-QLogic-Storage-Upstream@marvell.com,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Quinn Tran <qutran@marvell.com>,
        Himanshu Madhani <himanshu.madhani@oracle.com>,
        Larry Wisneski <Larry.Wisneski@marvell.com>,
        linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Reviewed-by: Ewan D. Milne <emilne@redhat.com>

On Tue, Aug 3, 2021 at 11:57 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The sp->free(sp); call frees "sp" and then the debug code dereferences
> it on the next line.  Swap the order.
>
> Fixes: 84318a9f01ce ("scsi: qla2xxx: edif: Add send, receive, and accept for auth_els")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/qla2xxx/qla_bsg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/scsi/qla2xxx/qla_bsg.c b/drivers/scsi/qla2xxx/qla_bsg.c
> index 0739f8ad525a..4b5d28d89d69 100644
> --- a/drivers/scsi/qla2xxx/qla_bsg.c
> +++ b/drivers/scsi/qla2xxx/qla_bsg.c
> @@ -25,12 +25,12 @@ void qla2x00_bsg_job_done(srb_t *sp, int res)
>         struct bsg_job *bsg_job = sp->u.bsg_job;
>         struct fc_bsg_reply *bsg_reply = bsg_job->reply;
>
> -       sp->free(sp);
> -
>         ql_dbg(ql_dbg_user, sp->vha, 0x7009,
>             "%s: sp hdl %x, result=%x bsg ptr %p\n",
>             __func__, sp->handle, res, bsg_job);
>
> +       sp->free(sp);
> +
>         bsg_reply->result = res;
>         bsg_job_done(bsg_job, bsg_reply->result,
>                        bsg_reply->reply_payload_rcv_len);
> --
> 2.20.1
>

