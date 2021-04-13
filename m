Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A80C43462
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 05:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E499613AE
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 05:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344672AbhDMF3Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245541AbhDMF3P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 01:29:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35798C061756
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Apr 2021 22:28:56 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id n138so25349139lfa.3
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Apr 2021 22:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AvM1ldJd1PKthEmfQSYxE8KSNEBVhrFycB3fykwgq2c=;
        b=UK3JH759G5m7p0pnsTXSHGCiELHJAr54O5vcX1IB6nRyAoAETABf7dCAHSlGY/lPhU
         WUXj/erFHsdspCxelTHH6uL8NGXau+QJ3AaAEGL/i8aX1ON2ysWli9CSVKKCPW320tPv
         06lJbsmE+UsWs6YIPzVQikof8W+h9yCRAqa9+2Z13jlUT6BdGNZ06LMW79Tw6QDi8B0S
         McA2kNbpz/P22FYKFoOm4oDwrNbCh+zAJs0QHQ410EXbBr2BZ0hmnefPGl6xdBgPqtHV
         4XCjcpjsCBNvoKGm4ZTU+0B/AL2zpyvfV1S0G9gGfLkhIYS/poU85AqHGMQGVabPY9zO
         FHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AvM1ldJd1PKthEmfQSYxE8KSNEBVhrFycB3fykwgq2c=;
        b=BKnf0VrqpE8UVs6sI3C3wwd322HZbxVTFJE88eYK76Smjkvdnl826XTVV1P7TxSNgj
         eX+iR5Z+kWpBQfgSIQbYzXIipubA0rvdLo9ywF3EMZ/L/wJBb85kPCxMCV8m1CU3NCUN
         lr/zcmyOx3NBK5NUUYHZ0z5vp4W4EpxlVXvgWQxW+xanpm2+z/NVBktLPLvESpQ4Wwp6
         mxsMpPZX1c5wvEBl7PMwYY9NqzjqDnF46t9oqScuVwhS/pZ1cvFez+jjN2LGO58bFTNM
         b4UIL5kTJMduoAdIwcn6LXAWJwce3e1k7CoSiuBcOl8eoN2b9ZVD5dMsNFLCXbsjQsqt
         5Qcw==
X-Gm-Message-State: AOAM5310/bB0QQBEYFTTJls4FcbqttntpjX1KKrKJLnaOBFo50QbCaqk
        upwoL8pdxKvAw09uTozM5UXlJ6E1J5V4MvrlWJB6Gg==
X-Google-Smtp-Source: ABdhPJx9ng30E0BX/dlKP+vG2PKF/myAqIZYQjX8xoWOhcGfWAFEM7eX3+jRMIpdP8gqwgxzRTls3J+2Xp/efIqxLfE=
X-Received: by 2002:ac2:4db9:: with SMTP id h25mr8011757lfe.108.1618291734612;
 Mon, 12 Apr 2021 22:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210412160101.1627882-1-colin.king@canonical.com>
In-Reply-To: <20210412160101.1627882-1-colin.king@canonical.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 13 Apr 2021 10:58:43 +0530
Message-ID: <CAFA6WYM65kjt0rbheAorX9uwWnhd5z7Gqed7a3YxjXMdHai1pw@mail.gmail.com>
Subject: Re: [PATCH][next] KEYS: trusted: Fix missing null return from kzalloc call
To:     Colin King <colin.king@canonical.com>
Cc:     James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 12 Apr 2021 at 21:31, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The kzalloc call can return null with the GFP_KERNEL flag so
> add a null check and exit via a new error exit label. Use the
> same exit error label for another error path too.
>
> Addresses-Coverity: ("Dereference null return value")
> Fixes: 830027e2cb55 ("KEYS: trusted: Add generic trusted keys framework")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/keys/trusted-keys/trusted_core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Ah, it's my bad. Thanks for fixing this issue.

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/trusted-keys/trusted_core.c
> index ec3a066a4b42..90774793f0b1 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -116,11 +116,13 @@ static struct trusted_key_payload *trusted_payload_alloc(struct key *key)
>
>         ret = key_payload_reserve(key, sizeof(*p));
>         if (ret < 0)
> -               return p;
> +               goto err;
>         p = kzalloc(sizeof(*p), GFP_KERNEL);
> +       if (!p)
> +               goto err;
>
>         p->migratable = migratable;
> -
> +err:
>         return p;
>  }
>
> --
> 2.30.2
>
