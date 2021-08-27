Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B34C432BE
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 10:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AB1D60F58
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Aug 2021 10:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244708AbhH0KPs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Aug 2021 06:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244492AbhH0KPr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Aug 2021 06:15:47 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1A2C061757
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Aug 2021 03:14:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id x27so13346137lfu.5
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Aug 2021 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z3ngnU6mQsa8AKptZHi1VtQo5GAyhkjpRS38k/DoWag=;
        b=LzlbqQOyonbSwhbqApdTTNaIXC+rcCo+F+hADxL87xJlt9Zrii+r7VBGCvwGIzKjh2
         IWuiRgTVifcEm6F4xEOfZm3V4QyN71gpIjiw/VyTnOLZcWDmOtjx/6L3U2tjQIPVObxs
         aItjYn23eH9+yTrwupKd899LAgY1frC5vCypsZEdvJUVlk/2ANzl4nwSHkq3HEjwMJCi
         cVR7iYxalDdZgMjijUo2NvE0o95DyAYF6nk8x/iGawzDmQZvWK+90sLW6/zJPTSkIiD7
         Lb4xaWFlqNxV8Vel4YK16S4FFneHJTdIvrRaifWNzoHFtxtXXEK0TaP69A4+Ci0al2tR
         NSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z3ngnU6mQsa8AKptZHi1VtQo5GAyhkjpRS38k/DoWag=;
        b=GjnMJXAtmPi1TYEsHYzTH7a00xtf+jJuIgd9gZ2iRZs7hYnmUCvcM3WSuAq6H5hMXV
         trMNh/5zjn0ifswLbH0Db0OrNOaFExoZaT4Sf1YSnkB8pFXcfZCQ5QOE8i1c0LQxoXwK
         b3Q7Zru6cGD43eza8KhYGy9XdNm6nz+8lXYeHsXf3dnNXQ5Xf2jlN1zV24lUZwWDr3FL
         1HZjQAUqjmVelEMgJkfKd2hVtOs6RpyX1vnRLHEExPqW9QIaLzMkBdfX3LFje6/U1CNt
         ekCFhmr/HQiBIqTZ80jh6SzY604+1wB4EwRUHYNvdBAn8UiWIIJdk4vbJxNSHGvBgZPw
         aSpw==
X-Gm-Message-State: AOAM530+uTa1UWsUMfJJubNnqs2jTz5g9YAbQQguKRXC1lhW5IW2XKOE
        FI+3Gtt0Pq4eh9k9a9S3njx2pS5NoQeT4Q==
X-Google-Smtp-Source: ABdhPJwIeQfFgY5fYY3LtjdbMpk3wtj6oP8xF0+NsJUzoCGQjeTgzrJaN7LWjVCuFRlDoA3ilv8ESg==
X-Received: by 2002:a05:6512:3494:: with SMTP id v20mr6264410lfr.637.1630059297258;
        Fri, 27 Aug 2021 03:14:57 -0700 (PDT)
Received: from kari-VirtualBox (85-23-89-224.bb.dnainternet.fi. [85.23.89.224])
        by smtp.gmail.com with ESMTPSA id n25sm639479ljj.42.2021.08.27.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 03:14:56 -0700 (PDT)
Date:   Fri, 27 Aug 2021 13:14:55 +0300
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] fs/ntfs3: Delete dead code in ni_write_frame()
Message-ID: <20210827101455.6sdbvsdpzhmcvtiu@kari-VirtualBox>
References: <20210827100528.GC9449@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827100528.GC9449@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 27, 2021 at 01:05:29PM +0300, Dan Carpenter wrote:
> This code sets "lznt" to NULL and then kfrees it.  Kfreeing a NULL is a
> no-op so delete the code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  fs/ntfs3/frecord.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
> index c3121bf9c62f..c1a9f124f771 100644
> --- a/fs/ntfs3/frecord.c
> +++ b/fs/ntfs3/frecord.c
> @@ -2742,7 +2742,6 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
>  	}
>  
>  	mutex_lock(&sbi->compress.mtx_lznt);
> -	lznt = NULL;
>  	if (!sbi->compress.lznt) {
>  		/*
>  		 * lznt implements two levels of compression:
> @@ -2758,14 +2757,12 @@ int ni_write_frame(struct ntfs_inode *ni, struct page **pages,
>  		}
>  
>  		sbi->compress.lznt = lznt;
> -		lznt = NULL;
>  	}
>  
>  	/* compress: frame_mem -> frame_ondisk */
>  	compr_size = compress_lznt(frame_mem, frame_size, frame_ondisk,
>  				   frame_size, sbi->compress.lznt);
>  	mutex_unlock(&sbi->compress.mtx_lznt);
> -	ntfs_free(lznt);
>  
>  	if (compr_size + sbi->cluster_size > frame_size) {
>  		/* frame is not compressed */
> -- 
> 2.20.1
> 
> 
