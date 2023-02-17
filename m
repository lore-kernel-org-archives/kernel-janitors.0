Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDF7C61DA4
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Feb 2023 01:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjBQBgJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 16 Feb 2023 20:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjBQBgG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 16 Feb 2023 20:36:06 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F62582A7
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 17:36:03 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id m2so4055545plg.4
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Feb 2023 17:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ7SflY2meS6XlN65Pv9owj6VZSWx0v9fxvbNqNRU2A=;
        b=TuVEX+qGEOUHn8Q85BMZaJTFL4PfnJ6dyTgJSh855/3O5hoR7zSrXx4Mb9hMyTUns/
         mv9/jupshxEfehziAzsTyQPENBDr/qVKOPL1s/DmqQ2IXrmmJPeKfcNRiubnhki5ZLAT
         tpfIw+kE4wV8D3CWzH21tpEICoFPC1uB2JH9NCz6CmTjc/2Pm3st+ODgRFFgGUG229nK
         cowrXO+7/RXG6tedXHb2Yub7xn7Z12DQ+GwN0hNwTfJG1wwmBKl5za5FOBDu6As+00U5
         0UrMmcngdbjvHtxn8h/W3uX2wlo7jGEcDk5sEvEqEffcvdR3L0sbVN+4xXlnzmyxH2MQ
         /seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ7SflY2meS6XlN65Pv9owj6VZSWx0v9fxvbNqNRU2A=;
        b=esJtx/LeW6lXy+EaJZVSReB0Jrganw/ecmCAiOcuyk1Pc4oDJ9+Rwu60I2OdZ85y7J
         F4D76bzIy+F2fmlsRpZsxlWGjwYhuy3nZw2NSVlyErAqdcYbd7Yu/Sr4l+wkmBNhk5Wx
         q2P6NV2hjHOLeyuEHYjJTt70WlnAIsGE+aMZFi0LXih1ytLej3+7pRxTN0H+Sie0zJzt
         gMOJBvreV24Y7pOmgXbZwMQcbQDgPDXla3UDPTb6k3zl7k+E6g9TRVMj6cINla0F4eN2
         52AmT0MtVj72rHqXh3y0C8aw9lDi8+2Xwe/dKIjsylkpG3eahdtVLUlZzfjT5FmLPO4u
         0u1A==
X-Gm-Message-State: AO0yUKVWTLiPuyTYkbCp9+e5ymZhpmr+5Zra1R7iDA97b6tlPH0ToCPk
        UGu0vUv3QcyAjeuAIrcbjuuGaBl/vgQ=
X-Google-Smtp-Source: AK7set8idwkFvKNHstL6OpY0YXsSIDJQZgqTyU2bM7b8VMyOpIk93NwxYMKGZUWBwAglESfMAk7a+g==
X-Received: by 2002:a17:90b:4f44:b0:234:1a60:a6b0 with SMTP id pj4-20020a17090b4f4400b002341a60a6b0mr9129403pjb.34.1676597763315;
        Thu, 16 Feb 2023 17:36:03 -0800 (PST)
Received: from localhost ([156.236.96.165])
        by smtp.gmail.com with ESMTPSA id js8-20020a17090b148800b00234afca2498sm1054461pjb.28.2023.02.16.17.36.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 17:36:03 -0800 (PST)
Date:   Fri, 17 Feb 2023 09:41:57 +0800
From:   Yue Hu <zbestahu@gmail.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Sandeep Dhavale <dhavale@google.com>,
        kernel-janitors@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        huyue2@coolpad.com, zhangwen@coolpad.com
Subject: Re: [PATCH] erofs: fix an error code in
 z_erofs_init_zip_subsystem()
Message-ID: <20230217094157.00005eb4.zbestahu@gmail.com>
In-Reply-To: <Y+4d0FRsUq8jPoOu@kili>
References: <Y+4d0FRsUq8jPoOu@kili>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 16 Feb 2023 15:13:04 +0300
Dan Carpenter <error27@gmail.com> wrote:

> Return -ENOMEM if alloc_workqueue() fails.  Don't return success.
> 
> Fixes: d8a650adf429 ("erofs: add per-cpu threads for decompression as an option")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Yue Hu <huyue2@coolpad.com>

> ---
>  fs/erofs/zdata.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 8ea3f5fe985e..3247d2422bea 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -475,8 +475,10 @@ int __init z_erofs_init_zip_subsystem(void)
>  
>  	z_erofs_workqueue = alloc_workqueue("erofs_worker",
>  			WQ_UNBOUND | WQ_HIGHPRI, num_possible_cpus());
> -	if (!z_erofs_workqueue)
> +	if (!z_erofs_workqueue) {
> +		err = -ENOMEM;
>  		goto out_error_workqueue_init;
> +	}
>  
>  	err = erofs_init_percpu_workers();
>  	if (err)

