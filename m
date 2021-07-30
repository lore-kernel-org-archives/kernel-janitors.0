Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD76BC4338F
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Jul 2021 23:22:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A716560EBD
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Jul 2021 23:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhG3XWr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Jul 2021 19:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbhG3XWq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Jul 2021 19:22:46 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CB2C0613C1
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jul 2021 16:22:40 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id i39-20020a9d17270000b02904cf73f54f4bso2946ota.2
        for <kernel-janitors@vger.kernel.org>; Fri, 30 Jul 2021 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=pwUK4buSZcvf3DN+FO7Z+DrF4By3Sfk7ycTiv97zWSc=;
        b=ANqsuxC+ISFfExBd8SDvJNuw2VBmk76xTZwXznxWPleUmVjQk76/5b72Atfvti+UvG
         7PsivDsZlAhi43o+rfLhvE1SiKXEMoY6L9patWN5jOXl0akPvMMDVR/gR2Ikh52pVwLQ
         cO28RzuOoVT0lXWhsEMXkAQllCkWzigL5/5eIHG5up++f0Zt9CIXVMDybNBsPDuJA0WP
         jEyZQ2FjgYGjczr9mM8FBiNYYJBXzAdoemXoNesqjH/MryniZJziZj2UFiGIuJKKTKou
         XDQzltZZG5sWqgK8+Vni0N4sGb1b5qRK+rMn7GJHUxH++M9H5mblhC/Ik8j6gGnAygoD
         NL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=pwUK4buSZcvf3DN+FO7Z+DrF4By3Sfk7ycTiv97zWSc=;
        b=qnGmqARqYJvt82g8ESU4cu4/EB52Mw/tl3d6ecMGcywNice2xq8HilRhWJWusJRw9i
         AfC7qaPYc4RWhexqJwwX0ldHtLnzSpfdxvpEH+NaTqrOCzwPSjvA+1FxsfrLHeLuUqeW
         zL7BiIY/3M/76f1pfQ5C+s2akotdPsjZXeX2+xMLm3IxMBLnYb2rjCpdCYmQ/kINAIPI
         CuY9aOXGVBeCCXAV7As49Am+gbTaRITkZieGLfdefyTr/QMh2JrSROKJCwY/yAQnflNi
         cTih7nvIFkmJd9R/cLIKQVzx1iOJpBRX2f2nndiY0fNgZrO10S4LQbNPBt6aSSxc8Kqr
         8z1A==
X-Gm-Message-State: AOAM531Lw9IhMQcpLec7Nn2jlKAFhQWriYWLP8f9fJpJW2UjWk74lgVX
        l6Cyh8/4cpVhguI6J65x5A==
X-Google-Smtp-Source: ABdhPJyh3Fz2Hd+JeZI8KKHXn+58U1SQu4Dle6Z99LFZInuhCZfoD+YMmorkUPE85Ekztoguw0f8vw==
X-Received: by 2002:a05:6830:18cd:: with SMTP id v13mr3930785ote.13.1627687359923;
        Fri, 30 Jul 2021 16:22:39 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
        by smtp.gmail.com with ESMTPSA id i205sm544372oif.14.2021.07.30.16.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 16:22:39 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:3c13:1718:6a7:97c2])
        by serve.minyard.net (Postfix) with ESMTPSA id 1D847180058;
        Fri, 30 Jul 2021 23:22:38 +0000 (UTC)
Date:   Fri, 30 Jul 2021 18:22:36 -0500
From:   Corey Minyard <minyard@acm.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi: ssif_bmc: Uninitialized return in ssif_bmc_write()
Message-ID: <20210730232236.GE3406@minyard.net>
Reply-To: minyard@acm.org
References: <20210730150801.GA1074@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730150801.GA1074@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 30, 2021 at 06:08:01PM +0300, Dan Carpenter wrote:
> I accidentally introduced a bug in my previous patch.  The "ret"
> variable needs to be initialized to prevent returning uninitialized
> data.

Thanks Dan, it's queued.

-corey

> 
> Fixes: f9714eb04364 ("ipmi: ssif_bmc: Return -EFAULT if copy_from_user() fails")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Sorry!
> 
>  drivers/char/ipmi/ssif_bmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> index ce8cd8364a3f..acdb1d9cb5c0 100644
> --- a/drivers/char/ipmi/ssif_bmc.c
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -80,7 +80,7 @@ static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t
>  	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>  	struct ssif_msg msg;
>  	unsigned long flags;
> -	ssize_t ret;
> +	ssize_t ret = 0;
>  
>  	if (count > sizeof(struct ssif_msg))
>  		return -EINVAL;
> -- 
> 2.20.1
> 
