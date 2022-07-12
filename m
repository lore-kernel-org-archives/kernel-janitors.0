Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA5BCCA47C
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Jul 2022 11:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbiGLLJf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Jul 2022 07:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiGLLJd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Jul 2022 07:09:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4F0AF76A
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 04:09:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id e28so9753867lfj.4
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Jul 2022 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xVQOPlTnuA1yYhPt8Wh3gI7FjQUx1QY7F8FI0tZWYAY=;
        b=A7XXKjFrCEue0kURaD9nT4FN22E5h3lG+vmU0ZFaKnYQoZhHQeza8pmqyUxUtN84/f
         VCySaEG5ncb10Gie42hSd1OPPJhNiRor+oTvAhKmeRVql9oPocLIhV1Vq7JqgRzjwAtZ
         37TGhrhpwUIawgBGjjOwFzn793fln8sLLCvy6ihwGzI7+WX69trd3LhEEwwSlwyfTs54
         r7Q4RcLrf/pZq4dYH+iSh+fYKmAHSFxL5Jlhm3A+SLbrXndrqGKPojIDFIakbwM2R6QW
         FJjyw2FyQdBzN5SVOsBHiHW9WunvOLHBhLzSujlp1HGMbjMxrpW/987MYwu2JIDV/6Cv
         8aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xVQOPlTnuA1yYhPt8Wh3gI7FjQUx1QY7F8FI0tZWYAY=;
        b=hecmrcatKPiJ8BhGu+3engQxcl9EzX4kUGc3rSGqp+l1ZK+/pOJ6p5+TIt5DaCCje1
         aJH8PZb3HCDBaslDM7imYL5iU86VvTwlIq0ZjGInXWuS+vbslHtLE4oa2yNHgPgvOKgA
         WkknOuV5K8WavawYSS2A9+dw+9i4uBQ7wYmF+697Tzq5TDfw6C31ZKkk/OOHdqj256wT
         cUIvQnbsMPPfbaleMRigpjiHnMt4LBkjhqNpDcHemOVBIzEmGf4lnWAJ1kFyEGOXif4R
         JBObW1KPesyZvFB4qjkiKvsSejPtfbOIxUAgbnOtpDGOqbuS4mcIjUsQsu3YQrfuOSIy
         1dwQ==
X-Gm-Message-State: AJIora8aQMbfQkzjvTVLUohyW1ccN568Wc4+n/kFbdQXSsMGgiO3F8L0
        O3mbZRqLLca0ZgG3KEUvTfiW3/Y9Wt5meAV40kYEEg==
X-Google-Smtp-Source: AGRyM1tdIQpFjs4FQN5KurKmOeod20NGBrauxzzr9JmeaXPOXMwNM060XOMcv3FEpzY2zQWVFbLcYiMaf9pn0ReFt88=
X-Received: by 2002:a05:6512:ad6:b0:481:1a75:44c with SMTP id
 n22-20020a0565120ad600b004811a75044cmr15165411lfu.167.1657624172374; Tue, 12
 Jul 2022 04:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656155715.git.christophe.jaillet@wanadoo.fr> <b3b78926569445962ea5c3b6e9102418a9effb88.1656155715.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b3b78926569445962ea5c3b6e9102418a9effb88.1656155715.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jul 2022 13:08:53 +0200
Message-ID: <CAPDyKFr2VpKVtFhNYPjy+uXKRNVTXS6LaMoAkv8u9YDeXTnnBQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] memstick/ms_block: Fix a memory leak
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 25 Jun 2022 at 14:55, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'erased_blocks_bitmap' is never freed. As it is allocated at the same time
> as 'used_blocks_bitmap', it is likely that it should be freed also at the
> same time.
>
> Add the corresponding bitmap_free() in msb_data_clear().
>
> Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> This patch is speculative.
> ---
>  drivers/memstick/core/ms_block.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index f8f151163667..f8fdf88fb240 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -1947,6 +1947,7 @@ static void msb_data_clear(struct msb_data *msb)
>  {
>         kfree(msb->boot_page);
>         bitmap_free(msb->used_blocks_bitmap);
> +       bitmap_free(msb->erased_blocks_bitmap);
>         kfree(msb->lba_to_pba_table);
>         kfree(msb->cache);
>         msb->card = NULL;
> --
> 2.34.1
>
