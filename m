Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C58C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Oct 2021 09:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD4F61039
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Oct 2021 09:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235458AbhJLJKp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Oct 2021 05:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbhJLJKp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Oct 2021 05:10:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5898C061570
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Oct 2021 02:08:43 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t2so64752415wrb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Oct 2021 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J5tWkOQuIl0OZJOGpfR29lXHqMPLwxRju9KQkuQAZfY=;
        b=ZLALu2ZGDCxbTc4NJwezL/z/uP2403PMM5OBJiUTNasL1aQiv47ZFhgXewWJZuY+Ix
         zBd0mCzzuYXKPSa97tjBhinDMc7qEibuOsQVCyiLHJpwIj53R778KlZOXMn0RMFST76S
         RVHqULsUBMUYy7sih5X9uG92Gdnt9bZHMv5j2u5d7dR6gNTEv3KJXiXLSJjcCXlhawnk
         IkWz5+2x+yPikT1ISoeU2XU68T1HJVv4sojfYYGl679Du6w+BX0L9milGloKgycVRUUH
         4E18oy9DoTGRmBa4KI3bKeRVX141bXb3n3lMksaxPGKLfR1wo8ntFiW3oKfjNmQ0hbXB
         pG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J5tWkOQuIl0OZJOGpfR29lXHqMPLwxRju9KQkuQAZfY=;
        b=qMj6Irjvj9oOa7633WAxTj6Z8iDKqNZz4M9nWOyFJX4ZmUhyUtfbj6liZRYmekyY2T
         oW7mVeO9uaEvrjHmkDRSrALTgJbdVzcz9LoWM3f8UE+pRABOQVQeYl642DRotNKwJrpD
         B4U6NvFJwgzg/p88G3FGqSgIC2xQmwKgmGWD17m1Bf4ykcH0cMoOJhinSp/+c3hbEiXo
         gyfw0FO7gt/23/rdc3HFIk09iSN5lq3Qd8oeYGQc+8SszWSj7Zasdqz6+Uk9GRwIGrAB
         jukxeM85EUK336DRoSZWrpw1Kl3wuzMHojEZQy5etxzBOHViC5ossoIY6rwBdlU6LdIg
         R41A==
X-Gm-Message-State: AOAM533Y4nzW2czZ3ESqNidznnwVa/msQN4NATAsq5CcA0mMEqI9TF3I
        rMQs6SoABoJROe/3AxjxgHF+0EfkXzShRBlmWVGWxA==
X-Google-Smtp-Source: ABdhPJz3bvhG1Ws0mV6RQ8+jCUxY+7BKNPQgG+z2/+EqJb1aEZa43yvjKlXRtHUY0RkWlQH4TuVaxTU3gsalXisBwsw=
X-Received: by 2002:adf:aa96:: with SMTP id h22mr30612000wrc.405.1634029722328;
 Tue, 12 Oct 2021 02:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211012084443.GA31472@kili>
In-Reply-To: <20211012084443.GA31472@kili>
From:   Gioh Kim <gi-oh.kim@ionos.com>
Date:   Tue, 12 Oct 2021 11:08:06 +0200
Message-ID: <CAJX1Ytb+_dSxk8h2u7JYa0RGuDYe=DEqNCB_Cpxf7d0o9RSAWA@mail.gmail.com>
Subject: Re: [PATCH] block/rnbd-clt-sysfs: fix a couple uninitialized variable bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 12, 2021 at 10:45 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These variables are printed on the error path if match_int() fails so
> they have to be initialized.
>
> Fixes: 2958a995edc9 ("block/rnbd-clt: Support polling mode for IO latency optimization")
> Fixes: 1eb54f8f5dd8 ("block/rnbd: client: sysfs interface functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/block/rnbd/rnbd-clt-sysfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt-sysfs.c b/drivers/block/rnbd/rnbd-clt-sysfs.c
> index 4b93fd83bf79..44e45af00e83 100644
> --- a/drivers/block/rnbd/rnbd-clt-sysfs.c
> +++ b/drivers/block/rnbd/rnbd-clt-sysfs.c
> @@ -71,8 +71,10 @@ static int rnbd_clt_parse_map_options(const char *buf, size_t max_path_cnt,
>         int opt_mask = 0;
>         int token;
>         int ret = -EINVAL;
> -       int i, dest_port, nr_poll_queues;
> +       int nr_poll_queues = 0;
> +       int dest_port = 0;
>         int p_cnt = 0;
> +       int i;
>
>         options = kstrdup(buf, GFP_KERNEL);
>         if (!options)
> --
> 2.20.1
>

Thank you.
Acked-by: Gioh Kim <gi-oh.kim@ionos.com>
