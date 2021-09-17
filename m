Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF46BC433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Sep 2021 19:52:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D4C60F6E
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Sep 2021 19:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344683AbhIQTxl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 17 Sep 2021 15:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344620AbhIQTxj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Sep 2021 15:53:39 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C70C0617BE
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Sep 2021 12:51:15 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id a20so11455263ilq.7
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Sep 2021 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AO8stvH6wLQIPUW7jVtw5X0QFxjdUv6SibSuWzk36Rk=;
        b=VdePcfsHpNUgpbkw8TARXrR7jC9aG7x/7YmP5iPfWGD+cqXy5vsT4cDu7rBnNIcEY2
         yD1T4FDdiBbNu07dGt+Oo3Pl1m8rZFXCp+kenOQL8Rh0DIeOT2An+WrcS2OP1CWRny+j
         kNopwuwAZdjru1KuowyYEC1EjO5qwmF9ztCrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AO8stvH6wLQIPUW7jVtw5X0QFxjdUv6SibSuWzk36Rk=;
        b=fWa5FCg6pd0GL3DSATHoj3R3kODr2tgFcfe1b5Xyo7GHgEuWUBJUlGJmpOLEqZHjsk
         aMMsz4qGXFr7KTV1P7Vg2lYKWWFHBe+ylrUrjQNyqPJoyc1q1iNPaVBlRLsxUmujHpcT
         KMV4cBeMjO5dnIcoKkCvCPbn5I0szTFKayF3m2zuq35MyfTX3LH9VYLjYOnzMCBCa7XZ
         GcbeU7J7jWRIDprw1Mn2vDjQefehcVtTpPpherGo+qBEyMLfW6dfG9ZKMTu7u4/PqMyg
         g3M3hmGmy3T7lztdmB0HFfFrKkkF6buGaH67gPyBr3iCjkecO1+JWQKJ3YL7FpHGW/NK
         M+oA==
X-Gm-Message-State: AOAM531byFQZwWdkHjLFo0pAsosCijOTyJpox5SrXns1HH+nhtgcsTNb
        5B5ftm5qYDVSvobqr4vjKNwNgo0LWJnvyw==
X-Google-Smtp-Source: ABdhPJyxyQReKKz4tu84Bwe+qlE7F4CIESIh45rd5v0L1v5hVcAdHTQynCIkZLr09Y8vMdCCH8kOrw==
X-Received: by 2002:a05:6e02:1bc9:: with SMTP id x9mr9430081ilv.168.1631908274376;
        Fri, 17 Sep 2021 12:51:14 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id i14sm3879041iog.47.2021.09.17.12.51.12
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 12:51:13 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id h29so11513037ila.2
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Sep 2021 12:51:12 -0700 (PDT)
X-Received: by 2002:a05:6e02:2141:: with SMTP id d1mr5491891ilv.242.1631908271903;
 Fri, 17 Sep 2021 12:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210917114930.47261-1-colin.king@canonical.com>
In-Reply-To: <20210917114930.47261-1-colin.king@canonical.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 17 Sep 2021 21:51:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCv7okdqtfMpjPB9Gg+RvUSqsondN_-jo3xCNn7bRAaq0Q@mail.gmail.com>
Message-ID: <CANiDSCv7okdqtfMpjPB9Gg+RvUSqsondN_-jo3xCNn7bRAaq0Q@mail.gmail.com>
Subject: Re: [PATCH][next] media: uvcvideo: Fix memory leak of object map on
 error exit path
To:     Colin King <colin.king@canonical.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Collin

Thanks for catching it up.

On Fri, 17 Sept 2021 at 13:49, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when the allocation of map->name fails the error exit path
> does not kfree the previously allocated object map. Fix this by
> setting ret to -ENOMEM and taking the free_map exit error path to
> ensure map is kfree'd.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index f4e4aff8ddf7..711556d13d03 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
>         if (v4l2_ctrl_get_name(map->id) == NULL) {
>                 map->name = kmemdup(xmap->name, sizeof(xmap->name),
>                                     GFP_KERNEL);
> -               if (!map->name)
> -                       return -ENOMEM;
> +               if (!map->name) {
> +                       ret = -ENOMEM;
> +                       goto free_map;
> +               }
>         }
>         memcpy(map->entity, xmap->entity, sizeof(map->entity));
>         map->selector = xmap->selector;
> --
> 2.32.0
>


--
Ricardo Ribalda
