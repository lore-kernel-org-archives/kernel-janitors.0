Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B31EC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  4 Mar 2022 18:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237792AbiCDSlY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 4 Mar 2022 13:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiCDSlX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 4 Mar 2022 13:41:23 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D2C1637F3
        for <kernel-janitors@vger.kernel.org>; Fri,  4 Mar 2022 10:40:34 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b11so15634779lfb.12
        for <kernel-janitors@vger.kernel.org>; Fri, 04 Mar 2022 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qNQzyNmyOmztuypwmQngSLxbTxrEy376+DYlmCUWE8=;
        b=iBFf7P0UyD6s0JdSRHiObjKqGxjmKXIT95TZyobrYEEh7mo1QUAg/XYd3zDcZuMTrA
         6rwrWLwtQTUHPOotGptjAYNcbUAMOR9IlX5tt9en2ZXfLSl6nXBScDvpGSGNjMgQKhe1
         lmWL2uu4buvWQCiT1eiv6s32MuO0p+Yt3oq1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qNQzyNmyOmztuypwmQngSLxbTxrEy376+DYlmCUWE8=;
        b=L407ClXtxR4TTtc+BizBZMvCDMiTjqcDPBbm2huLhy7joH/ju6LQzDbAgGqSYYDbUl
         cQ7NHz58ZwkQQ/TquSdzcjBfDbYLecZQALkoBbYqJq4znFYJ7VDHfKgj1o/E/c9SjQCm
         Va0mPJ43LeXRv8vuETNiIi3q4SPW1JLB7S8BDvNr8dna1/ZZI/NhlEDH5OrN0SDqLdve
         toKITMExG2ENexJO4TmdhZIYAyhffEy13z1iWssxqMGlWwg4Jw96Nr0LfM7eHdCJ8axr
         ETwdPxvOjoO76qemEf95wpVBhU+048ymc+XozYsxBItegkw6xte3Tz3wY9m3X7ET6mP3
         mqFw==
X-Gm-Message-State: AOAM531aAXd0K7CkIDYMauEsmuD79q7WGfuAKIuGRmPyvN8wXmzfLDKc
        ynI8VKoY7b2ZYJok5uW7r1/tMgdfa5XECnf1pMDjOblFIDA=
X-Google-Smtp-Source: ABdhPJxYH0XaXIvu90Yw8DrkwPnOM3U0tPXXxhXwz9iyFElvZKw8yEoH44ZBqhKVOQtD/XU+7yelFi4xr9CGlw32+4s=
X-Received: by 2002:a05:6512:4017:b0:443:b9ee:2a3d with SMTP id
 br23-20020a056512401700b00443b9ee2a3dmr29999lfb.593.1646419230307; Fri, 04
 Mar 2022 10:40:30 -0800 (PST)
MIME-Version: 1.0
References: <20220304131718.GF28739@kili>
In-Reply-To: <20220304131718.GF28739@kili>
From:   Dimitris Michailidis <d.michailidis@fungible.com>
Date:   Fri, 4 Mar 2022 10:40:19 -0800
Message-ID: <CAOkoqZktHZ8Aqf5-WFuOt8ngt5cnbH48kpYKMnMFBhG7diXvPQ@mail.gmail.com>
Subject: Re: [bug report] net/funeth: probing and netdev ops
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 4, 2022 at 5:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Dimitris Michailidis,
>
> The patch ee6373ddf3a9: "net/funeth: probing and netdev ops" from Feb
> 24, 2022, leads to the following Smatch static checker warning:
>
>         drivers/net/ethernet/fungible/funeth/funeth_main.c:477 fun_free_rings()
>         warn: 'rxqs' was already freed.
>
> drivers/net/ethernet/fungible/funeth/funeth_main.c
>     443 static void fun_free_rings(struct net_device *netdev, struct fun_qset *qset)
>     444 {
>     445         struct funeth_priv *fp = netdev_priv(netdev);
>     446         struct funeth_txq **xdpqs = qset->xdpqs;
>     447         struct funeth_rxq **rxqs = qset->rxqs;
>     448
>     449         /* qset may not specify any queues to operate on. In that case the
>     450          * currently installed queues are implied.
>     451          */
>     452         if (!rxqs) {
>     453                 rxqs = rtnl_dereference(fp->rxqs);
>     454                 xdpqs = rtnl_dereference(fp->xdpqs);
>     455                 qset->txqs = fp->txqs;
>     456                 qset->nrxqs = netdev->real_num_rx_queues;
>     457                 qset->ntxqs = netdev->real_num_tx_queues;
>     458                 qset->nxdpqs = fp->num_xdpqs;
>     459         }
>     460         if (!rxqs)
>     461                 return;
>     462
>     463         if (rxqs == rtnl_dereference(fp->rxqs)) {
>     464                 rcu_assign_pointer(fp->rxqs, NULL);
>     465                 rcu_assign_pointer(fp->xdpqs, NULL);
>     466                 synchronize_net();
>     467                 fp->txqs = NULL;
>     468         }
>     469
>     470         free_rxqs(rxqs, qset->nrxqs, qset->rxq_start, qset->state);
>     471         free_txqs(qset->txqs, qset->ntxqs, qset->txq_start, qset->state);
>     472         free_xdpqs(xdpqs, qset->nxdpqs, qset->xdpq_start, qset->state);
>     473         if (qset->state == FUN_QSTATE_DESTROYED)
>     474                 kfree(rxqs);
>                         ^^^^^^^^^^^
> Should this return or set "rxqs = NULL" or something?
>
>     475
>     476         /* Tell the caller which queues were operated on. */
> --> 477         qset->rxqs = rxqs;
>                 ^^^^^^^^^^^^^^^^^^
> Only bad things will happen with safing this freed pointer.

There is a legitimate use case of passing this value back, namely using the
pointer value itself to identify the queue set that was operated on.
One must not
dereference the pointer of course. The same is true for other fields here, e.g.,
xdpqs on the next line may also be pointing to freed memory. Note also that the
caller may initialize this field to the same value so it isn't the
case that if line 477
were removed the field could not be pointing to freed memory.

Having said that there isn't a current caller that uses these pointers
even as just
values if they've asked for memory to be freed. I don't think there's
a bug here though.

>
>     478         qset->xdpqs = xdpqs;
>     479 }
>
> regards,
> dan carpenter
