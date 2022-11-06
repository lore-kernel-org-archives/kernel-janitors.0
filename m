Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91A8C4332F
	for <kernel-janitors@archiver.kernel.org>; Sun,  6 Nov 2022 15:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiKFPEL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 6 Nov 2022 10:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiKFPEJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 6 Nov 2022 10:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290012BFD
        for <kernel-janitors@vger.kernel.org>; Sun,  6 Nov 2022 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667746992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bcF/g3FxS3vq7HBJy0REl0nrtkod0xAAfETE5zlqifI=;
        b=FJCl8xXzublitwiF6efe4nzk+IaVeYFn5ImJxiWRQS1UmVZ0IQUk1/TobRQoIjvvSsZv6g
        wWxOZQ7dMuVaFmCVxjDBaGCvX2vF1y/TSs3REiW+8F+q+NTzZWGxyhHyXiJ1KQMKgFUtAi
        TQVmON6aTm9jM+k/021abF6f8HYzNJo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-ssoUOl8gPgiuGZevgLNbxQ-1; Sun, 06 Nov 2022 10:03:10 -0500
X-MC-Unique: ssoUOl8gPgiuGZevgLNbxQ-1
Received: by mail-wm1-f71.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso4872225wmb.4
        for <kernel-janitors@vger.kernel.org>; Sun, 06 Nov 2022 07:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcF/g3FxS3vq7HBJy0REl0nrtkod0xAAfETE5zlqifI=;
        b=kJFL/Spe6eE55N1MIWwxs0V+QI42xwENndVoVU2S1xWWQTqDT3NvRXPa5BnQFyxVco
         Rx3SDYJ9u6RPkiJwV0wEnfjwY1ZyzU/7pShOUvV/3v8ZqXbndWEYIQNNAu/dcNJh2w8Y
         0jSeI2PVGpyjrSuy4d5wfb97yQrCkDE7NlfpAbGcV8fjQe8gABhXmeAr/DXaDoRAQnBy
         NxOPqnjyr+EYchMC/lWCEJQZSftdTlVJzj4orq4FZi1AXFR9KhOwgo1p9Ds1U69N8HE8
         wWH0ABkz1gh8Id3OfGfZJcmk4Hvk69+wNs0mY7iwXOhdDv5rV/HmrE+w5zEczccS5vh1
         yRGQ==
X-Gm-Message-State: ACrzQf1j0ephYXZEymTbWwVjCozSfCD7D0SAqmSMzZOnnVMoFLHxHpQe
        zXRB39MBXp38aCCHUmAevZnkxqFL0OEJkOOJP27bB3esWxMVkssXAZPg9hISRjeBDSujc9U0T6o
        QUBMI0nI4QLIaIkcAsGbn86FDKdk=
X-Received: by 2002:a05:600c:1e26:b0:3cf:a26c:40fd with SMTP id ay38-20020a05600c1e2600b003cfa26c40fdmr4425825wmb.178.1667746989122;
        Sun, 06 Nov 2022 07:03:09 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6NP1vK4TMXUboRquP6+tSCh+AHzV6sI7bY14Puj2TBtcfA0pN9gttJH+/Bjw9GwN8u/+dMhg==
X-Received: by 2002:a05:600c:1e26:b0:3cf:a26c:40fd with SMTP id ay38-20020a05600c1e2600b003cfa26c40fdmr4425807wmb.178.1667746988895;
        Sun, 06 Nov 2022 07:03:08 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust979.9-3.cable.virginm.net. [82.17.115.212])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003cfa3a12660sm9045872wms.1.2022.11.06.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 07:03:08 -0800 (PST)
Date:   Sun, 6 Nov 2022 15:03:07 +0000
From:   Aaron Tomlin <atomlin@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 18/30] module: Use kstrtobool() instead of strtobool()
Message-ID: <20221106150307.ti4xd6ehh4ce2e25@ava.usersys.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
 <bb37ff26b0c748d0ca883d8f301190cd1177aad2.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb37ff26b0c748d0ca883d8f301190cd1177aad2.1667336095.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue 2022-11-01 22:14 +0100, Christophe JAILLET wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is part of a serie that axes all usages of strtobool().
> Each patch can be applied independently from the other ones.
> 
> The last patch of the serie removes the definition of strtobool().
> 
> You may not be in copy of the cover letter. So, if needed, it is available
> at [1].
> 
> [1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
> ---
>  kernel/module/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index ff2dfd1f548d..79e17522e196 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -17,6 +17,7 @@
>  #include <linux/fs.h>
>  #include <linux/kernel.h>
>  #include <linux/kernel_read_file.h>
> +#include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  #include <linux/elf.h>
> @@ -2649,7 +2650,7 @@ static int unknown_module_param_cb(char *param, char *val, const char *modname,
>  	int ret;
>  
>  	if (strcmp(param, "async_probe") == 0) {
> -		if (strtobool(val, &mod->async_probe_requested))
> +		if (kstrtobool(val, &mod->async_probe_requested))
>  			mod->async_probe_requested = true;
>  		return 0;
>  	}
> -- 
> 2.34.1
> 

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin

