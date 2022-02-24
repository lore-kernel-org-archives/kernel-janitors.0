Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C4AC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 24 Feb 2022 23:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiBXXSQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 24 Feb 2022 18:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiBXXSP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 24 Feb 2022 18:18:15 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76E11B018F
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Feb 2022 15:17:44 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 6-20020a05600c024600b0038125fa8e43so240763wmj.0
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Feb 2022 15:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8/1Ko41seG/Gcm0WMFG2nw3d5RUz09+SdFfLxzqmI+Y=;
        b=3KjdLrszxDrpmXCBbrp8XDykgWJnHxMG4vGZnwF3Upt8qOUzgB1gxI4RelXYRvEYpk
         rnZkYzC09Obn0wsG6q4clYgu6Gp3ZZs0tAcfZ2RdalJ/EDE4TD8Oxg68XLdpSKVESjE1
         N44ZN7jWLfPpHwDq7Ux4HxISj/Y++/fKtqZNF6+vsNi2cQHYXU7TyP6XVrlgkVJy1IG6
         f8WDxtTncheEKCF0O5DIGgLUITyURTLKWlA5WzYthQBCi3ey/kC2ojlgwLys1oC0qS7z
         tNRgSxkw6k95uZCU7rhdFeGBqC4arUXaN0ybpNHt4nrQLaAx/xUCpfuZFSzx+tngDtDZ
         BDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8/1Ko41seG/Gcm0WMFG2nw3d5RUz09+SdFfLxzqmI+Y=;
        b=af7VG6ZHqqBuT7+XG+esaPxndOtTOQCy0ulW6wBtqSoPbNrGET11fPM+9khPfmzqZ4
         noLoWfvj6D4nBHjKcKr/YQL25g74Q0tHkPZePoBL/Z1wVeu/Asm66FSF10ZpT3ngJhNF
         0inkNp088/FuJ6F5ZLPKNK06DRLohoy9BDwfWY2cilg9IxKKab9yw4qLpkMEh72F3HJT
         JdaixJeDtO/Huak5YVJs7SgynmR38NwZc1j/zBIOHEuK1Pb8Qim4cxwFcD4hNp0NoHPO
         aFuPhbzUZOQMUZF/m2dCS2jWWXJQYdaOIV7CMA/YGXk2glEi3/52peTRBBKsPSbtCwqT
         Ev5w==
X-Gm-Message-State: AOAM531GFvV/gE38kjv8n0gfU0inRbVouQRkvQPJByp2FsExKwYFymTG
        +I0pPJ3ishneFln9WAWd1O1lDw==
X-Google-Smtp-Source: ABdhPJylRiAk8xI22jOcrIqwiVi33vbve6UeNUFi91annFZKh3Uzb8qARzjZWowIh8iJLzYTHFumMQ==
X-Received: by 2002:a1c:2544:0:b0:381:18a:a46d with SMTP id l65-20020a1c2544000000b00381018aa46dmr294751wml.26.1645744663219;
        Thu, 24 Feb 2022 15:17:43 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id e33-20020a05600c4ba100b003810c690ba2sm3136456wmp.3.2022.02.24.15.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 15:17:42 -0800 (PST)
Date:   Thu, 24 Feb 2022 23:17:40 +0000
From:   Phillip Potter <phil@philpotter.co.uk>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Larry Finger <Larry.Finger@lwfinger.net>,
        Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] staging: r8188eu: remove redundant variable
 reg_0x143
Message-ID: <YhgSFC0VDvdfsryB@equinox>
References: <20220224230658.151338-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224230658.151338-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Feb 24, 2022 at 11:06:58PM +0000, Colin Ian King wrote:
> Variable reg_0x143 is being assigned a value, however is not being
> read. The variable is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> index cf58dfc3ff4d..53ebea311723 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
> @@ -189,7 +189,6 @@ static void efuse_read_phymap_from_txpktbuf(
>  {
>  	u16 dbg_addr = 0;
>  	u32 start  = 0, passing_time = 0;
> -	u8 reg_0x143 = 0;
>  	__le32 lo32 = 0, hi32 = 0;
>  	u16 len = 0, count = 0;
>  	int i = 0;
> @@ -209,7 +208,7 @@ static void efuse_read_phymap_from_txpktbuf(
>  
>  		rtw_write8(adapter, REG_TXPKTBUF_DBG, 0);
>  		start = jiffies;
> -		while (!(reg_0x143 = rtw_read8(adapter, REG_TXPKTBUF_DBG)) &&
> +		while (!rtw_read8(adapter, REG_TXPKTBUF_DBG) &&
>  		       (passing_time = rtw_get_passing_time_ms(start)) < 1000)
>  			rtw_usleep_os(100);
>  
> -- 
> 2.34.1
> 

Looks good to me, thanks Colin.

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
